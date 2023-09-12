import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';

import '../utils/util.dart';

class SpinningWheel extends StatefulWidget {
  final double width;
  final double height;
  final Image image;
  final int dividers;
  final double initialSpinAngle;
  final double spinResistance;
  final bool canInteractWhileSpinning;
  final Image? secondaryImage;
  final double? secondaryImageHeight;
  final double? secondaryImageWidth;
  final double? secondaryImageTop;
  final double? secondaryImageLeft;
  final Function(int)? onUpdate;
  final Function(int)? onEnd;
  final Stream<double>? shouldStartOrStop;

  SpinningWheel(
    this.image, {
    required this.width,
    required this.height,
    required this.dividers,
    this.initialSpinAngle = 0.0,
    this.spinResistance = 0.5,
    this.canInteractWhileSpinning = true,
    this.secondaryImage,
    this.secondaryImageHeight,
    this.secondaryImageWidth,
    this.secondaryImageTop,
    this.secondaryImageLeft,
    this.onUpdate,
    this.onEnd,
    this.shouldStartOrStop,
  })  : assert(width > 0.0 && height > 0.0),
        assert(spinResistance > 0.0 && spinResistance <= 1.0),
        assert(initialSpinAngle >= 0.0 && initialSpinAngle <= (2 * pi));

  @override
  _SpinningWheelState createState() => _SpinningWheelState();
  
}

class _SpinningWheelState extends State<SpinningWheel>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _animation;

  SpinVelocity? _spinVelocity;
  NonUniformCircularMotion? _motion;

  Offset? _localPositionOnPanUpdate;
  double _totalDuration = 0;
  double _initialCircularVelocity = 0;
  double _dividerAngle = 0;
  double _currentDistance = 0;
  double _initialSpinAngle = 0;
  int _currentDivider = 0;
  bool _isBackwards = false;
  DateTime? _offsetOutsideTimestamp;
  RenderBox? _renderBox;
  StreamSubscription<double>? _subscription;

  @override
  void initState() {
    super.initState();

    _spinVelocity = SpinVelocity(width: widget.width, height: widget.height);
    _motion = NonUniformCircularMotion(resistance: widget.spinResistance);

    _animationController = AnimationController(
      vsync: this,
      duration: Duration(seconds: 0),
    );
    _animation = Tween(begin: 0.0, end: 1.0).animate(
        CurvedAnimation(parent: _animationController, curve: Curves.linear));

    _dividerAngle = _motion!.anglePerDivision(widget.dividers);
    _initialSpinAngle = widget.initialSpinAngle;

    _animation.addStatusListener((status) {
      if (status == AnimationStatus.completed) _stopAnimation();
    });

    if (widget.shouldStartOrStop != null) {
      _subscription = widget.shouldStartOrStop!.listen(_startOrStop);
    }
  }

  _startOrStop(double? velocity) {
    if (_animationController.isAnimating) {
      _stopAnimation();
    } else {
      var pixelsPerSecondY = velocity ?? 8000.0;
      _localPositionOnPanUpdate = Offset(250.0, 250.0);
      _startAnimation(Offset(0.0, pixelsPerSecondY));
    }
  }

  double get topSecondaryImage =>
      widget.secondaryImageTop ??
      (widget.height / 2) - (widget.secondaryImageHeight! / 2);

  double get leftSecondaryImage =>
      widget.secondaryImageLeft ??
      (widget.width / 2) - (widget.secondaryImageWidth! / 2);

  double get widthSecondaryImage => widget.secondaryImageWidth ?? widget.width;

  double get heightSecondaryImage =>
      widget.secondaryImageHeight ?? widget.height;

      
  void _updateAnimationValues() {
  if (_animationController.isAnimating) {
    var currentTime = _totalDuration * _animation.value;
    _currentDistance = _motion!.distance(_initialCircularVelocity, currentTime);
    if (_isBackwards) {
      _currentDistance = -_currentDistance;
    }
  }
  var modulo = _motion!.modulo(_currentDistance + _initialSpinAngle);
  _currentDivider = widget.dividers - (modulo ~/ _dividerAngle);
  if (_animationController.isCompleted) {
    _initialSpinAngle = modulo;
    _currentDistance = 0;
  }
}

  @override
  Widget build(BuildContext context) {
    return Container(
      height: widget.height,
      width: widget.width,
      child: Stack(
        children: [
          GestureDetector(
            onPanUpdate: _moveWheel,
            onPanEnd: _startAnimationOnPanEnd,
            onPanDown: (_details) => _stopAnimation(),
            child: AnimatedBuilder(
                animation: _animation,
                child: Container(child: widget.image),
                builder: (context, child) {
                  _updateAnimationValues();
                  widget.onUpdate?.call(_currentDivider);
                  return Transform.rotate(
                    angle: _initialSpinAngle + _currentDistance,
                    child: child,
                  );
                }),
          ),
          if (widget.secondaryImage != null)
            Positioned(
              top: topSecondaryImage,
              left: leftSecondaryImage,
              child: Container(
                height: heightSecondaryImage,
                width: widthSecondaryImage,
                child: widget.secondaryImage,
              ),
            ),
        ],
      ),
    );
  }

  bool get _userCanInteract =>
      !_animationController.isAnimating || widget.canInteractWhileSpinning;

  bool _contains(Offset p) => Size(widget.width, widget.height).contains(p);

  void _updateLocalPosition(Offset position) {
    if (_renderBox == null) {
      _renderBox = context.findRenderObject() as RenderBox;
    }
    _localPositionOnPanUpdate = _renderBox!.globalToLocal(position);
  }

  void _moveWheel(DragUpdateDetails details) {
    if (!_userCanInteract) return;

    if (_offsetOutsideTimestamp != null) return;

    _updateLocalPosition(details.globalPosition);

    if (_contains(_localPositionOnPanUpdate!)) {
      var angle = _spinVelocity!.offsetToRadians(_localPositionOnPanUpdate!);
      setState(() {
        _currentDistance = angle - _initialSpinAngle;
      });
    } else {
      _offsetOutsideTimestamp = DateTime.now();
    }
  }

  void _stopAnimation() {
    if (!_userCanInteract) return;

    _offsetOutsideTimestamp = null;
    _animationController.stop();
    _animationController.reset();

    widget.onEnd?.call(_currentDivider);
  }

  void _startAnimationOnPanEnd(DragEndDetails details) {
    if (!_userCanInteract) return;

    if (_offsetOutsideTimestamp != null) {
      var difference = DateTime.now().difference(_offsetOutsideTimestamp!);
      _offsetOutsideTimestamp = null;
      if (difference.inMilliseconds > 50) return;
    }

    if (_localPositionOnPanUpdate == null) return;

    _startAnimation(details.velocity.pixelsPerSecond);
  }

  void _startAnimation(Offset pixelsPerSecond) {
    var velocity =
        _spinVelocity!.getVelocity(_localPositionOnPanUpdate!, pixelsPerSecond);

    _localPositionOnPanUpdate = null;
    _isBackwards = velocity < 0;
    _initialCircularVelocity = pixelsPerSecondToRadians(velocity.abs());
    _totalDuration = _motion!.duration(_initialCircularVelocity);

    _animationController.duration =
        Duration(milliseconds: (_totalDuration * 1000).round());

    _animationController.reset();
    _animationController.forward();
  }

  @override
  void dispose() {
    _animationController.dispose();
    _subscription?.cancel();
    super.dispose();
  }
}

class SpinVelocity {
  final double width;
  final double height;

  SpinVelocity({required this.width, required this.height});

  double offsetToRadians(Offset offset) {
    double angle = atan2(
      offset.dy - (height / 2),
      offset.dx - (width / 2),
    );
    return angle;
  }

  double getVelocity(Offset position, Offset pixelsPerSecond) {
    double angle = offsetToRadians(position);
    double radius = sqrt(pow(position.dx - (width / 2), 2) +
        pow(position.dy - (height / 2), 2));
    double velocity = radius * pixelsPerSecondToRadians(pixelsPerSecond.dy);
    if (angle < -pi / 2) {
      velocity *= -1;
    }
    return velocity;
  }

  double pixelsPerSecondToRadians(double pixelsPerSecond) {
    return pixelsPerSecond / (width / 2);
  }
}

class NonUniformCircularMotion {
  final double resistance;

  NonUniformCircularMotion({required this.resistance});

  double anglePerDivision(int dividers) {
    return (2 * pi) / dividers;
  }

  double distance(double initialVelocity, double time) {
    return initialVelocity * time - (0.5 * resistance * time * time);
  }

  double modulo(double value) {
    double result = value % (2 * pi);
    return result < 0 ? result + 2 * pi : result;
  }

  double duration(double initialVelocity) {
    return (initialVelocity * 2) / resistance;
  }
}

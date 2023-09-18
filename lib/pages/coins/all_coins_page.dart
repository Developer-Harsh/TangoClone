import 'dart:convert';
import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tango/utils/colors.dart';

import 'package:http/http.dart' as http;
import 'package:tango/utils/config.dart';

import '../../models/CoinsPurchase.dart';
import '../../widgets/grad_button.dart';

class AllCoinsPage extends StatefulWidget {
  const AllCoinsPage({super.key});

  @override
  State<AllCoinsPage> createState() => _AllCoinsPageState();
}

class _AllCoinsPageState extends State<AllCoinsPage>
    with SingleTickerProviderStateMixin {
  List<double> sectors = [];
  Future<List<dynamic>> fetchData() async {
    final response =
        await http.get(Uri.parse(Config.base_url + Config.purchase_coins));

    if (response.statusCode == 200) {
      return json.decode(response.body);
    } else {
      throw Exception('Failed to load data');
    }
  }

  List<dynamic> purchaseCoinsList = [];
  int randomSectorIndex = -1;
  List<double> sectorRadians = [];
  double angle = 0;

  bool spinning = false;
  double earnedValue = 0;
  double totalEarnings = 0;
  int spins = 0;

  math.Random random = math.Random();
  late AnimationController controller;
  late Animation<double> animation;

  @override
  void initState() {
    super.initState();

    generateSectorRadians();

    controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 3600),
    );

    Tween<double> tween = Tween<double>(begin: 0, end: 1);

    CurvedAnimation curve = CurvedAnimation(
      parent: controller,
      curve: Curves.decelerate,
    );
    animation = tween.animate(curve);

    controller.addListener(() {
      if (controller.isCompleted) {
        setState(() {
          recordState();
          spinning = false;
        });
      }
    });
  }

  @override
  void dispose() {
    super.dispose();
    controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: UIColors.scaffold,
      body: Stack(
        children: [
          Column(
            children: [
              Align(
                alignment: Alignment.topCenter,
                child: Container(
                  decoration: const BoxDecoration(
                    color: UIColors.scaffold,
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(
                      top: 40,
                      left: 15,
                      right: 15,
                      bottom: 20,
                    ),
                    child: Row(
                      children: [
                        const ClipOval(
                          child: Image(
                            image:
                                AssetImage('assets/images/profile_picture.png'),
                            width: 35,
                            height: 35,
                          ),
                        ),
                        const Padding(
                          padding: EdgeInsets.only(
                            left: 10,
                          ),
                          child: Image(
                            image: AssetImage('assets/images/coin.png'),
                            width: 24,
                            height: 24,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                            left: 4,
                          ),
                          child: Text(
                            '0',
                            style: TextStyle(
                              fontFamily:
                                  GoogleFonts.getFont('Readex Pro').fontFamily,
                              color: UIColors.highText,
                              fontWeight: FontWeight.w800,
                            ),
                          ),
                        ),
                        const Spacer(),
                        Padding(
                          padding: const EdgeInsets.only(
                            right: 14,
                          ),
                          child: SvgPicture.asset(
                            'assets/icons/leaderboard.svg',
                            width: 24,
                            height: 24,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                            right: 14,
                          ),
                          child: SvgPicture.asset(
                            'assets/icons/feeds.svg',
                            width: 24,
                            height: 24,
                          ),
                        ),
                        SvgPicture.asset(
                          'assets/icons/notification.svg',
                          width: 24,
                          height: 24,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      FutureBuilder<List<dynamic>?>(
                        future: fetchData(),
                        builder: (context, snapshot) {
                          if (snapshot.connectionState ==
                              ConnectionState.waiting) {
                            return CircularProgressIndicator();
                          } else if (snapshot.hasError) {
                            return Text('Error: ${snapshot.error}');
                          } else if (snapshot.data == null) {
                            return Text('No data available');
                          } else {
                            List<dynamic> data = snapshot.data!;
                            CoinsPurchase cp = CoinsPurchase.fromJson(data[0]);

                            return Column(
                              children: [
                                Container(
                                  width: 310,
                                  decoration: BoxDecoration(
                                    color: UIColors.scaffold,
                                    borderRadius: BorderRadius.circular(22),
                                    border: Border.all(
                                      color: UIColors.box_color,
                                      width: 1.4,
                                      style: BorderStyle.solid,
                                    ),
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.only(
                                      top: 30,
                                      bottom: 30,
                                      left: 18,
                                      right: 18,
                                    ),
                                    child: Row(
                                      children: [
                                        const Align(
                                          alignment: Alignment.centerLeft,
                                          child: Padding(
                                            padding: EdgeInsets.only(
                                              right: 10,
                                            ),
                                            child: Image(
                                              image: AssetImage(
                                                  'assets/images/coin.png'),
                                              width: 20,
                                              height: 20,
                                            ),
                                          ),
                                        ),
                                        Text(
                                          cp.firstPC,
                                          style: TextStyle(
                                            fontFamily: GoogleFonts.getFont(
                                                    'Readex Pro')
                                                .fontFamily,
                                            fontWeight: FontWeight.w600,
                                            fontSize: 18,
                                            color: UIColors.highText,
                                          ),
                                        ),
                                        Spacer(),
                                        Text(
                                          cp.firstPCAmount,
                                          textAlign: TextAlign.right,
                                          style: TextStyle(
                                            fontFamily: GoogleFonts.getFont(
                                                    'Readex Pro')
                                                .fontFamily,
                                            fontWeight: FontWeight.w100,
                                            fontSize: 14,
                                            color: UIColors.mediumText,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(
                                    top: 20,
                                    bottom: 10,
                                  ),
                                  child: Stack(
                                    children: [
                                      Container(
                                        width: 310,
                                        decoration: BoxDecoration(
                                          color: UIColors.scaffold,
                                          borderRadius:
                                              BorderRadius.circular(22),
                                          border: Border.all(
                                            color: UIColors.mediumText,
                                            width: 1.4,
                                            style: BorderStyle.solid,
                                          ),
                                        ),
                                        child: Padding(
                                          padding: const EdgeInsets.only(
                                            top: 30,
                                            bottom: 30,
                                            left: 18,
                                            right: 18,
                                          ),
                                          child: Row(
                                            children: [
                                              const Align(
                                                alignment: Alignment.centerLeft,
                                                child: Padding(
                                                  padding: EdgeInsets.only(
                                                    right: 10,
                                                  ),
                                                  child: Image(
                                                    image: AssetImage(
                                                        'assets/images/coin.png'),
                                                    width: 20,
                                                    height: 20,
                                                  ),
                                                ),
                                              ),
                                              Text(
                                                cp.secondPC,
                                                style: TextStyle(
                                                  fontFamily:
                                                      GoogleFonts.getFont(
                                                              'Readex Pro')
                                                          .fontFamily,
                                                  fontWeight: FontWeight.w600,
                                                  fontSize: 18,
                                                  color: UIColors.highText,
                                                ),
                                              ),
                                              Spacer(),
                                              Text(
                                                cp.secondPCAmount,
                                                textAlign: TextAlign.right,
                                                style: TextStyle(
                                                  fontFamily:
                                                      GoogleFonts.getFont(
                                                              'Readex Pro')
                                                          .fontFamily,
                                                  fontWeight: FontWeight.w100,
                                                  fontSize: 14,
                                                  color: UIColors.mediumText,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                      Transform.translate(
                                        offset: const Offset(20.0, -10.0),
                                        child: Container(
                                          decoration: BoxDecoration(
                                            shape: BoxShape.rectangle,
                                            borderRadius:
                                                BorderRadius.circular(50),
                                            gradient: const LinearGradient(
                                              colors: [
                                                Color.fromARGB(
                                                    255, 255, 69, 205),
                                                Color.fromARGB(255, 255, 0, 93),
                                              ],
                                              begin: Alignment.topLeft,
                                              end: Alignment.bottomRight,
                                            ),
                                            border: Border.all(
                                              color: UIColors.scaffold,
                                              width: 3,
                                              style: BorderStyle.solid,
                                            ),
                                          ),
                                          child: Padding(
                                            padding: const EdgeInsets.only(
                                              top: 5,
                                              bottom: 5,
                                              left: 15,
                                              right: 15,
                                            ),
                                            child: Text(
                                              'Popular',
                                              textAlign: TextAlign.center,
                                              style: TextStyle(
                                                color: UIColors.scaffold,
                                                fontFamily: GoogleFonts.getFont(
                                                        'Readex Pro')
                                                    .fontFamily,
                                                fontSize: 10,
                                                fontWeight: FontWeight.w900,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(
                                    top: 10,
                                    bottom: 10,
                                  ),
                                  child: Container(
                                    width: 310,
                                    decoration: BoxDecoration(
                                      color: UIColors.scaffold,
                                      borderRadius: BorderRadius.circular(22),
                                      border: Border.all(
                                        color: UIColors.box_color,
                                        width: 1.4,
                                        style: BorderStyle.solid,
                                      ),
                                    ),
                                    child: Padding(
                                      padding: const EdgeInsets.only(
                                        top: 30,
                                        bottom: 30,
                                        left: 18,
                                        right: 18,
                                      ),
                                      child: Row(
                                        children: [
                                          const Align(
                                            alignment: Alignment.centerLeft,
                                            child: Padding(
                                              padding: EdgeInsets.only(
                                                right: 10,
                                              ),
                                              child: Image(
                                                image: AssetImage(
                                                    'assets/images/coin.png'),
                                                width: 20,
                                                height: 20,
                                              ),
                                            ),
                                          ),
                                          Text(
                                            cp.thirdPC,
                                            style: TextStyle(
                                              fontFamily: GoogleFonts.getFont(
                                                      'Readex Pro')
                                                  .fontFamily,
                                              fontWeight: FontWeight.w600,
                                              fontSize: 18,
                                              color: UIColors.highText,
                                            ),
                                          ),
                                          Spacer(),
                                          Text(
                                            cp.thirdPCAmount,
                                            textAlign: TextAlign.right,
                                            style: TextStyle(
                                              fontFamily: GoogleFonts.getFont(
                                                      'Readex Pro')
                                                  .fontFamily,
                                              fontWeight: FontWeight.w100,
                                              fontSize: 14,
                                              color: UIColors.mediumText,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(
                                    top: 10,
                                    bottom: 10,
                                  ),
                                  child: Container(
                                    width: 310,
                                    decoration: BoxDecoration(
                                      color: UIColors.scaffold,
                                      borderRadius: BorderRadius.circular(22),
                                      border: Border.all(
                                        color: UIColors.box_color,
                                        width: 1.4,
                                        style: BorderStyle.solid,
                                      ),
                                    ),
                                    child: Padding(
                                      padding: const EdgeInsets.only(
                                        top: 30,
                                        bottom: 30,
                                        left: 18,
                                        right: 18,
                                      ),
                                      child: Row(
                                        children: [
                                          const Align(
                                            alignment: Alignment.centerLeft,
                                            child: Padding(
                                              padding: EdgeInsets.only(
                                                right: 10,
                                              ),
                                              child: Image(
                                                image: AssetImage(
                                                    'assets/images/coin.png'),
                                                width: 20,
                                                height: 20,
                                              ),
                                            ),
                                          ),
                                          Text(
                                            cp.fourPC,
                                            style: TextStyle(
                                              fontFamily: GoogleFonts.getFont(
                                                      'Readex Pro')
                                                  .fontFamily,
                                              fontWeight: FontWeight.w600,
                                              fontSize: 18,
                                              color: UIColors.highText,
                                            ),
                                          ),
                                          Spacer(),
                                          Text(
                                            cp.fourPCAmount,
                                            textAlign: TextAlign.right,
                                            style: TextStyle(
                                              fontFamily: GoogleFonts.getFont(
                                                      'Readex Pro')
                                                  .fontFamily,
                                              fontWeight: FontWeight.w100,
                                              fontSize: 14,
                                              color: UIColors.mediumText,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(
                                    top: 10,
                                    bottom: 10,
                                  ),
                                  child: Container(
                                    width: 310,
                                    decoration: BoxDecoration(
                                      color: UIColors.scaffold,
                                      borderRadius: BorderRadius.circular(22),
                                      border: Border.all(
                                        color: UIColors.box_color,
                                        width: 1.4,
                                        style: BorderStyle.solid,
                                      ),
                                    ),
                                    child: Padding(
                                      padding: const EdgeInsets.only(
                                        top: 30,
                                        bottom: 30,
                                        left: 18,
                                        right: 18,
                                      ),
                                      child: Row(
                                        children: [
                                          const Align(
                                            alignment: Alignment.centerLeft,
                                            child: Padding(
                                              padding: EdgeInsets.only(
                                                right: 10,
                                              ),
                                              child: Image(
                                                image: AssetImage(
                                                    'assets/images/coin.png'),
                                                width: 20,
                                                height: 20,
                                              ),
                                            ),
                                          ),
                                          Text(
                                            cp.fifthPC,
                                            style: TextStyle(
                                              fontFamily: GoogleFonts.getFont(
                                                      'Readex Pro')
                                                  .fontFamily,
                                              fontWeight: FontWeight.w600,
                                              fontSize: 18,
                                              color: UIColors.highText,
                                            ),
                                          ),
                                          Spacer(),
                                          Text(
                                            cp.fifthPCAmount,
                                            textAlign: TextAlign.right,
                                            style: TextStyle(
                                              fontFamily: GoogleFonts.getFont(
                                                      'Readex Pro')
                                                  .fontFamily,
                                              fontWeight: FontWeight.w100,
                                              fontSize: 14,
                                              color: UIColors.mediumText,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(
                                    top: 10,
                                    bottom: 10,
                                  ),
                                  child: Container(
                                    width: 310,
                                    decoration: BoxDecoration(
                                      color: UIColors.scaffold,
                                      borderRadius: BorderRadius.circular(22),
                                      border: Border.all(
                                        color: UIColors.box_color,
                                        width: 1.4,
                                        style: BorderStyle.solid,
                                      ),
                                    ),
                                    child: Padding(
                                      padding: const EdgeInsets.only(
                                        top: 30,
                                        bottom: 30,
                                        left: 18,
                                        right: 18,
                                      ),
                                      child: Row(
                                        children: [
                                          const Align(
                                            alignment: Alignment.centerLeft,
                                            child: Padding(
                                              padding: EdgeInsets.only(
                                                right: 10,
                                              ),
                                              child: Image(
                                                image: AssetImage(
                                                    'assets/images/coin.png'),
                                                width: 20,
                                                height: 20,
                                              ),
                                            ),
                                          ),
                                          Text(
                                            cp.sixthPC,
                                            style: TextStyle(
                                              fontFamily: GoogleFonts.getFont(
                                                      'Readex Pro')
                                                  .fontFamily,
                                              fontWeight: FontWeight.w600,
                                              fontSize: 18,
                                              color: UIColors.highText,
                                            ),
                                          ),
                                          Spacer(),
                                          Text(
                                            cp.sixthPCAmount,
                                            textAlign: TextAlign.right,
                                            style: TextStyle(
                                              fontFamily: GoogleFonts.getFont(
                                                      'Readex Pro')
                                                  .fontFamily,
                                              fontWeight: FontWeight.w100,
                                              fontSize: 14,
                                              color: UIColors.mediumText,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(
                                    top: 10,
                                    bottom: 80,
                                  ),
                                  child: Container(
                                    width: 310,
                                    decoration: BoxDecoration(
                                      color: UIColors.scaffold,
                                      borderRadius: BorderRadius.circular(22),
                                      border: Border.all(
                                        color: UIColors.box_color,
                                        width: 1.4,
                                        style: BorderStyle.solid,
                                      ),
                                    ),
                                    child: Padding(
                                      padding: const EdgeInsets.only(
                                        top: 30,
                                        bottom: 30,
                                        left: 18,
                                        right: 18,
                                      ),
                                      child: Row(
                                        children: [
                                          const Align(
                                            alignment: Alignment.centerLeft,
                                            child: Padding(
                                              padding: EdgeInsets.only(
                                                right: 10,
                                              ),
                                              child: Image(
                                                image: AssetImage(
                                                    'assets/images/coin.png'),
                                                width: 20,
                                                height: 20,
                                              ),
                                            ),
                                          ),
                                          Text(
                                            cp.seventhPC,
                                            style: TextStyle(
                                              fontFamily: GoogleFonts.getFont(
                                                      'Readex Pro')
                                                  .fontFamily,
                                              fontWeight: FontWeight.w600,
                                              fontSize: 18,
                                              color: UIColors.highText,
                                            ),
                                          ),
                                          Spacer(),
                                          Text(
                                            cp.seventhPCAmount,
                                            textAlign: TextAlign.right,
                                            style: TextStyle(
                                              fontFamily: GoogleFonts.getFont(
                                                      'Readex Pro')
                                                  .fontFamily,
                                              fontWeight: FontWeight.w100,
                                              fontSize: 14,
                                              color: UIColors.mediumText,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            );
                          }
                        },
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  void generateSectorRadians() {
    double sectorRadian = 2 * math.pi / sectors.length;

    for (int i = 0; i < sectors.length; i++) {
      sectorRadians.add((i + 1) * sectorRadian);
    }
  }

  void recordState() {
    earnedValue = sectors[sectors.length - (randomSectorIndex + 1)];
    totalEarnings = totalEarnings + earnedValue;
    spins = spins + 1;
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text('Earned Points $earnedValue and left spins are $spins'),
    ));
  }

  void spin() {
    randomSectorIndex = random.nextInt(sectors.length);
    double randomRadian = generateRandomRadianToSpinTo();
    controller.reset();
    angle = randomRadian;
    controller.forward();
  }

  double generateRandomRadianToSpinTo() {
    return (2 * math.pi * sectors.length) + sectorRadians[randomSectorIndex];
  }
}

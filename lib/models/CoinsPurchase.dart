class CoinsPurchase {
  final String firstPC;
  final String firstPCAmount;
  final String secondPC;
  final String secondPCAmount;
  final String thirdPC;
  final String thirdPCAmount;
  final String fourPC;
  final String fourPCAmount;
  final String fifthPC;
  final String fifthPCAmount;
  final String sixthPC;
  final String sixthPCAmount;
  final String seventhPC;
  final String seventhPCAmount;

  CoinsPurchase({
    required this.firstPC,
    required this.firstPCAmount,
    required this.secondPC,
    required this.secondPCAmount,
    required this.thirdPC,
    required this.thirdPCAmount,
    required this.fourPC,
    required this.fourPCAmount,
    required this.fifthPC,
    required this.fifthPCAmount,
    required this.sixthPC,
    required this.sixthPCAmount,
    required this.seventhPC,
    required this.seventhPCAmount,
  });

  factory CoinsPurchase.fromJson(Map<String, dynamic> json) {
    return CoinsPurchase(
      firstPC: json['firstPC'],
      firstPCAmount: json['firstPCAmount'],
      secondPC: json['secondPC'],
      secondPCAmount: json['secondPCAmount'],
      thirdPC: json['thirdPC'],
      thirdPCAmount: json['thirdPCAmount'],
      fourPC: json['fourPC'],
      fourPCAmount: json['fourPCAmount'],
      fifthPC: json['fifthPC'],
      fifthPCAmount: json['fifthPCAmount'],
      sixthPC: json['sixthPC'],
      sixthPCAmount: json['sixthPCAmount'],
      seventhPC: json['seventhPC'],
      seventhPCAmount: json['seventhPCAmount'],
    );
  }
}

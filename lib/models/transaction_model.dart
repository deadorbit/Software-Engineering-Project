class Transaction {
  final String name;
  final String code;
  final double dollarAmount;
  final double stockAmount;
  final double priceBought;

  Transaction({
    required this.name,
    required this.code,
    required this.dollarAmount,
    required this.priceBought,
    required this.stockAmount,
  });
}

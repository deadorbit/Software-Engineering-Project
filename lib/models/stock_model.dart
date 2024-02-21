class Stock {
  final String name;
  final String code;

  Stock({
    required this.name,
    required this.code,
  });

  factory Stock.fromJson(Map<String, dynamic> json) {
    return Stock(
      name: json[0]['name'],
      code: json[0]['code'],
    );
  }
}

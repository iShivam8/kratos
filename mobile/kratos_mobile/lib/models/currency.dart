class Currency {
  final String name;
  final String symbol;
  final String imageUrl;
  final double price; // in USD

  const Currency({
    required this.name,
    required this.symbol,
    required this.imageUrl,
    required this.price,
  });
}

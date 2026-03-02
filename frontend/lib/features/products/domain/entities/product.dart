class Product {
  final int id;
  final String name;
  final String scientificName;
  final String description;
  final double price;
  final int stock;
  final String imageUrl;
  final String careDifficulty;
  final String originCountry;
  final String sunlightNeeds;
  final String waterFrequency;
  final DateTime createdAt;
  final String categoryName;
  final String categoryIcon;

  Product({
    required this.id,
    required this.name,
    required this.scientificName,
    required this.description,
    required this.price,
    required this.stock,
    required this.imageUrl,
    required this.careDifficulty,
    required this.originCountry,
    required this.sunlightNeeds,
    required this.waterFrequency,
    required this.createdAt,
    required this.categoryName,
    required this.categoryIcon,
  });
}

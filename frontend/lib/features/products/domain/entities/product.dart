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
  final List<Sale> sales;

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
    this.sales = const [],
  });
}

class Sale {
  final int id;
  final int quantity;
  final double totalPrice;
  final DateTime soldAt;

  Sale({
    required this.id,
    required this.quantity,
    required this.totalPrice,
    required this.soldAt,
  });
}

class Category {
  final int id;
  final String name;
  final String icon;

  Category({
    required this.id,
    required this.name,
    required this.icon,
  });
}

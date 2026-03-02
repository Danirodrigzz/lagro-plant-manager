import '../entities/product.dart';

abstract class IProductRepository {
  Future<(List<Product>, int?, bool)> getProducts({
    int limit = 20,
    int? cursor,
    String? search,
    int? categoryId,
  });

  Future<Product?> getProductById(int id);

  Future<List<Category>> getCategories();
}

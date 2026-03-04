import '../entities/product.dart';

abstract class IProductRepository {
  Future<(List<Product>, int?, bool)> getProducts({
    int limit = 20,
    int? cursor,
    String? search,
    int? categoryId,
    int? supplierId,
    int? seasonId,
  });

  Future<Product?> getProductById(int id);
  Future<List<Category>> getCategories();
  Future<List<Supplier>> getSuppliers();
  Future<List<Season>> getSeasons();
}

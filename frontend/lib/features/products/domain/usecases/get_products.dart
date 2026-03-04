import '../entities/product.dart';
import '../repositories/i_product_repository.dart';

class GetProductsUseCase {
  final IProductRepository _repository;

  GetProductsUseCase(this._repository);

  Future<(List<Product>, int?, bool)> call({
    int limit = 20,
    int? cursor,
    String? search,
    int? categoryId,
    int? supplierId,
    int? seasonId,
  }) {
    return _repository.getProducts(
      limit: limit,
      cursor: cursor,
      search: search,
      categoryId: categoryId,
      supplierId: supplierId,
      seasonId: seasonId,
    );
  }
}

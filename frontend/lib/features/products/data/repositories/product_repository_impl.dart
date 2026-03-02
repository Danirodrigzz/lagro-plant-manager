import '../../domain/entities/product.dart';
import '../../domain/repositories/i_product_repository.dart';
import '../datasources/products_remote_data_source.dart';
import '../models/product_model.dart';

class ProductRepositoryImpl implements IProductRepository {
  final ProductsRemoteDataSource _remoteDataSource;

  ProductRepositoryImpl(this._remoteDataSource);

  @override
  Future<(List<Product>, int?, bool)> getProducts({
    int limit = 20,
    int? cursor,
    String? search,
    int? categoryId,
  }) async {
    final (models, pagination) = await _remoteDataSource.getProducts(
      limit: limit,
      cursor: cursor,
      search: search,
      categoryId: categoryId,
    );

    final entities = models.map((m) => m.toEntity()).toList();
    
    return (entities, pagination.nextCursor, pagination.hasMore);
  }

  @override
  Future<Product?> getProductById(int id) async {
    final model = await _remoteDataSource.getProductById(id);
    return model?.toEntity();
  }
}

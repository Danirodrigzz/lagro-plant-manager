import '../../domain/entities/product.dart';
import '../../domain/repositories/i_product_repository.dart';
import '../datasources/products_local_data_source.dart';
import '../datasources/products_remote_data_source.dart';
import '../models/product_model.dart';

class ProductRepositoryImpl implements IProductRepository {
  final ProductsRemoteDataSource _remoteDataSource;
  final ProductsLocalDataSource _localDataSource;

  ProductRepositoryImpl(this._remoteDataSource, this._localDataSource);

  @override
  Future<(List<Product>, int?, bool)> getProducts({
    int limit = 20,
    int? cursor,
    String? search,
    int? categoryId,
  }) async {
    try {
      final (models, pagination) = await _remoteDataSource.getProducts(
        limit: limit,
        cursor: cursor,
        search: search,
        categoryId: categoryId,
      );

      // Only cache the first page or search results if needed, 
      // but for this demo, let's cache what we fetch.
      if (cursor == null) {
        await _localDataSource.saveProducts(models);
      }

      final entities = models.map((m) => m.toEntity()).toList();
      return (entities, pagination.nextCursor, pagination.hasMore);
    } catch (e) {
      // If network fails and it's the first page, try to load from cache
      if (cursor == null) {
        final cachedModels = await _localDataSource.getCachedProducts();
        if (cachedModels.isNotEmpty) {
          final entities = cachedModels.map((m) => m.toEntity()).toList();
          return (entities, null, false);
        }
      }
      rethrow;
    }
  }

  @override
  Future<Product?> getProductById(int id) async {
    try {
      final model = await _remoteDataSource.getProductById(id);
      return model?.toEntity();
    } catch (e) {
      final cachedModels = await _localDataSource.getCachedProducts();
      final model = cachedModels.where((m) => m.id == id).firstOrNull;
      return model?.toEntity();
    }
  }
}

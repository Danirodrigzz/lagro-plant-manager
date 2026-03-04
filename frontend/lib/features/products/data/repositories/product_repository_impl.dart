import 'package:lagro_plant_manager/features/products/domain/entities/product.dart';
import 'package:lagro_plant_manager/features/products/domain/repositories/i_product_repository.dart';
import 'package:lagro_plant_manager/features/products/data/datasources/products_local_data_source.dart';
import 'package:lagro_plant_manager/features/products/data/datasources/products_remote_data_source.dart';
import 'package:lagro_plant_manager/features/products/data/models/product_model.dart';

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
        var cachedModels = await _localDataSource.getCachedProducts();
        
        // Filter cache by search and category if necessary
        if (search != null && search.isNotEmpty) {
          final query = search.toLowerCase();
          cachedModels = cachedModels.where((m) => 
            m.name.toLowerCase().contains(query) || 
            m.scientificName.toLowerCase().contains(query) ||
            m.description.toLowerCase().contains(query)
          ).toList();
        }
        
        if (categoryId != null) {
          cachedModels = cachedModels.where((m) => m.category.id == categoryId).toList();
        }

        if (cachedModels.isNotEmpty) {
          final entities = cachedModels.map((m) => m.toEntity()).toList();
          return (entities, null as int?, false);
        } else if (search != null || categoryId != null) {
          // If we were searching/filtering and found nothing in cache, return empty
          return (<Product>[], null as int?, false);
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

  @override
  Future<List<Category>> getCategories() async {
    final models = await _remoteDataSource.getCategories();
    return models.map((m) => m.toEntity()).toList();
  }
}

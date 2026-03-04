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
    int? supplierId,
    int? seasonId,
  }) async {
    try {
      final (models, pagination) = await _remoteDataSource.getProducts(
        limit: limit,
        cursor: cursor,
        search: search,
        categoryId: categoryId,
        supplierId: supplierId,
        seasonId: seasonId,
      );

      // Cache the first page of various filters
      if (cursor == null) {
        await _localDataSource.saveProducts(models);
      }

      final entities = models.map((m) => m.toEntity()).toList();
      return (entities, pagination.nextCursor, pagination.hasMore);
    } catch (e) {
      // If network fails and it's the first page, try to load from cache
      if (cursor == null) {
        var cachedModels = await _localDataSource.getCachedProducts();
        
        // Filter cache by search
        if (search != null && search.isNotEmpty) {
          final query = search.toLowerCase();
          cachedModels = cachedModels.where((m) => 
            m.name.toLowerCase().contains(query) || 
            m.scientificName.toLowerCase().contains(query) ||
            m.description.toLowerCase().contains(query)
          ).toList();
        }
        
        // Filter cache by category
        if (categoryId != null) {
          cachedModels = cachedModels.where((m) => m.category.id == categoryId).toList();
        }

        // Filter cache by supplier
        if (supplierId != null) {
          cachedModels = cachedModels.where((m) => m.supplier.id == supplierId).toList();
        }

        // Filter cache by season
        if (seasonId != null) {
          cachedModels = cachedModels.where((m) => m.season.id == seasonId).toList();
        }

        if (cachedModels.isNotEmpty) {
          final entities = cachedModels.map((m) => m.toEntity()).toList();
          return (entities, null as int?, false);
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

  @override
  Future<List<Supplier>> getSuppliers() async {
    final models = await _remoteDataSource.getSuppliers();
    return models.map((m) => m.toEntity()).toList();
  }

  @override
  Future<List<Season>> getSeasons() async {
    final models = await _remoteDataSource.getSeasons();
    return models.map((m) => m.toEntity()).toList();
  }
}

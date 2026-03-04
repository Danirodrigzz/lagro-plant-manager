import 'package:dio/dio.dart';
import 'package:lagro_plant_manager/features/products/data/models/pagination_model.dart';
import 'package:lagro_plant_manager/features/products/data/models/product_model.dart';

class ProductsRemoteDataSource {
  final Dio _dio;

  ProductsRemoteDataSource(this._dio);

  Future<(List<ProductModel>, PaginationModel)> getProducts({
    int limit = 20,
    int? cursor,
    String? search,
    int? categoryId,
    int? supplierId,
    int? seasonId,
  }) async {
    try {
      final response = await _dio.get(
        '/products',
        queryParameters: {
          'limit': limit,
          if (cursor != null) 'cursor': cursor,
          if (search != null && search.isNotEmpty) 'search': search,
          if (categoryId != null) 'categoryId': categoryId,
          if (supplierId != null) 'supplierId': supplierId,
          if (seasonId != null) 'seasonId': seasonId,
        },
      );

      if (response.data['success'] == true) {
        final data = response.data['data'] as List? ?? [];
        final products = data.map((e) => ProductModel.fromJson(e)).toList();
        final pagination = PaginationModel.fromJson(response.data['pagination'] ?? {
          'nextCursor': null,
          'hasMore': false,
          'total': 0,
        });
        return (products, pagination);
      } else {
        throw Exception(response.data['error'] ?? 'Failed to fetch products');
      }
    } catch (e) {
      rethrow;
    }
  }

  Future<ProductModel?> getProductById(int id) async {
    final response = await _dio.get('/products/$id');

    if (response.data['success'] == true && response.data['data'] != null) {
      return ProductModel.fromJson(response.data['data']);
    } else {
      return null;
    }
  }

  Future<List<CategoryModel>> getCategories() async {
    final response = await _dio.get('/categories');

    if (response.data['success'] == true) {
      final data = response.data['data'] as List? ?? [];
      return data.map((e) => CategoryModel.fromJson(e)).toList();
    } else {
      throw Exception(response.data['error'] ?? 'Failed to fetch categories');
    }
  }

  Future<List<SupplierModel>> getSuppliers() async {
    final response = await _dio.get('/suppliers');

    if (response.data['success'] == true) {
      final data = response.data['data'] as List? ?? [];
      return data.map((e) => SupplierModel.fromJson(e)).toList();
    } else {
      throw Exception(response.data['error'] ?? 'Failed to fetch suppliers');
    }
  }

  Future<List<SeasonModel>> getSeasons() async {
    final response = await _dio.get('/seasons');

    if (response.data['success'] == true) {
      final data = response.data['data'] as List? ?? [];
      return data.map((e) => SeasonModel.fromJson(e)).toList();
    } else {
      throw Exception(response.data['error'] ?? 'Failed to fetch seasons');
    }
  }
}

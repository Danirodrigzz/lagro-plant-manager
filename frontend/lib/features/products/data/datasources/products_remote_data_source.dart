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
  }) async {
    final response = await _dio.get(
      '/products',
      queryParameters: {
        'limit': limit,
        if (cursor != null) 'cursor': cursor,
        if (search != null && search.isNotEmpty) 'search': search,
        if (categoryId != null) 'categoryId': categoryId,
      },
    );

    if (response.data['success'] == true) {
      final List data = response.data['data'];
      final products = data.map((e) => ProductModel.fromJson(e)).toList();
      final pagination = PaginationModel.fromJson(response.data['pagination']);
      
      return (products, pagination);
    } else {
      throw Exception(response.data['error'] ?? 'Failed to fetch products');
    }
  }

  Future<ProductModel?> getProductById(int id) async {
    final response = await _dio.get('/products/$id');

    if (response.data['success'] == true) {
      return ProductModel.fromJson(response.data['data']);
    } else {
      return null;
    }
  }

  Future<List<CategoryModel>> getCategories() async {
    final response = await _dio.get('/categories');

    if (response.data['success'] == true) {
      final List data = response.data['data'];
      return data.map((e) => CategoryModel.fromJson(e)).toList();
    } else {
      throw Exception(response.data['error'] ?? 'Failed to fetch categories');
    }
  }
}

import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../core/network/dio_client.dart';
import '../../data/datasources/products_remote_data_source.dart';
import '../../data/repositories/product_repository_impl.dart';
import '../../domain/repositories/i_product_repository.dart';
import '../../domain/usecases/get_products.dart';

// 1. Data Source
final productsRemoteDataSourceProvider = Provider<ProductsRemoteDataSource>((ref) {
  return ProductsRemoteDataSource(DioClient.instance);
});

// 2. Repository
final productRepositoryProvider = Provider<IProductRepository>((ref) {
  return ProductRepositoryImpl(ref.watch(productsRemoteDataSourceProvider));
});

// 3. Use Case
final getProductsUseCaseProvider = Provider<GetProductsUseCase>((ref) {
  return GetProductsUseCase(ref.watch(productRepositoryProvider));
});

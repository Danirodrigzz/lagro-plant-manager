import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lagro_plant_manager/core/network/dio_client.dart';
import 'package:lagro_plant_manager/features/products/data/datasources/products_local_data_source.dart';
import 'package:lagro_plant_manager/features/products/data/datasources/products_remote_data_source.dart';
import 'package:lagro_plant_manager/features/products/data/repositories/product_repository_impl.dart';
import 'package:lagro_plant_manager/features/products/domain/repositories/i_product_repository.dart';
import 'package:lagro_plant_manager/features/products/domain/usecases/get_products.dart';
import 'package:lagro_plant_manager/features/products/domain/entities/product.dart';

// 1. Data Sources
final productsRemoteDataSourceProvider = Provider<ProductsRemoteDataSource>((ref) {
  return ProductsRemoteDataSource(DioClient.instance);
});

final productsLocalDataSourceProvider = Provider<ProductsLocalDataSource>((ref) {
  return ProductsLocalDataSource();
});

// 2. Repository
final productRepositoryProvider = Provider<IProductRepository>((ref) {
  return ProductRepositoryImpl(
    ref.watch(productsRemoteDataSourceProvider),
    ref.watch(productsLocalDataSourceProvider),
  );
});

// 3. Use Cases
final getProductsUseCaseProvider = Provider<GetProductsUseCase>((ref) {
  return GetProductsUseCase(ref.watch(productRepositoryProvider));
});

// 4. State Providers
final categoriesProvider = FutureProvider<List<Category>>((ref) async {
  final repository = ref.watch(productRepositoryProvider);
  return repository.getCategories();
});

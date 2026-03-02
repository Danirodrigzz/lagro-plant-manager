import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../domain/entities/product.dart';
import '../../domain/usecases/get_products.dart';
import 'products_providers.dart';

class ProductsState {
  final List<Product> products;
  final int? nextCursor;
  final bool hasMore;
  final bool isLoading;
  final String? error;

  ProductsState({
    required this.products,
    this.nextCursor,
    this.hasMore = true,
    this.isLoading = false,
    this.error,
  });

  ProductsState copyWith({
    List<Product>? products,
    int? nextCursor,
    bool? hasMore,
    bool? isLoading,
    String? error,
  }) {
    return ProductsState(
      products: products ?? this.products,
      nextCursor: nextCursor ?? this.nextCursor,
      hasMore: hasMore ?? this.hasMore,
      isLoading: isLoading ?? this.isLoading,
      error: error,
    );
  }
}

class ProductsNotifier extends StateNotifier<ProductsState> {
  final GetProductsUseCase _getProductsUseCase;

  ProductsNotifier(this._getProductsUseCase)
      : super(ProductsState(products: [])) {
    loadNextPage();
  }

  Future<void> loadNextPage() async {
    if (state.isLoading || !state.hasMore) return;

    state = state.copyWith(isLoading: true, error: null);

    try {
      final (newProducts, nextCursor, hasMore) = await _getProductsUseCase(
        cursor: state.nextCursor,
      );

      state = state.copyWith(
        products: [...state.products, ...newProducts],
        nextCursor: nextCursor,
        hasMore: hasMore,
        isLoading: false,
      );
    } catch (e) {
      state = state.copyWith(
        isLoading: false,
        error: e.toString(),
      );
    }
  }

  Future<void> refresh() async {
    state = ProductsState(products: []);
    await loadNextPage();
  }
}

final productsNotifierProvider =
    StateNotifierProvider<ProductsNotifier, ProductsState>((ref) {
  return ProductsNotifier(ref.watch(getProductsUseCaseProvider));
});

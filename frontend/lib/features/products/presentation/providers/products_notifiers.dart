import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lagro_plant_manager/features/products/domain/entities/product.dart';
import 'package:lagro_plant_manager/features/products/domain/usecases/get_products.dart';
import 'package:lagro_plant_manager/features/products/presentation/providers/products_providers.dart';

class ProductsState {
  final List<Product> products;
  final int? nextCursor;
  final bool hasMore;
  final bool isLoading;
  final String? error;
  final String? search;
  final int? categoryId;

  ProductsState({
    required this.products,
    this.nextCursor,
    this.hasMore = true,
    this.isLoading = false,
    this.error,
    this.search,
    this.categoryId,
  });

  ProductsState copyWith({
    List<Product>? products,
    int? nextCursor,
    bool? hasMore,
    bool? isLoading,
    String? error,
    String? search,
    int? categoryId,
  }) {
    return ProductsState(
      products: products ?? this.products,
      nextCursor: nextCursor ?? this.nextCursor,
      hasMore: hasMore ?? this.hasMore,
      isLoading: isLoading ?? this.isLoading,
      error: error,
      search: search ?? this.search,
      categoryId: categoryId == -1 ? null : (categoryId ?? this.categoryId),
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
        search: state.search,
        categoryId: state.categoryId,
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

  void updateSearch(String? search) {
    if (state.search == search) return;
    state = state.copyWith(
      search: search,
      products: [],
      nextCursor: null,
      hasMore: true,
    );
    loadNextPage();
  }

  void updateCategory(int? categoryId) {
    if (state.categoryId == categoryId) return;
    state = state.copyWith(
      categoryId: categoryId ?? -1, // Use -1 as a flag to nullify
      products: [],
      nextCursor: null,
      hasMore: true,
    );
    loadNextPage();
  }

  Future<void> refresh() async {
    state = state.copyWith(
      products: [],
      nextCursor: null,
      hasMore: true,
    );
    await loadNextPage();
  }

  void clearFilters() {
    state = state.copyWith(
      search: '',
      categoryId: -1, // Reset category
      products: [],
      nextCursor: null,
      hasMore: true,
    );
    loadNextPage();
  }
}

final productsNotifierProvider =
    StateNotifierProvider<ProductsNotifier, ProductsState>((ref) {
  return ProductsNotifier(ref.watch(getProductsUseCaseProvider));
});

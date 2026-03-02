import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../core/widgets/shimmer_widgets.dart';
import '../providers/products_notifiers.dart';
import '../widgets/product_card.dart';

class ProductsScreen extends ConsumerWidget {
  const ProductsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(productsNotifierProvider);
    final notifier = ref.read(productsNotifierProvider.notifier);

    return Scaffold(
      body: RefreshIndicator(
        onRefresh: () => notifier.refresh(),
        child: CustomScrollView(
          slivers: [
            // Premium Header
            SliverAppBar.large(
              title: const Text(
                'Catálogo de Plantas',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              actions: [
                IconButton(
                  onPressed: () => notifier.refresh(),
                  icon: const Icon(Icons.refresh),
                ),
                const SizedBox(width: 8),
              ],
            ),

            // Search indicator
            if (state.products.isNotEmpty)
              SliverToBoxAdapter(
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(16, 8, 16, 16),
                  child: Text(
                    'Mostrando ${state.products.length} productos',
                    style: Theme.of(context).textTheme.bodySmall?.copyWith(
                          color: Colors.grey[600],
                        ),
                  ),
                ),
              ),

            // Initial Loading with Shimmer
            if (state.isLoading && state.products.isEmpty)
              SliverPadding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                sliver: SliverList(
                  delegate: SliverChildBuilderDelegate(
                    (context, index) => const Padding(
                      padding: EdgeInsets.only(bottom: 16),
                      child: ProductCardShimmer(),
                    ),
                    childCount: 5,
                  ),
                ),
              )
            else
              // Products List
              SliverPadding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                sliver: SliverList(
                  delegate: SliverChildBuilderDelegate(
                    (context, index) {
                      // Check if we need to load the next page
                      if (index == state.products.length - 1 && state.hasMore) {
                        Future.microtask(() => notifier.loadNextPage());
                      }

                      if (index >= state.products.length) {
                        return state.isLoading
                            ? const Padding(
                                padding: EdgeInsets.symmetric(vertical: 32),
                                child: Center(child: CircularProgressIndicator()),
                              )
                            : const SizedBox.shrink();
                      }

                      final product = state.products[index];
                      return Padding(
                        padding: const EdgeInsets.only(bottom: 16),
                        child: ProductCard(
                          product: product,
                          onTap: () {
                            // TODO: Navigate to details
                          },
                        ),
                      );
                    },
                    childCount: state.products.length + (state.hasMore ? 1 : 0),
                  ),
                ),
              ),

            // Empty state
            if (state.products.isEmpty && !state.isLoading && state.error == null)
              const SliverFillRemaining(
                child: Center(
                  child: Text('No se encontraron productos 🌱'),
                ),
              ),

            // Error state
            if (state.error != null && state.products.isEmpty)
              SliverFillRemaining(
                child: Center(
                  child: Padding(
                    padding: const EdgeInsets.all(32.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Icon(Icons.cloud_off, size: 64, color: Colors.grey),
                        const SizedBox(height: 16),
                        Text(
                          'Sin conexión',
                          style: Theme.of(context).textTheme.titleLarge,
                        ),
                        const SizedBox(height: 8),
                        Text(
                          'No pudimos cargar el catálogo. Por favor, verifica tu conexión o intenta de nuevo.',
                          textAlign: TextAlign.center,
                          style: Theme.of(context).textTheme.bodyMedium,
                        ),
                        const SizedBox(height: 24),
                        ElevatedButton.icon(
                          onPressed: () => notifier.refresh(),
                          icon: const Icon(Icons.refresh),
                          label: const Text('Reintentar'),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}

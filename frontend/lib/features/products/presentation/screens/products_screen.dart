import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lagro_plant_manager/core/utils/page_transitions.dart';
import 'package:lagro_plant_manager/core/widgets/shimmer_widgets.dart';
import 'package:lagro_plant_manager/features/products/presentation/providers/products_providers.dart';
import 'package:lagro_plant_manager/features/products/presentation/providers/products_notifiers.dart';
import 'package:lagro_plant_manager/features/products/presentation/providers/theme_provider.dart';
import 'package:lagro_plant_manager/features/products/presentation/screens/product_detail_screen.dart';
import 'package:lagro_plant_manager/features/products/presentation/widgets/category_chips.dart';
import 'package:lagro_plant_manager/features/products/presentation/widgets/product_card.dart';
import 'package:lagro_plant_manager/features/products/presentation/widgets/search_bar_widget.dart';
import 'package:lagro_plant_manager/features/products/presentation/widgets/empty_state_widget.dart';
import 'package:lagro_plant_manager/features/products/presentation/widgets/offline_banner.dart';

class ProductsScreen extends ConsumerWidget {
  const ProductsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(productsNotifierProvider);
    final notifier = ref.read(productsNotifierProvider.notifier);
    final themeNotifier = ref.read(themeProvider.notifier);
    final isDark = ref.watch(themeProvider) == ThemeMode.dark;

    return Scaffold(
      body: RefreshIndicator(
        onRefresh: () => notifier.refresh(),
        child: CustomScrollView(
          cacheExtent: 1000,
          slivers: [
            // Premium Header
            SliverAppBar.large(
              title: const Text(
                'Catálogo de Plantas',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              actions: [
                IconButton(
                  onPressed: () => themeNotifier.toggleTheme(),
                  icon: AnimatedSwitcher(
                    duration: const Duration(milliseconds: 300),
                    transitionBuilder: (child, animation) =>
                        RotationTransition(turns: animation, child: child),
                    child: Icon(
                      isDark ? Icons.light_mode : Icons.dark_mode,
                      key: ValueKey(isDark),
                    ),
                  ),
                  tooltip: isDark ? 'Modo claro' : 'Modo oscuro',
                ),
                IconButton(
                  onPressed: () => notifier.refresh(),
                  icon: const Icon(Icons.refresh),
                ),
              const SizedBox(width: 8),
              ],
            ),

            // Real-time Offline Banner
            const SliverToBoxAdapter(
              child: OfflineBanner(),
            ),

            // Search Bar
            SliverToBoxAdapter(
              child: SearchBarWidget(
                initialValue: state.search,
                onSearch: (value) => notifier.updateSearch(value),
              ),
            ),

            // Category Filters
            SliverToBoxAdapter(
              child: CategoryChips(
                selectedCategoryId: state.categoryId,
                onCategorySelected: (id) => notifier.updateCategory(id),
              ),
            ),

            // Supplier Filters
            SliverToBoxAdapter(
              child: ref.watch(suppliersProvider).when(
                data: (suppliers) => _FilterHorizontalList(
                  title: 'Proveedores',
                  items: suppliers.map((s) => _FilterItem(id: s.id, name: s.name)).toList(),
                  selectedId: state.supplierId,
                  onSelected: (id) => notifier.updateSupplier(id),
                ),
                loading: () => const SizedBox.shrink(),
                error: (_, __) => const SizedBox.shrink(),
              ),
            ),

            // Season Filters
            SliverToBoxAdapter(
              child: ref.watch(seasonsProvider).when(
                data: (seasons) => _FilterHorizontalList(
                  title: 'Temporadas',
                  items: seasons.map((s) => _FilterItem(id: s.id, name: s.name)).toList(),
                  selectedId: state.seasonId,
                  onSelected: (id) => notifier.updateSeason(id),
                ),
                loading: () => const SizedBox.shrink(),
                error: (_, __) => const SizedBox.shrink(),
              ),
            ),

            const SliverToBoxAdapter(child: SizedBox(height: 16)),

            // Search results indicator
            if (state.products.isNotEmpty)
              SliverToBoxAdapter(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Row(
                    children: [
                      Text(
                        'Mostrando ${state.products.length} productos',
                        style: Theme.of(context).textTheme.bodySmall?.copyWith(
                              color: Colors.grey[600],
                            ),
                      ),
                      if (state.search != null && state.search!.isNotEmpty) ...[
                        const SizedBox(width: 8),
                        Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 8,
                            vertical: 2,
                          ),
                          decoration: BoxDecoration(
                            color: Theme.of(context).primaryColor.withOpacity(0.1),
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: Text(
                            '"${state.search}"',
                            style: Theme.of(context).textTheme.bodySmall?.copyWith(
                                  color: Theme.of(context).primaryColor,
                                  fontWeight: FontWeight.bold,
                                ),
                          ),
                        ),
                      ],
                    ],
                  ),
                ),
              ),

            const SliverToBoxAdapter(child: SizedBox(height: 16)),

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
                            Navigator.of(context).push(
                              SlideUpPageRoute(
                                page: ProductDetailScreen(product: product),
                              ),
                            );
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
              SliverFillRemaining(
                hasScrollBody: false,
                child: EmptyStateWidget(
                  title: 'No encontramos lo que buscas 🌱',
                  message: 'Intenta con otra palabra o selecciona una categoría diferente.',
                  actionLabel: 'Limpiar filtros',
                  onAction: () => notifier.clearFilters(),
                ),
              ),

            // Error state
            if (state.error != null && state.products.isEmpty)
              SliverFillRemaining(
                hasScrollBody: false,
                child: EmptyStateWidget(
                  title: '¡Ups! Algo salió mal',
                  message: state.error ?? 'No pudimos cargar el catálogo. Verifica tu conexión e intenta de nuevo.',
                  actionLabel: 'Reintentar',
                  onAction: () => notifier.refresh(),
                ),
              ),
          ],
        ),
      ),
    );
  }
}

class _FilterItem {
  final int id;
  final String name;
  _FilterItem({required this.id, required this.name});
}

class _FilterHorizontalList extends StatelessWidget {
  final String title;
  final List<_FilterItem> items;
  final int? selectedId;
  final Function(int?) onSelected;

  const _FilterHorizontalList({
    required this.title,
    required this.items,
    this.selectedId,
    required this.onSelected,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          child: Text(
            title,
            style: Theme.of(context).textTheme.titleSmall?.copyWith(
                  fontWeight: FontWeight.bold,
                  color: Colors.grey[600],
                ),
          ),
        ),
        SizedBox(
          height: 40,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            padding: const EdgeInsets.symmetric(horizontal: 12),
            itemCount: items.length + 1,
            itemBuilder: (context, index) {
              if (index == 0) {
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 4),
                  child: FilterChip(
                    label: const Text('Todos'),
                    selected: selectedId == null,
                    onSelected: (selected) => onSelected(null),
                  ),
                );
              }
              final item = items[index - 1];
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 4),
                child: FilterChip(
                  label: Text(item.name),
                  selected: selectedId == item.id,
                  onSelected: (selected) => onSelected(selected ? item.id : null),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lagro_plant_manager/core/theme/app_colors.dart';
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
import 'package:lagro_plant_manager/features/auth/presentation/providers/auth_providers.dart';
import 'package:lagro_plant_manager/features/auth/presentation/screens/register_screen.dart';

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
            // Premium Header with Background Decorations
            SliverAppBar.large(
              expandedHeight: 180,
              leading: IconButton(
                onPressed: () async {
                  await ref.read(authStateProvider.notifier).logout();
                  if (context.mounted) {
                    Navigator.of(context).pushAndRemoveUntil(
                      MaterialPageRoute(builder: (_) => const RegisterScreen()),
                      (route) => false,
                    );
                  }
                },
                icon: const Icon(Icons.arrow_back_ios_new_rounded, color: Colors.white),
                tooltip: 'Volver a bienvenido',
              ),
              flexibleSpace: FlexibleSpaceBar(
                titlePadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
                title: Row(
                  children: [
                    Container(
                      height: 32,
                      width: 32,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.1),
                            blurRadius: 10,
                            offset: const Offset(0, 4),
                          ),
                        ],
                      ),
                      clipBehavior: Clip.antiAlias,
                      child: Transform.scale(
                        scale: 2.5,
                        child: Image.asset(
                          'assets/images/app_logo_user.png',
                          fit: BoxFit.contain,
                        ),
                      ),
                    ),
                    const SizedBox(width: 10),
                    Text(
                      'Catálogo de Plantas',
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
                background: Stack(
                  fit: StackFit.expand,
                  children: [
                    // Background color/gradient (Green premium gradient like Welcome screen)
                    Container(
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          begin: Alignment.topRight,
                          end: Alignment.bottomLeft,
                          colors: [
                            const Color(0xFF1B8A3D),
                            AppColors.primary,
                            const Color(0xFF43D477),
                          ],
                        ),
                      ),
                    ),
                    // Decorative Leaf Icons (White for high contrast)
                    Positioned(
                      top: 40,
                      right: -20,
                      child: Opacity(
                        opacity: 0.12,
                        child: const Icon(Icons.eco_rounded, size: 140, color: Colors.white),
                      ),
                    ),
                    Positioned(
                      bottom: -20,
                      left: -20,
                      child: Opacity(
                        opacity: 0.1,
                        child: const Icon(Icons.spa_rounded, size: 120, color: Colors.white),
                      ),
                    ),
                  ],
                ),
              ),
              actions: [

                Container(
                  margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 8),
                  decoration: BoxDecoration(
                    color: Theme.of(context).primaryColor.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: IconButton(
                    onPressed: () => themeNotifier.toggleTheme(),
                    icon: AnimatedSwitcher(
                      duration: const Duration(milliseconds: 300),
                      child: Icon(
                        isDark ? Icons.light_mode_rounded : Icons.dark_mode_rounded,
                        key: ValueKey(isDark),
                        size: 20,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.fromLTRB(0, 8, 16, 8),
                  decoration: BoxDecoration(
                    color: Theme.of(context).primaryColor.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: IconButton(
                    onPressed: () => notifier.refresh(),
                    icon: const Icon(Icons.refresh_rounded, size: 20, color: Colors.white),
                  ),
                ),
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

            // Compact Filter Row (Scrollable)
            SliverToBoxAdapter(
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                child: Row(
                  children: [
                    Icon(Icons.filter_list_rounded, size: 20, color: Colors.grey[500]),
                    const SizedBox(width: 12),
                    // Category dropdown
                    ref.watch(categoriesProvider).when(
                      data: (categories) => _FilterDropdown(
                        label: 'Categoría',
                        selectedLabel: state.categoryId != null
                            ? categories.firstWhere((c) => c.id == state.categoryId, orElse: () => categories.first).name
                            : null,
                        items: categories.map((c) => _FilterItem(id: c.id, name: c.name)).toList(),
                        selectedId: state.categoryId,
                        onSelected: (id) => notifier.updateCategory(id),
                      ),
                      loading: () => const SizedBox.shrink(),
                      error: (_, __) => const SizedBox.shrink(),
                    ),
                    const SizedBox(width: 8),
                    // Supplier dropdown
                    ref.watch(suppliersProvider).when(
                      data: (suppliers) => _FilterDropdown(
                        label: 'Proveedor',
                        selectedLabel: state.supplierId != null
                            ? suppliers.firstWhere((s) => s.id == state.supplierId, orElse: () => suppliers.first).name
                            : null,
                        items: suppliers.map((s) => _FilterItem(id: s.id, name: s.name)).toList(),
                        selectedId: state.supplierId,
                        onSelected: (id) => notifier.updateSupplier(id),
                      ),
                      loading: () => const SizedBox.shrink(),
                      error: (_, __) => const SizedBox.shrink(),
                    ),
                    const SizedBox(width: 8),
                    // Season dropdown
                    ref.watch(seasonsProvider).when(
                      data: (seasons) => _FilterDropdown(
                        label: 'Temporada',
                        selectedLabel: state.seasonId != null
                            ? seasons.firstWhere((s) => s.id == state.seasonId, orElse: () => seasons.first).name
                            : null,
                        items: seasons.map((s) => _FilterItem(id: s.id, name: s.name)).toList(),
                        selectedId: state.seasonId,
                        onSelected: (id) => notifier.updateSeason(id),
                      ),
                      loading: () => const SizedBox.shrink(),
                      error: (_, __) => const SizedBox.shrink(),
                    ),
                    // Clear filters button
                    if (state.categoryId != null || state.supplierId != null || state.seasonId != null) ...[
                      const SizedBox(width: 8),
                      InkWell(
                        onTap: () => notifier.clearFilters(),
                        borderRadius: BorderRadius.circular(20),
                        child: Container(
                          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(14),
                            color: Colors.red.withOpacity(0.1),
                          ),
                          child: Row(
                            children: [
                              const Icon(Icons.close_rounded, size: 16, color: Colors.red),
                              const SizedBox(width: 4),
                              const Text(
                                'Limpiar',
                                style: TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.red,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ],
                ),
              ),
            ),

            const SliverToBoxAdapter(child: SizedBox(height: 8)),

            // Search results indicator
            if (state.products.isNotEmpty)
              SliverToBoxAdapter(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  child: Row(
                    children: [
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                        decoration: BoxDecoration(
                          color: isDark ? const Color(0xFF1C2333) : Colors.grey[100],
                          borderRadius: BorderRadius.circular(12),
                          border: Border.all(
                            color: isDark ? AppColors.darkBorder : Colors.grey[300]!,
                            width: 0.5,
                          ),
                        ),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Icon(
                              Icons.grid_view_rounded, 
                              size: 14, 
                              color: isDark ? AppColors.darkAccent : AppColors.primary
                            ),
                            const SizedBox(width: 8),
                            Text(
                              '${state.products.length} productos',
                              style: TextStyle(
                                fontSize: 13,
                                fontWeight: FontWeight.bold,
                                color: isDark ? AppColors.darkTextPrimary : Colors.black87,
                              ),
                            ),
                          ],
                        ),
                      ),
                      const Spacer(),
                      if (state.search != null && state.search!.isNotEmpty) ...[
                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                          decoration: BoxDecoration(
                            color: AppColors.primary.withOpacity(0.1),
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              const Icon(Icons.search_rounded, size: 14, color: AppColors.primary),
                              const SizedBox(width: 6),
                              Text(
                                state.search!,
                                style: const TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.bold,
                                  color: AppColors.primary,
                                ),
                              ),
                            ],
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
                  message: state.error!.contains('DioException') || state.error!.contains('connection')
                      ? 'No pudimos conectar con el servidor. Por favor, verifica tu conexión a internet.'
                      : 'No pudimos cargar el catálogo en este momento.',
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

class _FilterDropdown extends StatelessWidget {
  final String label;
  final String? selectedLabel;
  final List<_FilterItem> items;
  final int? selectedId;
  final Function(int?) onSelected;

  const _FilterDropdown({
    required this.label,
    this.selectedLabel,
    required this.items,
    this.selectedId,
    required this.onSelected,
  });

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final isActive = selectedId != null;

    return GestureDetector(
      onTap: () {
        showModalBottomSheet<int?>(
          context: context,
          backgroundColor: Colors.transparent,
          isScrollControlled: true,
          builder: (context) {
            final isDarkModal = Theme.of(context).brightness == Brightness.dark;
            return Container(
              constraints: BoxConstraints(
                maxHeight: MediaQuery.of(context).size.height * 0.7,
              ),
              decoration: BoxDecoration(
                color: isDarkModal ? AppColors.darkSurface : Colors.white,
                borderRadius: const BorderRadius.vertical(top: Radius.circular(28)),
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const SizedBox(height: 12),
                  // Drag handle
                  Container(
                    width: 48,
                    height: 5,
                    decoration: BoxDecoration(
                      color: isDarkModal ? Colors.grey[700] : Colors.grey[300],
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  const SizedBox(height: 20),
                  // Title
                  Text(
                    'Seleccionar $label',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: isDarkModal ? AppColors.darkTextPrimary : Colors.black87,
                    ),
                  ),
                  const SizedBox(height: 16),
                  Divider(height: 1, color: isDarkModal ? AppColors.darkBorder : Colors.grey[200]),
                  // List
                  Flexible(
                    child: ListView(
                      shrinkWrap: true,
                      padding: const EdgeInsets.symmetric(vertical: 8),
                      children: [
                        _buildModalItem(context, null, 'Todos', selectedId == null, isDarkModal),
                        ...items.map((item) => _buildModalItem(context, item.id, item.name, selectedId == item.id, isDarkModal)),
                      ],
                    ),
                  ),
                ],
              ),
            );
          },
        ).then((value) {
          // If a value was selected (or 'Todos' which is null, but value is returned as a "special" null which we handle next)
          // Wait, Navigator.pop(context, null) is indistinguishable from dismissing the sheet.
          // Let's handle isSelected within the build item logic.
        });
      },
      child: Container(
        height: 38,
        padding: const EdgeInsets.symmetric(horizontal: 14),
        decoration: BoxDecoration(
          color: isActive
              ? AppColors.primary.withOpacity(0.12)
              : isDark ? AppColors.darkCard : Colors.white,
          borderRadius: BorderRadius.circular(14),
          border: Border.all(
            color: isActive
                ? AppColors.primary.withOpacity(0.4)
                : isDark ? AppColors.darkBorder : Colors.grey[200]!,
            width: isActive ? 1.5 : 1,
          ),
          boxShadow: [
            if (!isDark && !isActive)
              BoxShadow(
                color: Colors.black.withOpacity(0.04),
                blurRadius: 10,
                offset: const Offset(0, 4),
              ),
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              selectedLabel ?? label,
              style: TextStyle(
                fontSize: 13,
                fontWeight: isActive ? FontWeight.bold : FontWeight.w500,
                color: isActive
                    ? AppColors.primary
                    : isDark ? AppColors.darkTextPrimary : Colors.grey[700],
              ),
            ),
            const SizedBox(width: 6),
            Icon(
              Icons.keyboard_arrow_down_rounded,
              size: 20,
              color: isActive
                  ? AppColors.primary
                  : isDark ? AppColors.darkTextSecondary : Colors.grey[400],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildModalItem(BuildContext context, int? id, String name, bool isSelected, bool isDark) {
    return InkWell(
      onTap: () {
        // We call onSelected here directly instead of relying on Navigator.pop result
        // to handle the difference between "Todos" (id=null) and sheet dismissal (also null)
        onSelected(id == selectedId ? null : id);
        Navigator.pop(context);
      },
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
        decoration: BoxDecoration(
          color: isSelected ? AppColors.primary.withOpacity(0.08) : Colors.transparent,
        ),
        child: Row(
          children: [
            Icon(
              isSelected ? Icons.check_circle_rounded : Icons.circle_outlined,
              size: 22,
              color: isSelected ? AppColors.primary : (isDark ? Colors.grey[600] : Colors.grey[400]),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Text(
                name,
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: isSelected ? FontWeight.bold : FontWeight.w500,
                  color: isSelected 
                      ? AppColors.primary 
                      : (isDark ? AppColors.darkTextPrimary : Colors.black87),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

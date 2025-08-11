import 'package:flutter/material.dart';
import 'package:flutter_assignment_texas/core/resources/app_colors.dart';
import 'package:flutter_assignment_texas/core/resources/app_strings.dart';
import 'package:flutter_assignment_texas/core/resources/app_text_styles.dart';
import 'package:flutter_assignment_texas/presentation/pages/main_home/tabs/menu/widgets/app_menu_category_bar.dart';
import 'package:flutter_assignment_texas/presentation/pages/main_home/tabs/menu/widgets/app_menu_category_count.dart';
import 'package:flutter_assignment_texas/presentation/pages/main_home/tabs/menu/widgets/app_menu_item_card.dart';
import 'package:flutter_assignment_texas/presentation/pages/main_home/tabs/menu/cubit/menu_cubit.dart';
import 'package:flutter_assignment_texas/presentation/pages/main_home/tabs/menu/cubit/menu_states.dart';
import 'package:flutter_assignment_texas/presentation/cubits/cart/cart_cubit.dart';
import 'package:flutter_assignment_texas/presentation/cubits/cart/cart_states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MenuScreen extends StatelessWidget {
  const MenuScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Fetch restaurant items when screen loads
    context.read<MenuCubit>().fetchRestaurantItems();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SafeArea(
          child: Container(
            padding: EdgeInsets.only(left: 16, right: 12),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(AppStrings.exploreMenu, style: AppTextStyles.h2Bernier),
                Spacer(),
                IconButton(
                  icon: Icon(Icons.search, size: 29),
                  onPressed: () {
                    _showSearchDialog(context);
                  },
                ),
              ],
            ),
          ),
        ),
        SizedBox(height: 12),
        const AppMenuCategoryBar(),
        SizedBox(height: 16),
        const AppMenuCategoryCount(),
        // SizedBox(height: ),
        Expanded(
          child: BlocBuilder<MenuCubit, MenuState>(
            builder: (context, state) {
              if (state.isLoading) {
                return const Center(
                  child: CircularProgressIndicator(
                    color: AppColors.primaryOrange,
                  ),
                );
              }

              if (state.error != null) {
                return Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        AppStrings.errorLoadingMenuItems,
                        style: AppTextStyles.body,
                      ),
                      SizedBox(height: 16),
                      ElevatedButton(
                        onPressed: () {
                          context.read<MenuCubit>().fetchRestaurantItems();
                        },
                        child: Text(AppStrings.retry),
                      ),
                    ],
                  ),
                );
              }

              if (state.filteredItems.isEmpty) {
                return Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        state.selectedCategory == AppStrings.favorites
                            ? Icons.favorite_border
                            : Icons.search_off,
                        size: 64,
                        color: Colors.grey[400],
                      ),
                      SizedBox(height: 16),
                      Text(
                        state.selectedCategory == AppStrings.favorites
                            ? AppStrings.noFavoritesYet
                            : AppStrings.noItemsFound,
                        style: AppTextStyles.body.copyWith(
                          color: Colors.grey[600],
                        ),
                      ),
                      if (state.selectedCategory == AppStrings.favorites) ...[
                        SizedBox(height: 8),
                        Text(
                          AppStrings.tapHeartToFavorite,
                          style: AppTextStyles.bodyMutedSm.copyWith(
                            color: Colors.grey[500],
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ],
                  ),
                );
              }

              return ListView.builder(
                padding: EdgeInsets.all(0),
                itemBuilder: (context, index) {
                  final item = state.filteredItems[index];
                  return BlocBuilder<CartCubit, CartState>(
                    builder: (context, cartState) {
                      return AppMenuItemCard(
                        item: item,
                        isInCart: cartState.isItemInCart(item.itemID ?? 0),
                        cartQuantity: cartState.getItemQuantity(
                          item.itemID ?? 0,
                        ),
                        isFavorite: state.favoriteItems.contains(
                          item.itemID ?? 0,
                        ),
                        onAddToCart: () => context.read<CartCubit>().addToCart(
                          item.itemID ?? 0,
                        ),
                        onRemoveFromCart: () => context
                            .read<CartCubit>()
                            .removeFromCart(item.itemID ?? 0),
                        onToggleFavorite: () => context
                            .read<MenuCubit>()
                            .toggleFavorite(item.itemID ?? 0),
                      );
                    },
                  );
                },
                itemCount: state.filteredItems.length,
              );
            },
          ),
        ),
      ],
    );
  }

  void _showSearchDialog(BuildContext context) {
    final menuCubit = context.read<MenuCubit>();
    final currentSearchQuery = menuCubit.state.searchQuery;

    showDialog(
      context: context,
      builder: (dialogContext) {
        return BlocProvider.value(
          value: menuCubit,
          child: _SearchDialogContent(initialSearchQuery: currentSearchQuery),
        );
      },
    );
  }
}

class _SearchDialogContent extends StatefulWidget {
  final String initialSearchQuery;

  const _SearchDialogContent({required this.initialSearchQuery});

  @override
  State<_SearchDialogContent> createState() => _SearchDialogContentState();
}

class _SearchDialogContentState extends State<_SearchDialogContent> {
  late final TextEditingController _searchController;

  @override
  void initState() {
    super.initState();
    _searchController = TextEditingController(text: widget.initialSearchQuery);
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MenuCubit, MenuState>(
      builder: (context, state) {
        return AlertDialog(
          backgroundColor: AppColors.primaryOrange.withValues(alpha: .9),
          title: Text(
            AppStrings.searchTheMenu,
            style: AppTextStyles.bodySmall.copyWith(color: AppColors.body900),
          ),
          content: TextField(
            controller: _searchController,
            autofocus: true,
            style: AppTextStyles.bodySmall.copyWith(color: Colors.black),
            decoration: InputDecoration(
              hintText: AppStrings.searchHint,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
                borderSide: BorderSide(
                  color: AppColors.body900.withValues(alpha: .9),
                ),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
                borderSide: BorderSide(
                  color: AppColors.body900.withValues(alpha: .9),
                  width: 2.0,
                ),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
                borderSide: BorderSide(
                  color: AppColors.body900.withValues(alpha: .9),
                ),
              ),
              hintStyle: AppTextStyles.bodySmall.copyWith(
                color: AppColors.body900.withValues(alpha: .8),
              ),
            ),
            onChanged: (query) => context.read<MenuCubit>().searchItems(query),
          ),
          actions: [
            TextButton(
              onPressed: () {
                _searchController.clear();
                context.read<MenuCubit>().searchItems('');
                Navigator.of(context).pop();
              },
              child: Text(
                AppStrings.clear,
                style: AppTextStyles.body.copyWith(
                  color: AppColors.body900.withValues(alpha: .8),
                ),
              ),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text(
                AppStrings.close,
                style: AppTextStyles.body.copyWith(
                  color: AppColors.body900.withValues(alpha: .8),
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}

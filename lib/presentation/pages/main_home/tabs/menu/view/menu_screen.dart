import 'package:flutter/material.dart';
import 'package:flutter_assignment_texas/core/resources/app_colors.dart';
import 'package:flutter_assignment_texas/presentation/pages/main_home/tabs/menu/widgets/app_menu_category_bar.dart';
import 'package:flutter_assignment_texas/presentation/pages/main_home/tabs/menu/widgets/app_menu_category_count.dart';
import 'package:flutter_assignment_texas/presentation/pages/main_home/tabs/menu/widgets/app_menu_item_card.dart';
import 'package:flutter_assignment_texas/presentation/pages/main_home/tabs/menu/cubit/menu_cubit.dart';
import 'package:flutter_assignment_texas/presentation/pages/main_home/tabs/menu/cubit/menu_states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

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
            padding: EdgeInsets.symmetric(horizontal: 16.w),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'EXPLORE MENU',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 22.r,
                    fontFamily: 'BERNIER',
                  ),
                ),
                Spacer(),
                IconButton(
                  icon: Icon(Icons.search, size: 32.r),
                  onPressed: () {
                    _showSearchDialog(context);
                  },
                ),
              ],
            ),
          ),
        ),
        SizedBox(height: 12.h),
        const AppMenuCategoryBar(),
        SizedBox(height: 16.h),
        const AppMenuCategoryCount(),
        // SizedBox(height: .h),
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
                        'Error loading menu items',
                        style: TextStyle(
                          fontSize: 18.r,
                          fontFamily: 'SpecialGothicCondensedOne',
                        ),
                      ),
                      SizedBox(height: 16.h),
                      ElevatedButton(
                        onPressed: () {
                          context.read<MenuCubit>().fetchRestaurantItems();
                        },
                        child: Text('Retry'),
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
                        state.selectedCategory == 'Favorites'
                            ? Icons.favorite_border
                            : Icons.search_off,
                        size: 64.r,
                        color: Colors.grey[400],
                      ),
                      SizedBox(height: 16.h),
                      Text(
                        state.selectedCategory == 'Favorites'
                            ? 'No favorite items yet'
                            : 'No items found',
                        style: TextStyle(
                          fontSize: 18.r,
                          fontFamily: 'SpecialGothicCondensedOne',
                          color: Colors.grey[600],
                        ),
                      ),
                      if (state.selectedCategory == 'Favorites') ...[
                        SizedBox(height: 8.h),
                        Text(
                          'Tap the heart icon on items to add them to favorites',
                          style: TextStyle(
                            fontSize: 14.r,
                            fontFamily: 'SpecialGothicCondensedOne',
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
                  return BlocBuilder<MenuCubit, MenuState>(
                    builder: (context, currentState) {
                      return AppMenuItemCard(
                        item: item,
                        isInCart: currentState.cartItems.containsKey(
                          item.itemID ?? 0,
                        ),
                        cartQuantity:
                            currentState.cartItems[item.itemID ?? 0] ?? 0,
                        isFavorite: currentState.favoriteItems.contains(
                          item.itemID ?? 0,
                        ),
                        onAddToCart: () => context.read<MenuCubit>().addToCart(
                          item.itemID ?? 0,
                        ),
                        onRemoveFromCart: () => context
                            .read<MenuCubit>()
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

    showDialog(
      context: context,
      builder: (dialogContext) {
        return BlocProvider.value(
          value: menuCubit,
          child: BlocBuilder<MenuCubit, MenuState>(
            builder: (context, state) {
              return AlertDialog(
                backgroundColor: AppColors.primaryOrange.withValues(alpha: .9),
                title: Text(
                  'Search The Menu',
                  style: TextStyle(
                    fontFamily: 'SpecialGothicCondensedOne',
                    fontSize: 18.r,
                    color: AppColors.body900,
                  ),
                ),
                content: TextField(
                  decoration: InputDecoration(
                    hintText: 'Search for items...',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8.r),
                      borderSide: BorderSide(
                        color: AppColors.body900.withValues(alpha: .9),
                      ),
                    ),
                    hintStyle: TextStyle(
                      fontFamily: 'SpecialGothicCondensedOne',
                      fontSize: 16.r,
                      color: AppColors.body900.withValues(alpha: .8),
                    ),
                  ),
                  onChanged: (query) => menuCubit.searchItems(query),
                ),
                actions: [
                  TextButton(
                    onPressed: () {
                      menuCubit.searchItems('');
                      Navigator.of(dialogContext).pop();
                    },
                    child: Text(
                      'Clear',
                      style: TextStyle(
                        fontFamily: 'SpecialGothicCondensedOne',
                        fontSize: 18.r,
                        color: AppColors.body900.withValues(alpha: .8),
                      ),
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.of(dialogContext).pop();
                    },
                    child: Text(
                      'Close',
                      style: TextStyle(
                        fontFamily: 'SpecialGothicCondensedOne',
                        fontSize: 18.r,
                        color: AppColors.body900.withValues(alpha: .8),
                      ),
                    ),
                  ),
                ],
              );
            },
          ),
        );
      },
    );
  }
}

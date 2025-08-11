import 'package:flutter/material.dart';
import 'package:flutter_assignment_texas/core/resources/app_colors.dart';
import 'package:flutter_assignment_texas/presentation/pages/main_home/tabs/menu/cubit/menu_cubit.dart';
import 'package:flutter_assignment_texas/presentation/pages/main_home/tabs/menu/cubit/menu_states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_assignment_texas/core/resources/app_text_styles.dart';
import 'package:flutter_assignment_texas/core/resources/app_strings.dart';

class AppMenuCategoryBar extends StatelessWidget {
  const AppMenuCategoryBar({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 40,
      child: Row(
        children: [
          SizedBox(width: 16),
          Expanded(
            child: BlocBuilder<MenuCubit, MenuState>(
              builder: (context, state) {
                if (state.categories.isEmpty) {
                  return Container(); // Show nothing if no categories
                }

                return ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    final category = state.categories[index];
                    final isSelected = state.selectedCategory == category;

                    return GestureDetector(
                      onTap: () {
                        context.read<MenuCubit>().selectCategory(category);
                      },
                      child: Container(
                        margin: EdgeInsets.only(top: 4, bottom: 4, right: 16),
                        decoration: BoxDecoration(
                          color: isSelected
                              ? AppColors.primaryOrange
                              : Colors.transparent,
                          borderRadius: BorderRadius.circular(24),
                          border: Border.all(
                            color: AppColors.primaryOrange,
                            width: 1,
                          ),
                        ),
                        child: Row(
                          children: [
                            Stack(
                              children: [
                                CircleAvatar(
                                  radius: 16,
                                  backgroundColor: Colors.white,
                                  child: _getCategoryIcon(category),
                                ),
                                if (category == AppStrings.favorites &&
                                    state.favoriteItems.isNotEmpty)
                                  Positioned(
                                    right: 0,
                                    top: 0,
                                    child: Container(
                                      padding: EdgeInsets.all(2),
                                      decoration: BoxDecoration(
                                        color: AppColors.secondaryRed,
                                        borderRadius: BorderRadius.circular(8),
                                      ),
                                      constraints: BoxConstraints(
                                        minWidth: 16,
                                        minHeight: 16,
                                      ),
                                      child: Text(
                                        '${state.favoriteItems.length}',
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 10,
                                          fontWeight: FontWeight.bold,
                                        ),
                                        textAlign: TextAlign.center,
                                      ),
                                    ),
                                  ),
                              ],
                            ),
                            Container(
                              padding: EdgeInsets.only(
                                top: 2,
                                bottom: 2,
                                right: 16,
                                left: 8,
                              ),
                              child: Text(
                                category,
                                style: AppTextStyles.body.copyWith(
                                  fontSize: 18,
                                  color: AppColors.body900,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                  itemCount: state.categories.length,
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _getCategoryIcon(String category) {
    final lower = category.toLowerCase();
    final IconData iconData = switch (lower) {
      'favorites' => Icons.favorite,
      'sandwiches' => Icons.lunch_dining,
      'burgers' => Icons.fastfood,
      'pizza' => Icons.local_pizza,
      'salads' => Icons.eco,
      'drinks' => Icons.local_drink,
      _ => Icons.restaurant,
    };
    final Color iconColor = lower == 'favorites'
        ? AppColors.secondaryRed
        : AppColors.primaryOrange;
    return Icon(iconData, size: 24, color: iconColor);
  }
}

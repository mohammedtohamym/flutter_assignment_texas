import 'package:flutter/material.dart';
import 'package:flutter_assignment_texas/core/resources/app_colors.dart';
import 'package:flutter_assignment_texas/presentation/pages/main_home/tabs/menu/cubit/menu_cubit.dart';
import 'package:flutter_assignment_texas/presentation/pages/main_home/tabs/menu/cubit/menu_states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
                                if (category == 'Favorites' &&
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
                                style: TextStyle(
                                  fontSize: 18,
                                  fontFamily: 'SpecialGothicCondensedOne',
                                  color: isSelected
                                      ? Colors.white
                                      : AppColors.body900,
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
    IconData iconData;
    Color iconColor = AppColors.primaryOrange;

    switch (category.toLowerCase()) {
      case 'favorites':
        iconData = Icons.favorite;
        iconColor = AppColors.secondaryRed;
        break;
      case 'sandwiches':
        iconData = Icons.lunch_dining;
        break;
      case 'burgers':
        iconData = Icons.fastfood;
        break;
      case 'pizza':
        iconData = Icons.local_pizza;
        break;
      case 'salads':
        iconData = Icons.eco;
        break;
      case 'drinks':
        iconData = Icons.local_drink;
        break;
      default:
        iconData = Icons.restaurant;
    }

    return Icon(iconData, size: 16, color: iconColor);
  }
}

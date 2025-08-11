import 'package:flutter/material.dart';
import 'package:flutter_assignment_texas/core/resources/app_colors.dart';
import 'package:flutter_assignment_texas/presentation/pages/main_home/tabs/menu/cubit/menu_cubit.dart';
import 'package:flutter_assignment_texas/presentation/pages/main_home/tabs/menu/cubit/menu_states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppMenuCategoryBar extends StatelessWidget {
  const AppMenuCategoryBar({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 40.h,
      child: Row(
        children: [
          SizedBox(width: 16.w),
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
                        margin: EdgeInsets.only(
                          top: 4.h,
                          bottom: 4.h,
                          right: 16.w,
                        ),
                        decoration: BoxDecoration(
                          color: isSelected
                              ? AppColors.primaryOrange
                              : Colors.transparent,
                          borderRadius: BorderRadius.circular(24.r),
                          border: Border.all(
                            color: AppColors.primaryOrange,
                            width: 1.w,
                          ),
                        ),
                        child: Row(
                          children: [
                            Stack(
                              children: [
                                CircleAvatar(
                                  radius: 16.r,
                                  backgroundColor: Colors.white,
                                  child: _getCategoryIcon(category),
                                ),
                                if (category == 'Favorites' &&
                                    state.favoriteItems.isNotEmpty)
                                  Positioned(
                                    right: 0,
                                    top: 0,
                                    child: Container(
                                      padding: EdgeInsets.all(2.r),
                                      decoration: BoxDecoration(
                                        color: AppColors.secondaryRed,
                                        borderRadius: BorderRadius.circular(
                                          8.r,
                                        ),
                                      ),
                                      constraints: BoxConstraints(
                                        minWidth: 16.r,
                                        minHeight: 16.r,
                                      ),
                                      child: Text(
                                        '${state.favoriteItems.length}',
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 10.r,
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
                                top: 2.h,
                                bottom: 2.h,
                                right: 16.w,
                                left: 8.w,
                              ),
                              child: Text(
                                category,
                                style: TextStyle(
                                  fontSize: 18.r,
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

    return Icon(iconData, size: 16.r, color: iconColor);
  }
}

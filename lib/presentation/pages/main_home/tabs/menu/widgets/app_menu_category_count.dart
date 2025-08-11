import 'package:flutter/material.dart';
import 'package:flutter_assignment_texas/core/resources/app_colors.dart';
import 'package:flutter_assignment_texas/core/resources/app_strings.dart';
import 'package:flutter_assignment_texas/core/resources/app_text_styles.dart';
import 'package:flutter_assignment_texas/presentation/pages/main_home/tabs/menu/cubit/menu_cubit.dart';
import 'package:flutter_assignment_texas/presentation/pages/main_home/tabs/menu/cubit/menu_states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AppMenuCategoryCount extends StatelessWidget {
  const AppMenuCategoryCount({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16),
      child: BlocBuilder<MenuCubit, MenuState>(
        builder: (context, state) {
          if (state.isLoading) {
      return Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
        Text(AppStrings.loading,
          style: AppTextStyles.body.copyWith(fontSize: 24)),
              ],
            );
          }

          final categoryName = state.selectedCategoryName;
          final itemCount = state.selectedCategoryItemCount;

      return Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
        Text(categoryName,
          style: AppTextStyles.body.copyWith(fontSize: 24)),
              SizedBox(width: 4),
              Transform.translate(
                offset: Offset(0, 2),
        child: Text(AppStrings.itemsCount(itemCount),
          style: AppTextStyles.bodyMuted),
              ),
              if (state.favoriteItems.isNotEmpty) ...[
                SizedBox(width: 16),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                  decoration: BoxDecoration(
                    color: AppColors.secondaryRed.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(
                      color: AppColors.secondaryRed.withOpacity(0.3),
                      width: 1,
                    ),
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(
                        Icons.favorite,
                        color: AppColors.secondaryRed,
                        size: 14,
                      ),
                      SizedBox(width: 4),
                      Text('${state.favoriteItems.length}',
                          style: AppTextStyles.bodyMutedSm.copyWith(
                            color: AppColors.secondaryRed,
                            fontWeight: FontWeight.bold,
                          )),
                    ],
                  ),
                ),
              ],
              if (state.searchQuery.isNotEmpty) ...[
                SizedBox(width: 8),
                Transform.translate(
                  offset: Offset(0, 2),
                  child: Text(
                    AppStrings.searchQueryLabel(state.searchQuery),
                    style: AppTextStyles.bodyMutedSm
                        .copyWith(color: AppColors.secondaryRed),
                  ),
                ),
              ],
            ],
          );
        },
      ),
    );
  }
}

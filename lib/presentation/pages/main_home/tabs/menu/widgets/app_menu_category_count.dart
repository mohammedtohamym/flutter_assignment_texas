import 'package:flutter/material.dart';
import 'package:flutter_assignment_texas/core/resources/app_colors.dart';
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
                Text(
                  'Loading...',
                  style: TextStyle(
                    fontSize: 24,
                    fontFamily: 'SpecialGothicCondensedOne',
                    color: AppColors.body900,
                  ),
                ),
              ],
            );
          }

          final categoryName = state.selectedCategoryName;
          final itemCount = state.selectedCategoryItemCount;

          return Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                categoryName,
                style: TextStyle(
                  fontSize: 24,
                  fontFamily: 'SpecialGothicCondensedOne',
                  color: AppColors.body900,
                ),
              ),
              SizedBox(width: 4),
              Transform.translate(
                offset: Offset(0, 2),
                child: Text(
                  '($itemCount Items)',
                  style: TextStyle(
                    fontSize: 16,
                    fontFamily: 'SpecialGothicCondensedOne',
                    color: AppColors.body700,
                  ),
                ),
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
                      Text(
                        '${state.favoriteItems.length}',
                        style: TextStyle(
                          fontSize: 14,
                          fontFamily: 'SpecialGothicCondensedOne',
                          color: AppColors.secondaryRed,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
              if (state.searchQuery.isNotEmpty) ...[
                SizedBox(width: 8),
                Transform.translate(
                  offset: Offset(0, 2),
                  child: Text(
                    '• Search: "${state.searchQuery}"',
                    style: TextStyle(
                      fontSize: 14,
                      fontFamily: 'SpecialGothicCondensedOne',
                      color: AppColors.secondaryRed,
                    ),
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

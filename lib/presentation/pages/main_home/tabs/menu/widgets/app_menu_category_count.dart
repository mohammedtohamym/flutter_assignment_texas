import 'package:flutter/material.dart';
import 'package:flutter_assignment_texas/core/resources/app_colors.dart';
import 'package:flutter_assignment_texas/presentation/pages/main_home/tabs/menu/cubit/menu_cubit.dart';
import 'package:flutter_assignment_texas/presentation/pages/main_home/tabs/menu/cubit/menu_states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppMenuCategoryCount extends StatelessWidget {
  const AppMenuCategoryCount({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      child: BlocBuilder<MenuCubit, MenuState>(
        builder: (context, state) {
          if (state.isLoading) {
            return Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  'Loading...',
                  style: TextStyle(
                    fontSize: 24.r,
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
                  fontSize: 24.r,
                  fontFamily: 'SpecialGothicCondensedOne',
                  color: AppColors.body900,
                ),
              ),
              SizedBox(width: 4.w),
              Transform.translate(
                offset: Offset(0, 2.h),
                child: Text(
                  '($itemCount Items)',
                  style: TextStyle(
                    fontSize: 16.r,
                    fontFamily: 'SpecialGothicCondensedOne',
                    color: AppColors.body700,
                  ),
                ),
              ),
              if (state.favoriteItems.isNotEmpty) ...[
                SizedBox(width: 16.w),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 2.h),
                  decoration: BoxDecoration(
                    color: AppColors.secondaryRed.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(12.r),
                    border: Border.all(
                      color: AppColors.secondaryRed.withOpacity(0.3),
                      width: 1.w,
                    ),
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(
                        Icons.favorite,
                        color: AppColors.secondaryRed,
                        size: 14.r,
                      ),
                      SizedBox(width: 4.w),
                      Text(
                        '${state.favoriteItems.length}',
                        style: TextStyle(
                          fontSize: 14.r,
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
                SizedBox(width: 8.w),
                Transform.translate(
                  offset: Offset(0, 2.h),
                  child: Text(
                    '• Search: "${state.searchQuery}"',
                    style: TextStyle(
                      fontSize: 14.r,
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

import 'package:flutter/material.dart';
import 'package:flutter_assignment_texas/core/resources/app_colors.dart';
import 'package:flutter_assignment_texas/core/resources/app_strings.dart';
import 'package:flutter_assignment_texas/core/resources/app_text_styles.dart';
import 'package:flutter_assignment_texas/presentation/pages/main_home/tabs/menu/cubit/menu_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

/// Stateless search dialog that relies on MenuCubit for state.
class AppMenuSearchDialog extends StatelessWidget {
  const AppMenuSearchDialog({super.key});

  @override
  Widget build(BuildContext context) {
    final menuCubit = context.read<MenuCubit>();
    final initialQuery = menuCubit.state.searchQuery;

    return AlertDialog(
      backgroundColor: AppColors.primaryOrange.withValues(alpha: .9),
      title: Text(
        AppStrings.searchTheMenu,
        style: AppTextStyles.bodySmall.copyWith(color: AppColors.body900),
      ),
      content: TextFormField(
        initialValue: initialQuery,
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
        onChanged: (query) => menuCubit.searchItems(query),
      ),
      actions: [
        TextButton(
          onPressed: () {
            menuCubit.searchItems('');
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
          onPressed: () => Navigator.of(context).pop(),
          child: Text(
            AppStrings.close,
            style: AppTextStyles.body.copyWith(
              color: AppColors.body900.withValues(alpha: .8),
            ),
          ),
        ),
      ],
    );
  }
}

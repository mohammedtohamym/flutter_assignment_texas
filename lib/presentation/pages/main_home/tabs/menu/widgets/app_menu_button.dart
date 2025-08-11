import 'package:flutter/material.dart';
import 'package:flutter_assignment_texas/core/resources/app_assets.dart';
import 'package:flutter_assignment_texas/core/resources/app_colors.dart';
import 'package:flutter_assignment_texas/core/resources/app_strings.dart';
import 'package:flutter_assignment_texas/core/resources/app_text_styles.dart';
import 'package:flutter_svg/svg.dart';

enum MenuButtonType { addToCart, addSmall, remove, customize }

/// Reusable button widget for menu items.
class AppMenuButton extends StatelessWidget {
  final VoidCallback onPressed;
  final MenuButtonType buttonType;
  final bool? isMoreThanOne; // Only needed for remove button
  final int? cartQuantity; // Only needed for quantity display

  const AppMenuButton({
    super.key,
    required this.onPressed,
    required this.buttonType,
    this.isMoreThanOne,
    this.cartQuantity,
  });

  @override
  Widget build(BuildContext context) {
    switch (buttonType) {
      case MenuButtonType.addToCart:
        return ElevatedButton(
          onPressed: onPressed,
          style: ElevatedButton.styleFrom(
            elevation: 0,
            minimumSize: Size(140, 40),
            padding: EdgeInsets.zero,
            tapTargetSize: MaterialTapTargetSize.shrinkWrap,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(4),
            ),
            backgroundColor: AppColors.primaryOrange,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SvgPicture.asset(
                AppAssets.addIcon,
                colorFilter: ColorFilter.mode(
                  AppColors.body900,
                  BlendMode.srcIn,
                ),
                width: 12,
                height: 12,
              ),
              SizedBox(width: 4),
              Text(AppStrings.addToCart, style: AppTextStyles.button),
            ],
          ),
        );

      case MenuButtonType.addSmall:
      case MenuButtonType.remove:
        return Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(6),
            boxShadow: [
              BoxShadow(
                color: AppColors.body700.withValues(alpha: 0.2),
                blurRadius: 4,
                spreadRadius: 1,
              ),
            ],
          ),
          child: ElevatedButton(
            onPressed: onPressed,
            style: ElevatedButton.styleFrom(
              elevation: 4,
              minimumSize: Size(40, 40),
              padding: EdgeInsets.zero,
              tapTargetSize: MaterialTapTargetSize.shrinkWrap,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(6),
              ),
              backgroundColor: _getButtonColor(),
            ),
            child: _getButtonChild(),
          ),
        );

      case MenuButtonType.customize:
        return ElevatedButton(
          onPressed: onPressed,
          style: ElevatedButton.styleFrom(
            elevation: 0,
            minimumSize: Size(4, 20),
            padding: EdgeInsets.zero,
            tapTargetSize: MaterialTapTargetSize.shrinkWrap,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(4),
            ),
            backgroundColor: AppColors.transparent,
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(AppStrings.customize, style: AppTextStyles.buttonSmall),
              SizedBox(width: 4),
              Transform.translate(
                offset: Offset(0, 2),
                child: CircleAvatar(
                  backgroundColor: AppColors.secondaryRed,
                  radius: 8,
                  child: SvgPicture.asset(
                    AppAssets.rightArrowIcon,
                    colorFilter: ColorFilter.mode(
                      AppColors.white,
                      BlendMode.srcIn,
                    ),
                    width: 8,
                    height: 8,
                  ),
                ),
              ),
            ],
          ),
        );
    }
  }

  Color _getButtonColor() {
    switch (buttonType) {
      case MenuButtonType.addSmall:
        return AppColors.primaryOrange;
      case MenuButtonType.remove:
        return AppColors.body300;
      default:
        return AppColors.primaryOrange;
    }
  }

  Widget _getButtonChild() {
    switch (buttonType) {
      case MenuButtonType.addSmall:
        return SvgPicture.asset(
          AppAssets.addIcon,
          colorFilter: ColorFilter.mode(AppColors.body900, BlendMode.srcIn),
          width: 16,
          height: 16,
        );
      case MenuButtonType.remove:
        return (isMoreThanOne ?? false)
            ? Text(
                '-',
                style: AppTextStyles.body.copyWith(
                  fontSize: 24,
                  color: AppColors.body900,
                ),
              )
            : SvgPicture.asset(
                AppAssets.trashIcon,
                colorFilter: ColorFilter.mode(
                  AppColors.body900,
                  BlendMode.srcIn,
                ),
                width: 12,
                height: 12,
              );
      default:
        return Container();
    }
  }
}

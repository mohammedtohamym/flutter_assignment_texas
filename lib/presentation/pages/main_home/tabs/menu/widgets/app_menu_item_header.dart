import 'package:flutter/material.dart';
import 'package:flutter_assignment_texas/core/resources/app_colors.dart';
import 'package:flutter_assignment_texas/core/resources/app_text_styles.dart';

class AppMenuItemHeader extends StatelessWidget {
  final String title;
  final bool isFavorite;
  final VoidCallback onToggleFavorite;

  const AppMenuItemHeader({
    super.key,
    required this.title,
    required this.isFavorite,
    required this.onToggleFavorite,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Expanded(
          child: Transform.translate(
            offset: Offset(0, -4),
            child: Text(
              title,
              style: AppTextStyles.body.copyWith(fontSize: 20),
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ),
        IconButton(
          icon: AnimatedSwitcher(
            duration: Duration(milliseconds: 300),
            transitionBuilder: (child, animation) =>
                ScaleTransition(scale: animation, child: child),
            child: Icon(
              isFavorite ? Icons.favorite : Icons.favorite_border,
              key: ValueKey(isFavorite),
              color: isFavorite ? AppColors.secondaryRed : AppColors.black,
              size: 24,
            ),
          ),
          onPressed: onToggleFavorite,
        ),
      ],
    );
  }
}

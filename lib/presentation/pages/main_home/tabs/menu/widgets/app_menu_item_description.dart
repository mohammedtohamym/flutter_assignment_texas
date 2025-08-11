import 'package:flutter/material.dart';
import 'package:flutter_assignment_texas/core/resources/app_text_styles.dart';

class AppMenuItemDescription extends StatelessWidget {
  final String description;
  const AppMenuItemDescription({super.key, required this.description});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      child: Text(
        description,
        style: AppTextStyles.bodyMuted,
        softWrap: true,
        maxLines: 2,
        overflow: TextOverflow.ellipsis,
      ),
    );
  }
}

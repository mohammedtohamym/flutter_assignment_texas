import 'package:flutter/material.dart';
import 'package:flutter_assignment_texas/core/resources/app_strings.dart';
import 'package:flutter_assignment_texas/core/resources/app_text_styles.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        AppStrings.homeScreenTitle,
        style: AppTextStyles.body.copyWith(fontSize: 24),
      ),
    );
  }
}

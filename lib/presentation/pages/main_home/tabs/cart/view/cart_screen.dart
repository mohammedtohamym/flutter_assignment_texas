import 'package:flutter/material.dart';
import 'package:flutter_assignment_texas/core/resources/app_strings.dart';
import 'package:flutter_assignment_texas/core/resources/app_text_styles.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
    child: Text(AppStrings.cartScreenTitle,
      style: AppTextStyles.body.copyWith(fontSize: 24)),
    );
  }
}

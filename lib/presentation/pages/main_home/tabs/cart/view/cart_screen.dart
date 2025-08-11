import 'package:flutter/material.dart';
import 'package:flutter_assignment_texas/core/resources/app_fonts.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        'Cart Screen',
        style: TextStyle(
          fontSize: 24,
          fontFamily: AppFonts.getSpecialGothicCondensedOne(),
        ),
      ),
    );
  }
}

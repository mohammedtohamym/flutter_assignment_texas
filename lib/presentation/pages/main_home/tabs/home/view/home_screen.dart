import 'package:flutter/material.dart';
import 'package:flutter_assignment_texas/core/resources/app_fonts.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        'Home Screen',
        style: TextStyle(
          fontSize: 24,
          fontFamily: AppFonts.getSpecialGothicCondensedOne(),
        ),
      ),
    );
  }
}

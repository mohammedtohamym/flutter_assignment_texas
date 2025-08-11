import 'package:flutter/material.dart';
import 'package:flutter_assignment_texas/core/resources/app_fonts.dart';

class MoreScreen extends StatelessWidget {
  const MoreScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        'More Screen',
        style: TextStyle(
          fontSize: 24,
          fontFamily: AppFonts.getSpecialGothicCondensedOne(),
        ),
      ),
    );
  }
}

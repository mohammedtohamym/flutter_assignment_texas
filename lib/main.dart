import 'package:flutter/material.dart';
import 'package:flutter_assignment_texas/core/di/dependency_injection.dart';
import 'package:flutter_assignment_texas/presentation/pages/main_home/view/main_home_screen.dart';
import 'package:flutter_assignment_texas/utils/app_routes.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await configureDependencies();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: Size(428, 925),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          initialRoute: AppRoutes.mainHome,
          routes: {AppRoutes.mainHome: (context) => MainHomeScreen()},
        );
      },
    );
  }
}

// todo : add the counter stack to the cart
// todo : add the back button functionality to the profile back to move back a step (maybe use a stack)
// todo : add the overlay to the cart in the navbar
// todo : change all the strings to app strings
// todo : add more and home page text
// todo : use app assets
// todo : organize code better (widgets)

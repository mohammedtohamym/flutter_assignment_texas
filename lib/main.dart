import 'package:flutter/material.dart';
import 'package:flutter_assignment_texas/presentation/pages/main_home/view/main_home_screen.dart';
import 'package:flutter_assignment_texas/utils/app_routes.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void main() {
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

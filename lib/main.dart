import 'package:flutter/material.dart';
import 'package:flutter_assignment_texas/core/di/dependency_injection.dart';
import 'package:flutter_assignment_texas/presentation/pages/main_home/view/main_home_screen.dart';
import 'package:flutter_assignment_texas/utils/app_routes.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await configureDependencies();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: AppRoutes.mainHome,
      routes: {AppRoutes.mainHome: (context) => MainHomeScreen()},
    );
  }
}

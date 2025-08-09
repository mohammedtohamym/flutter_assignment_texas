import 'package:flutter/material.dart';
import 'package:flutter_assignment_texas/app/app_theme.dart';

final GlobalKey<NavigatorState> appKey = GlobalKey<NavigatorState>();
BuildContext get appContext => appKey.currentContext!;

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: getAppTheme(context),
      navigatorKey: appKey,
    );
  }
}

import 'package:flutter/cupertino.dart';
import 'package:flutter_assignment_texas/app/app.dart';

class AppRouter {
  static PageRoute<T> getPageRoute<T>(Widget pageWidget) =>
      CupertinoPageRoute(builder: (context) => pageWidget);

  static Future<T?> push<T>(Widget child) =>
      Navigator.push(appContext, getPageRoute<T>(child));

  static Future<T?> pushReplacement<T>(Widget child) =>
      Navigator.pushReplacement(appContext, getPageRoute<T>(child));

  static Future<T?> pushAndRemoveUntil<T>(
    Widget child,
    bool Function(Route<dynamic>) predicate,
  ) => Navigator.pushAndRemoveUntil(
    appContext,
    getPageRoute<T>(child),
    predicate,
  );
}

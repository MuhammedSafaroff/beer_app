import 'package:flutter/material.dart';

class AppRouter {
  AppRouter._();

  static Route<dynamic> onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      // case AppRoutes.home:
      //   return MaterialPageRoute(
      //     builder: (context) => HomePage(),
      //   );

      default:
        throw UnimplementedError('No defined route: ${settings.name}');
    }
  }
}

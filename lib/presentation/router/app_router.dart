import 'package:beer_app/domain/entities/beers.dart';
import 'package:beer_app/presentation/pages/home_details/home_details.dart';
import 'package:flutter/material.dart';

import '../../core/constants/routes.dart';

class AppRouter {
  AppRouter._();

  static Route<dynamic> onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case AppRoutes.homeDetails:
        return MaterialPageRoute(
          settings: settings,
          builder: (context) => HomeDetails(),
        );

      default:
        throw UnimplementedError('No defined route: ${settings.name}');
    }
  }
}

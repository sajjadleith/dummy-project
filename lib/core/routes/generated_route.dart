import 'package:flutter/material.dart';
import 'package:music_app/core/routes/app_routes.dart';
import 'package:music_app/screens/page_screen.dart';
import 'package:music_app/screens/page_screen2.dart';
import 'package:music_app/screens/page_screen3.dart';

class AppRouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    final args = settings.arguments as Map?;
    switch (settings.name) {
      case AppRoutes.defaultRoute:
        return MaterialPageRoute(builder: (context) => PageScreen());
      case AppRoutes.secondRoute:
        return MaterialPageRoute(
          builder: (context) =>
              PageScreen2(info: args as Map<String, dynamic>?),
        );
      case AppRoutes.thirdRoute:
        return MaterialPageRoute(
          builder: (context) => PageScreen3(info: args as Map<String, dynamic>),
        );
      default:
        return MaterialPageRoute(
          builder: (context) =>
              const Scaffold(body: Center(child: Text("Eror Page not found"))),
        );
    }
  }
}

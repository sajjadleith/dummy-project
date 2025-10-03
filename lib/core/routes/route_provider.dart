import 'package:music_app/core/routes/app_routes.dart';
import 'package:music_app/screens/page_screen.dart';
import 'package:music_app/screens/page_screen2.dart';
import 'package:music_app/screens/page_screen3.dart';

final routeProvider = {
  AppRoutes.defaultRoute: (context) => PageScreen(),
  AppRoutes.secondRoute: (context) => PageScreen2(),
  AppRoutes.thirdRoute: (context) => PageScreen3(),
};

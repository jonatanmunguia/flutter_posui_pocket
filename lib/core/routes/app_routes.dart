import 'package:flutter/material.dart';
import 'package:flutter_posui_pocket/features/splash/presentation/splash_screen.dart';

class AppRoutes {
  static const initialRoute = SplashScreen.idScreen;
  static Map<String, Widget Function(BuildContext)> routes = {
    SplashScreen.idScreen: (_) => const SplashScreen()
  };
}

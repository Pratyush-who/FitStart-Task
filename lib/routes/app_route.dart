import 'package:flutter/material.dart';
import 'package:fitstart/screens/splash_screen.dart';
import 'package:fitstart/screens/onboarding/height_screen.dart';
import 'package:fitstart/screens/onboarding/weight_screen.dart';
import 'package:fitstart/screens/onboarding/age_screen.dart';
import 'package:fitstart/screens/home_screen.dart';

class AppRouter {
  static const String splash = '/';
  static const String height = '/height';
  static const String weight = '/weight';
  static const String age = '/age';
  static const String home = '/home';

  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case splash:
        return MaterialPageRoute(builder: (_) => const SplashScreen());
      case height:
        return MaterialPageRoute(builder: (_) => const HeightScreen());
      case weight:
        return MaterialPageRoute(builder: (_) => const WeightScreen());
      case age:
        return MaterialPageRoute(builder: (_) => const AgeScreen());
      case home:
        return MaterialPageRoute(builder: (_) => const HomeScreen());
      default:
        return MaterialPageRoute(
          builder: (_) => Scaffold(
            body: Center(
              child: Text('No route defined for ${settings.name}'),
            ),
          ),
        );
    }
  }
}
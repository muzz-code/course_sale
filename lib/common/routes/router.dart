import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ulearning_app/features/sign_in/view/sign_in.dart';

import '../../splash.dart';

class Routers {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    final args = settings.arguments;

    switch (settings.name) {
      case SignIn.routeName:
        return MaterialPageRoute(builder: (_) => const SignIn());

      case SplashScreens.routeName:
        return MaterialPageRoute(builder: (_) => const SplashScreens());

      default:
        return MaterialPageRoute(
            builder: (_) => Scaffold(
                  body: Center(
                      child: Text('No route defined for ${settings.name}')),
                ));
    }
  }
}

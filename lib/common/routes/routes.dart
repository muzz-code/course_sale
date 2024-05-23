import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:ulearning_app/common/routes/app_route_names.dart';
import 'package:ulearning_app/global/global.dart';
import 'package:ulearning_app/pages/sign_in/sign_in.dart';
import 'package:ulearning_app/pages/sign_up/sign_up.dart';
import 'package:ulearning_app/pages/welcome/welcome.dart';

import '../../pages/application/application.dart';

class AppPage {
  static List<dynamic> routes() {
    return [
      RouteEntity(path: AppRouteNames.WELCOME, page: Welcome()),
      RouteEntity(path: AppRouteNames.SIGN_IN, page: const SignIn()),
      RouteEntity(path: AppRouteNames.REGISTER, page: const SignUp()),
      RouteEntity(path: AppRouteNames.APPLICATION, page: const Application()),
    ];
  }

  static MaterialPageRoute generateRouteSettings(RouteSettings settings) {
    if (kDebugMode) {
      print('clicked route is ${settings.name}');
    }
    if (settings.name != null) {
      var result = routes().where((element) => element.path == settings.name);

      if (result.isNotEmpty) {
        bool? deviceFirstOpen = Global.storageService.getDeviceFirstOpen();

        if (deviceFirstOpen != null) {
          if (result.first.path == AppRouteNames.WELCOME && deviceFirstOpen) {
            print('on welcome screen');
            bool isLoggedIn = Global.storageService.isLoggedIn();
            if (isLoggedIn) {
              return MaterialPageRoute(
                builder: (_) => const Application(),
                settings: settings,
              );
            } else {
              return MaterialPageRoute(
                builder: (_) => const SignIn(),
                settings: settings,
              );
            }
          } else {
            if (kDebugMode) {
              print('app ran first time');
            }
            return MaterialPageRoute(
              builder: (_) => result.first.page,
              settings: settings,
            );
          }
        }
      }
    }
    return MaterialPageRoute(
      builder: (_) => Welcome(),
      settings: settings,
    );
  }
}

class RouteEntity {
  String path;
  Widget page;

  RouteEntity({required this.path, required this.page});
}

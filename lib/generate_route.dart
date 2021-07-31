import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_project_structure/views/home/home_screen.dart';
import 'package:flutter_project_structure/views/splash/splash_screen.dart';
import 'package:logger/logger.dart';

class GenerateRoute {
  CupertinoPageRoute checkRoute(RouteSettings setting) {
    Logger().d(setting.name.toString(), "Route");
    switch (setting.name) {
      case '/home':
        return _pageRoute(setting, HomeScreen());
      // return _pageRoute(setting, HomeScreen(arg: setting.arguments as ArgHome));
      //-- default
      default:
        return _pageRoute(RouteSettings(name: "/splash"), SplashScreen());
    }
  }

  CupertinoPageRoute _pageRoute(RouteSettings setting, Widget page) {
    return CupertinoPageRoute(
      builder: (context) => page,
      settings: setting,
    );
  }
}

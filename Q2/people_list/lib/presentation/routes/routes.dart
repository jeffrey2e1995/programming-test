// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:people_list/presentation/pages/home/home.dart';
import 'package:people_list/presentation/pages/splash/splash.dart';

typedef GoWidgetBuilder = Widget Function(
    BuildContext context, GoRouterState state);

final navigatorKey = GlobalKey<NavigatorState>();

class Routes {
  Routes._();

  //static variables
  static const String splash = '/';
  static const String home = '/home';

  static final routes = <String, GoWidgetBuilder>{
    splash: (BuildContext context, GoRouterState state) => SplashScreen(),
    home: (BuildContext context, GoRouterState state) => HomeScreen(),
  };
}

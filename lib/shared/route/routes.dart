import 'package:clone_mtix/module/dashboard/controller/dashboard_controller.dart';
import 'package:clone_mtix/module/dashboard/view/dashboard_screen.dart';
import 'package:clone_mtix/module/playing/view/playing_screen.dart';
import 'package:clone_mtix/module/splash/view/splash_screen.dart';
import 'package:flutter/material.dart';

class AppRoutes {
  static const String splashScreen = '/splash';
  static const String dashboardScreen = '/dashboard';
  static const String playingScreen = '/playing';

  Map<String, WidgetBuilder> getRoutes = {
    splashScreen: (_) => SplashScreen(),
    dashboardScreen: (_) => DashboardScreen(),
  };
}

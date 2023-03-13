import 'package:clone_mtix/module/dashboard/view/dashboard_screen.dart';
import 'package:clone_mtix/module/splash/view/splash_screen.dart';
import 'package:flutter/material.dart';

class AppRoutes {
  static const String splashScreen = '/splash';
  static const String dashboardScreen = '/dashboard';

  Map<String, WidgetBuilder> getRoutes = {
    splashScreen: (_) => SplashScreen(),
    dashboardScreen: (_) => DashboardScreen(),
  };
}

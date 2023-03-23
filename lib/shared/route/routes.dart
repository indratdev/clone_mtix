import 'package:clone_mtix/module/dashboard/view/dashboard_screen.dart';
import 'package:clone_mtix/module/playing/view/detail_playing_screen.dart';
import 'package:clone_mtix/module/playing/view/playing_screen.dart';
import 'package:clone_mtix/module/splash/view/splash_screen.dart';
import 'package:clone_mtix/module/theater/view/theater_screen.dart';
import 'package:clone_mtix/module/theaterLocation/view/theater_location_screen.dart';
import 'package:flutter/material.dart';

class AppRoutes {
  static const String splashScreen = '/splash';
  static const String dashboardScreen = '/dashboard';
  static const String playingScreen = '/playing';
  static const String detailPlayingScreen = '/playing/detail';
  static const String theaterScreen = '/theater';
  static const String theaterLocationScreen = '/theater/location';

  Map<String, WidgetBuilder> getRoutes = {
    splashScreen: (_) => SplashScreen(),
    dashboardScreen: (_) => DashboardScreen(),
    playingScreen: (_) => PlayingScreen(),
    detailPlayingScreen: (_) => DetailPlayingScreen(),
    theaterScreen: (_) => TheaterScreen(),
    theaterLocationScreen: (_) => TheaterLocationScreen(),
  };
}

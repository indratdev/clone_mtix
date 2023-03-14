import 'package:clone_mtix/shared/route/routes.dart';
import 'package:clone_mtix/shared/utils/colors/colors_app.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: AppRoutes().getRoutes,
      initialRoute: AppRoutes.splashScreen,
      theme: ThemeData(
          primaryColor: ColorsApp.greenApp,
          appBarTheme: AppBarTheme(
            color: ColorsApp.greenApp,
          )),
    );
  }
}

import 'package:clone_mtix/shared/utils/colors/colors_app.dart';
import 'package:flutter/material.dart';

class TextStyleApp {
  static const TextStyle textDefaultOrange = TextStyle(
    color: ColorsApp.orangeText,
    fontSize: 16,
    fontWeight: FontWeight.bold,
  );

  static const TextStyle titleText = TextStyle(
    color: Colors.black,
    fontSize: 18,
    fontWeight: FontWeight.w500,
  );

  static const TextStyle titleTextGreen = TextStyle(
    color: ColorsApp.greenApp,
    fontSize: 18,
    fontWeight: FontWeight.w500,
  );

  static const TextStyle infoWarningText = TextStyle(
    color: Colors.red,
    fontSize: 12,
  );
}

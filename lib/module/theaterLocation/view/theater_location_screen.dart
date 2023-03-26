import 'package:clone_mtix/module/theaterLocation/view/body_location_theater_screen.dart';
import 'package:clone_mtix/shared/utils/colors/colors_app.dart';
import 'package:flutter/material.dart';

import '../../../shared/utils/constants/constants.dart';

class TheaterLocationScreen extends StatefulWidget {
  bool isMfood;
  bool isPlaying;

  TheaterLocationScreen({
    Key? key,
    this.isMfood = false,
    this.isPlaying = false,
  }) : super(key: key);

  @override
  State<TheaterLocationScreen> createState() => _TheaterLocationScreenState();
}

class _TheaterLocationScreenState extends State<TheaterLocationScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorsApp.backgroundDashboardColor,
      appBar: AppBar(
        title: Image.asset(
          xxiLogo,
          fit: BoxFit.cover,
          height: MediaQuery.of(context).size.height / 7,
        ),
        centerTitle: true,
      ),
      body: BodyLocationTheater(
        isMfood: widget.isMfood,
        isPlaying: widget.isPlaying,
      ),
    );
  }
}

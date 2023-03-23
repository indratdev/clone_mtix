import 'package:clone_mtix/module/theaterLocation/view/body_location_theater_screen.dart';
import 'package:clone_mtix/shared/utils/colors/colors_app.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../shared/utils/constants/constants.dart';
import '../../theater/bloc/theater_bloc.dart';

class TheaterLocationScreen extends StatefulWidget {
  const TheaterLocationScreen({Key? key}) : super(key: key);

  @override
  State<TheaterLocationScreen> createState() => _TheaterLocationScreenState();
}

class _TheaterLocationScreenState extends State<TheaterLocationScreen> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: TheaterBloc()..add(getLocationCinemaEvent()),
      child: Scaffold(
        backgroundColor: ColorsApp.backgroundDashboardColor,
        appBar: AppBar(
          title: Image.asset(
            xxiLogo,
            fit: BoxFit.cover,
            height: MediaQuery.of(context).size.height / 7,
          ),
          centerTitle: true,
        ),
        body: BodyLocationTheater(),
      ),
    );
  }
}

import 'package:clone_mtix/module/mfood/bloc/mfood_bloc.dart';
import 'package:clone_mtix/module/playing/bloc/playing_bloc.dart';
import 'package:clone_mtix/module/upcoming/bloc/upcoming_bloc.dart';
import 'package:clone_mtix/shared/route/routes.dart';
import 'package:clone_mtix/shared/utils/colors/colors_app.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'module/theater/bloc/theater_bloc.dart';
import 'module/theater/controller/theater_controller.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => PlayingBloc()
            ..add(
              GetNowPlayingEvent(),
            ),
        ),
        BlocProvider(
          create: (context) => UpcomingBloc()..add(GetListUpcomingMovie()),
        ),
        BlocProvider(
          create: (context) => TheaterBloc()
            ..add(
              GetTheaterEvent(
                  isSearch: false,
                  location: "jakarta",
                  theaterOption: TheaterOption.cinemaxxi),
            ),
        ),
        BlocProvider(
            create: (context) => MfoodBloc()
              ..add(
                GetTheaterFoodEvent(
                  location: "jakarta",
                  isSearch: false,
                ),
              )),
        // BlocProvider(
        //   create: (context) => TheaterBloc()..add(getLocationCinemaEvent()),
        // ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        routes: AppRoutes().getRoutes,
        initialRoute: AppRoutes.splashScreen,
        theme: ThemeData(
            primaryColor: ColorsApp.greenApp,
            appBarTheme: AppBarTheme(
              color: ColorsApp.greenApp,
            )),
      ),
    );
  }
}

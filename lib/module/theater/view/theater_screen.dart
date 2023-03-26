import 'package:clone_mtix/module/theater/bloc/theater_bloc.dart';
import 'package:clone_mtix/module/theater/controller/theater_controller.dart';
import 'package:clone_mtix/module/theater/view/export.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../model/theater_model.dart';

class TheaterScreen extends StatefulWidget {
  const TheaterScreen({super.key});

  @override
  State<TheaterScreen> createState() => _TheaterScreenState();
}

class _TheaterScreenState extends State<TheaterScreen> {
  TheaterOption selectedOption = TheaterOption.cinemaxxi;
  TheaterController controller = TheaterController();
  String locationCinema = "jakarta";

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<TheaterBloc, TheaterState>(
      listener: (context, state) {},
      builder: (context, state) {
        // print(">>> state : $state");
        if (state is SuccessSelectedTheaterLocation) {
          print("selected :: ${state.selectedLocation}");
          List<TheaterModel> listTheaters = state.listData;
          locationCinema = state.selectedLocation;

          return TheaterBodyWidget(
            locationCinema: locationCinema,
            listTheaters: listTheaters,
          );
        }

        if (state is LoadingTheater || state is LoadingTheaterLocation) {
          return const Center(child: CircularProgressIndicator.adaptive());
        }

        if (state is SuccessTheaterCinema) {
          List<TheaterModel> listTheaters = state.theaterModel;
          locationCinema = state.location;
          selectedOption = state.theaterOption;

          return TheaterBodyWidget(
            locationCinema: locationCinema,
            listTheaters: listTheaters,
            selectedOption: selectedOption,
          );
        }
        return Container();
      },
    );
  }
}

Widget buildSegment(String text) {
  return Container(
    child: Text(
      text,
      style: TextStyle(fontSize: 22, color: Colors.black),
    ),
  );
}

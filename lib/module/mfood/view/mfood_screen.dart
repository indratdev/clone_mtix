import 'package:clone_mtix/module/mfood/bloc/mfood_bloc.dart';
import 'package:clone_mtix/module/mfood/view/mfood_body_widget.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../theater/model/theater_model.dart';

class MfoodScreen extends StatefulWidget {
  const MfoodScreen({super.key});

  @override
  State<MfoodScreen> createState() => _MfoodScreenState();
}

class _MfoodScreenState extends State<MfoodScreen> {
  String locationCinema = "JAKARTA";
  List<TheaterModel>? listTheaters;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<MfoodBloc, MfoodState>(
        builder: (context, state) {
          if (state is LoadingMfoodLocation) {
            return const Center(child: CircularProgressIndicator.adaptive());
          }

          if (state is SuccessSelectedTheaterLocationMfood) {
            List<TheaterModel> listTheaters = state.listData;
            locationCinema = state.selectedLocation;

            return MfoodBodyWidget(
              locationCinema: locationCinema,
              listTheaters: listTheaters,
            );
          }
          if (state is SuccessMfoodLocation) {
            locationCinema = state.location;
            listTheaters = state.theaterModel;

            return MfoodBodyWidget(
              locationCinema: locationCinema,
              listTheaters: listTheaters,
            );
          } else {
            return Container();
          }
        },
      ),
    );
  }
}

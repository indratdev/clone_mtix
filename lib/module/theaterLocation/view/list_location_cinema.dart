import 'package:clone_mtix/module/mfood/bloc/mfood_bloc.dart';
import 'package:clone_mtix/module/playing/bloc/playing_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../theater/bloc/theater_bloc.dart';

class ListLocationCinema extends StatelessWidget {
  bool isMfood;
  bool isPlaying;

  ListLocationCinema({
    Key? key,
    required this.masterLocation,
    this.isMfood = false,
    this.isPlaying = false,
  }) : super(key: key);

  final List<String> masterLocation;

  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: Container(
      color: Colors.white,
      child: ListView.separated(
        separatorBuilder: (context, index) => const Divider(),
        shrinkWrap: true,
        itemCount: masterLocation.length,
        itemBuilder: (context, index) {
          var data = masterLocation[index];
          return InkWell(
            onTap: () {
              if (isPlaying) {
                BlocProvider.of<PlayingBloc>(context)
                  ..add(GetNowPlayingEvent())
                  ..add(SelectedLocationPlayingEvent(locationCinema: data));
              }
              if (!isMfood) {
                BlocProvider.of<TheaterBloc>(context)
                    .add(SelectedLocationCinemaEvent(locationCinema: data));
              } else if (!isPlaying && isMfood) {
                BlocProvider.of<MfoodBloc>(context).add(
                    SelectedLocationCinemaMfoodEvent(locationCinema: data));
              }

              Navigator.pop(context);
            },
            child: ListTile(
              title: Text(data),
              trailing: const Icon(Icons.arrow_forward_ios_outlined),
            ),
          );
        },
      ),
    ));
  }
}

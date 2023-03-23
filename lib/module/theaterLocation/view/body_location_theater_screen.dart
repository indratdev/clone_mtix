import 'package:clone_mtix/module/theaterLocation/view/list_location_cinema.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../theater/bloc/theater_bloc.dart';

class BodyLocationTheater extends StatefulWidget {
  const BodyLocationTheater({
    Key? key,
  }) : super(key: key);

  @override
  State<BodyLocationTheater> createState() => _BodyLocationTheaterState();
}

class _BodyLocationTheaterState extends State<BodyLocationTheater> {
  List<String> masterLocation = [];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Container(
          color: Colors.white,
          margin: const EdgeInsets.all(8.0),
          child: TextField(
            onChanged: (value) {
              context.read<TheaterBloc>().add(SearchLocationCinemaEvent(
                    text: value,
                    masterData: masterLocation,
                  ));
            },
            decoration: const InputDecoration(
              hintText: "Type a city to search",
              contentPadding: EdgeInsets.symmetric(horizontal: 20),
              border: InputBorder.none,
            ),
          ),
        ),
        BlocBuilder<TheaterBloc, TheaterState>(
          builder: (context, state) {
            if (state is LoadingTheaterLocation) {
              return const Center(child: CircularProgressIndicator.adaptive());
            }

            if (state is LoadingListTheaterLocation) {
              return const Center(child: CircularProgressIndicator.adaptive());
            }

            if (state is SuccessTheaterLocation) {
              masterLocation = state.locationCinema;
              return ListLocationCinema(masterLocation: masterLocation);
            }

            if (state is SuccessListTheaterLocation) {
              var results = state.listLocationCinema;
              return ListLocationCinema(masterLocation: results);
            }

            return const Center(
              child: Text("No Data"),
            );
          },
        )
      ],
    );
  }
}

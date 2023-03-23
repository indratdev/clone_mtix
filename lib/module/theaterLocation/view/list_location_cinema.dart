import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../theater/bloc/theater_bloc.dart';

class ListLocationCinema extends StatelessWidget {
  const ListLocationCinema({
    Key? key,
    required this.masterLocation,
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
              context
                  .read<TheaterBloc>()
                  .add(SelectedLocationCinemaEvent(locationCinema: data));
              // BlocProvider.of<TheaterlocationBloc>(context)
              //     .add(SelectedLocationCinemaEvent(locationCinema: data));
              Navigator.pop(context);
              // Navigator.pushNamedAndRemoveUntil(
              //     context, AppRoutes.theaterScreen, (route) => false);
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

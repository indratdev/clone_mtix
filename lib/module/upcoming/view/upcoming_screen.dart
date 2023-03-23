import 'package:clone_mtix/module/upcoming/bloc/upcoming_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:clone_mtix/module/upcoming/view/export.dart';

import '../../../model/movie/movie_model.dart';

class UpcomingScreen extends StatefulWidget {
  const UpcomingScreen({super.key});

  @override
  State<UpcomingScreen> createState() => _UpcomingScreenState();
}

class _UpcomingScreenState extends State<UpcomingScreen> {
  // MovieModel? data;
  // MovieModel? filterData;
  // List<Results> masterData = [];

  @override
  Widget build(BuildContext context) {
    // final _upcomingBloc = context.read<UpcomingBloc>();

    return BlocProvider.value(
      value: UpcomingBloc()..add(GetListUpcomingMovie()),
      child: Scaffold(
        body: UpcomingBody(),
      ),
    );
    // MovieModel? filterData;
    // return Scaffold(
    //   body: BlocBuilder<UpcomingBloc, UpcomingState>(
    //     builder: (context, state) {
    //       if (state is FailureUpcomingMovie) {
    //         return Center(child: Text("Failure : ${state.info}"));
    //       }
    //       if (state is LoadingUpcomingMovie) {
    //         return SizedBox(child: CircularProgressIndicator.adaptive());
    //       }
    //       if (state is SuccessUpcomingMovie) {
    //         data = state.result;
    //         // filterData?.results.add(data.results.toList());
    //         filterData = data;

    //         return Column(
    //           children: <Widget>[
    //             TextField(
    //               controller: filterController,
    //               onChanged: (value) {
    //                 print(">>> data : ${data!.results}");
    //                 // MovieModel? result;
    //                 setState(() {
    //                   if (filterData!.results.isNotEmpty) {
    //                     filterData!.results = data!.results
    //                         .where((element) => element.title
    //                             .toLowerCase()
    //                             .contains(value.toLowerCase()))
    //                         .toList();
    //                   } else {
    //                     filterData = data;
    //                   }
    //                 });
    //               },
    //               decoration: const InputDecoration(
    //                   hintText: "Type a movie to search",
    //                   contentPadding: EdgeInsets.symmetric(horizontal: 20)),
    //             ),
    //             Expanded(child: ListMovieWidget(data: filterData!)),
    //           ],
    //         );
    //       } else {
    //         return Container();
    //       }
    //     },
    //   ),
    // );
  }
}

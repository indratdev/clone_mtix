import 'package:clone_mtix/module/upcoming/bloc/upcoming_bloc.dart';
import 'package:clone_mtix/shared/widget/export.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class UpcomingScreen extends StatelessWidget {
  const UpcomingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => UpcomingBloc()..add(GetListUpcomingMovie()),
      child: Scaffold(
        body: BlocBuilder<UpcomingBloc, UpcomingState>(
          builder: (context, state) {
            if (state is FailureUpcomingMovie) {
              return Center(child: Text("Failure : ${state.info}"));
            }
            if (state is LoadingUpcomingMovie) {
              return SizedBox(child: CircularProgressIndicator.adaptive());
            }
            if (state is SuccessUpcomingMovie) {
              var data = state.result;
              return Column(
                children: <Widget>[
                  TextField(
                    decoration: InputDecoration(
                        hintText: "Type a movie to search",
                        contentPadding: EdgeInsets.symmetric(horizontal: 20)),
                  ),
                  Expanded(child: ListMovieWidget(data: data)),
                ],
              );
            } else {
              return Container();
            }
          },
        ),
      ),
    );
  }
}

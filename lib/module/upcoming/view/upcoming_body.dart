import 'package:clone_mtix/module/upcoming/bloc/upcoming_bloc.dart';
import 'package:clone_mtix/shared/widget/list_movie/list_upcoming_movie_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../model/movie/movie_model.dart';

class UpcomingBody extends StatefulWidget {
  const UpcomingBody({
    Key? key,
  }) : super(key: key);

  @override
  State<UpcomingBody> createState() => _UpcomingBodyState();
}

class _UpcomingBodyState extends State<UpcomingBody> {
  List<Results> masterData = [];

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final _upcomingBloc = BlocProvider.of<UpcomingBloc>(context);

    return Column(
      children: <Widget>[
        TextField(
          onChanged: (value) {
            context.read<UpcomingBloc>().add(SearchListUpcomingMovieEvent(
                  text: value,
                  masterData: masterData,
                ));
          },
          decoration: const InputDecoration(
              hintText: "Type a movie to search",
              contentPadding: EdgeInsets.symmetric(horizontal: 20)),
        ),
        BlocBuilder<UpcomingBloc, UpcomingState>(
          bloc: _upcomingBloc,
          builder: (context, state) {
            if (state is FailureUpcomingMovie) {
              return Center(child: Text("Failure : ${state.info}"));
            }
            if (state is LoadingUpcomingMovie) {
              return const SizedBox(
                  child: CircularProgressIndicator.adaptive());
            }
            if (state is SuccessUpcomingMovie) {
              masterData = state.result.results;
              var results = state.result.results;
              return ListUpcomingMovieWidget(
                data: results,
                isUpcoming: true,
              );
            }
            if (state is SuccessSearchUpcomingMovie) {
              var results = state.result;
              return ListUpcomingMovieWidget(
                data: results,
                isUpcoming: true,
              );
            }

            return Container();
          },
        ),
      ],
    );
  }
}

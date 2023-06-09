import 'dart:developer';

import 'package:clone_mtix/module/upcoming/controller/upcoming_controller.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../model/movie/movie_model.dart';

part 'upcoming_event.dart';
part 'upcoming_state.dart';

class UpcomingBloc extends Bloc<UpcomingEvent, UpcomingState> {
  final UpcomingController controller = UpcomingController();

  UpcomingBloc() : super(UpcomingInitial()) {
    on<GetListUpcomingMovie>((event, emit) async {
      emit(LoadingUpcomingMovie());
      try {
        var result = await controller.upcomoingMovie();
        emit(SuccessUpcomingMovie(result: result!));
      } catch (e) {
        print("Error : $e");
        emit(FailureUpcomingMovie(info: e.toString()));
      }
    });

    on<SearchListUpcomingMovieEvent>((event, emit) {
      emit(LoadingSearchUpcomingMovie());
      try {
        List<Results> filterUser = [];
        var text = event.text;
        var master = event.masterData;

        if (text.isNotEmpty) {
          filterUser = master
              .where((element) =>
                  element.title.toLowerCase().contains(text.toLowerCase()))
              .toList();
        } else {
          filterUser = master;
        }

        emit(SuccessSearchUpcomingMovie(result: filterUser));
      } catch (e) {
        log(e.toString());
        emit(FailureSearchUpcomingMovie(info: e.toString()));
      }
    });
  }
}

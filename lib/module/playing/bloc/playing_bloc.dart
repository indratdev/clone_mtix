import 'dart:developer';

import 'package:clone_mtix/model/movie/movie_model.dart';
import 'package:clone_mtix/model/movie_credits/movie_credits_model.dart';
import 'package:clone_mtix/model/movie_detail/movie_detail_model.dart';
import 'package:clone_mtix/module/playing/controller/playing_controller.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../theater/controller/theater_controller.dart';
import '../../theater/model/theater_model.dart';

part 'playing_event.dart';
part 'playing_state.dart';

class PlayingBloc extends Bloc<PlayingEvent, PlayingState> {
  PlayingBloc() : super(PlayingInitial()) {
    final PlayingController controller = PlayingController();
    final TheaterController theaterController = TheaterController();

    on<GetNowPlayingEvent>((event, emit) async {
      emit(LoadingNowPlaying());
      try {
        var result = await controller.nowPlayingMovie();

        emit(SuccessNowPlaying(result: result!));
      } catch (e) {
        emit(FailureNowPlaying(info: e.toString()));
      }
    });

    on<GetDetailNowPlayingEvent>((event, emit) async {
      emit(LoadingDetailNowPlayingMovie());
      try {
        // credit
        MovieCreditsModel? creditsResult =
            await controller.creditMovie(event.idMovie);

        // detail movie
        MovieDetailModel? detailResult =
            await controller.movieDetail(event.idMovie);

        emit(SuccessDetailNowPlayingMovie(
            creditsResult: creditsResult!, detailResult: detailResult!));
      } catch (e) {
        emit(FailureDetailNowPlayingMovie(info: e.toString()));
      }
    });

    // location cinema

    on<SelectedLocationPlayingEvent>((event, emit) {
      try {
        String location = event.locationCinema;
        TheaterOption theaterOption = TheaterOption.cinemaxxi;
        List<TheaterModel> listData = [];
        listData = theaterController.getTheaterByCinemaAndLocation(
            theaterOption, location);
        emit(SuccessSelectedTheaterLocationPlaying(
          selectedLocation: event.locationCinema,
          listData: listData,
        ));
      } catch (e) {
        log(e.toString());
      }
    });
  }
}

import 'dart:developer';

import 'package:clone_mtix/module/theater/controller/theater_controller.dart';
import 'package:clone_mtix/module/theater/model/theater_model.dart';
import 'package:clone_mtix/module/theaterLocation/controller/theater_location_controller.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../model/movie/movie_model.dart';
import '../../playing/controller/playing_controller.dart';

part 'theater_event.dart';
part 'theater_state.dart';

class TheaterBloc extends Bloc<TheaterEvent, TheaterState> {
  final TheaterController controller = TheaterController();
  final TheaterLocationController controllerLocation =
      TheaterLocationController();
  final PlayingController controllerPlaying = PlayingController();

  TheaterBloc() : super(TheaterInitial()) {
    on<GetTheaterEvent>((event, emit) {
      emit(LoadingTheater());
      try {
        String location = event.location;
        TheaterOption theaterOption = event.theaterOption;

        List<TheaterModel> listData = [];

        // listData = controller.getTheaterByCinema(theaterOption);
        listData =
            controller.getTheaterByCinemaAndLocation(theaterOption, location);

        emit(SuccessTheaterCinema(
          location: location,
          theaterModel: listData,
          theaterOption: theaterOption,
        ));
        // (!event.isSearch)
        //     ? emit(SuccessTheaterCinema(
        //         location: location, theaterModel: listData))
        //     : emit(SuccessSelectedTheaterLocation(
        //         selectedLocation: location,
        //         listData: listData,
        //       ));
      } catch (e) {
        log(e.toString());
        emit(FailureTheaterCinema(info: e.toString()));
      }
    });

    // location cinema
    on<getLocationCinemaEvent>((event, emit) {
      emit(LoadingTheaterLocation());
      try {
        List<String> listLocation = controllerLocation.getAllLocationTheater();
        emit(SuccessTheaterLocation(locationCinema: listLocation));
      } catch (e) {
        log(e.toString());
        emit(FailureTheaterLocation(info: e.toString()));
      }
    });

    on<SearchLocationCinemaEvent>((event, emit) {
      emit(LoadingListTheaterLocation());
      try {
        List<String> filterLocation = [];
        var text = event.text;
        var master = event.masterData;

        if (text.isNotEmpty) {
          filterLocation = master
              .where((element) =>
                  element.toLowerCase().contains(text.toLowerCase()))
              .toList();
        } else {
          filterLocation = master;
        }
        emit(SuccessListTheaterLocation(listLocationCinema: filterLocation));
      } catch (e) {
        log(e.toString());
        emit(FailureListTheaterLocation(info: e.toString()));
      }
    });

    on<SelectedLocationCinemaEvent>((event, emit) {
      print("bloc jalan");
      try {
        String location = event.locationCinema;
        TheaterOption theaterOption = TheaterOption.cinemaxxi;
        List<TheaterModel> listData = [];
        listData =
            controller.getTheaterByCinemaAndLocation(theaterOption, location);
        emit(SuccessSelectedTheaterLocation(
          selectedLocation: event.locationCinema,
          listData: listData,
        ));
      } catch (e) {
        log(e.toString());
      }
    });

    on<NowPlayingOnCinemaEvent>((event, emit) async {
      emit(LoadingNowPlayingOnCinema());
      try {
        var result = await controllerPlaying.nowPlayingMovie();

        emit(SuccessNowPlayingOnCinema(result: result!));
      } catch (e) {
        emit(FailureNowPlayingOnCinema(info: e.toString()));
      }
    });
  }
}

import 'dart:developer';

import 'package:clone_mtix/module/mfood/controller/mfood_controller.dart';
import 'package:clone_mtix/module/theater/controller/theater_controller.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';

import '../../theater/model/theater_model.dart';

part 'mfood_event.dart';
part 'mfood_state.dart';

class MfoodBloc extends Bloc<MfoodEvent, MfoodState> {
  final MfoodController controller = MfoodController();

  MfoodBloc() : super(MfoodInitial()) {
    on<GetTheaterFoodEvent>((event, emit) {
      emit(LoadingMfoodLocation());
      try {
        String location = event.location.toUpperCase();

        List<TheaterModel> listData = [];

        // listData = controller.getTheaterByLocation(location);
        listData = controller.getTheaterByCinemaAndLocation(
            TheaterOption.cinemaxxi, location);

        emit(SuccessMfoodLocation(
          location: location,
          theaterModel: listData,
        ));
      } catch (e) {
        log(e.toString());
        emit(FailureMfoodLocation(info: e.toString()));
      }
    });

    on<SelectedLocationCinemaMfoodEvent>((event, emit) {
      try {
        String location = event.locationCinema;
        TheaterOption theaterOption = TheaterOption.cinemaxxi;
        List<TheaterModel> listData = [];
        listData =
            controller.getTheaterByCinemaAndLocation(theaterOption, location);
        emit(SuccessSelectedTheaterLocationMfood(
          selectedLocation: event.locationCinema,
          listData: listData,
        ));
      } catch (e) {
        log(e.toString());
      }
    });

    on<SelectedGroupFoodEvent>((event, emit) {
      emit(LoadingSelectGroupFood());
      try {
        ListGroupFood groupFood = event.listGroupFood;
        List<Map<int, dynamic>> listFood = [];

        listFood = controller.selectedGroupFood(groupFood);

        emit(SuccessSelectGroupFood(listFood: listFood, groupFood: groupFood));
      } catch (e) {
        log(e.toString());
        emit(FailureSelectGroupFood(info: e.toString()));
      }
    });

    //   // location cinema
    //   on<getLocationCinemaEvent>((event, emit) {
    //     emit(LoadingTheaterLocation());
    //     try {
    //       List<String> listLocation = controllerLocation.getAllLocationTheater();
    //       emit(SuccessTheaterLocation(locationCinema: listLocation));
    //     } catch (e) {
    //       log(e.toString());
    //       emit(FailureTheaterLocation(info: e.toString()));
    //     }
    //   });

    //   on<SearchLocationCinemaEvent>((event, emit) {
    //     emit(LoadingListTheaterLocation());
    //     try {
    //       List<String> filterLocation = [];
    //       var text = event.text;
    //       var master = event.masterData;

    //       if (text.isNotEmpty) {
    //         filterLocation = master
    //             .where((element) =>
    //                 element.toLowerCase().contains(text.toLowerCase()))
    //             .toList();
    //       } else {
    //         filterLocation = master;
    //       }
    //       emit(SuccessListTheaterLocation(listLocationCinema: filterLocation));
    //     } catch (e) {
    //       log(e.toString());
    //       emit(FailureListTheaterLocation(info: e.toString()));
    //     }
    //   });

    //   on<SelectedLocationCinemaEvent>((event, emit) {
    //     print("bloc jalan");
    //     try {
    //       String location = event.locationCinema;
    //       TheaterOption theaterOption = TheaterOption.cinemaxxi;
    //       List<TheaterModel> listData = [];
    //       listData =
    //           controller.getTheaterByCinemaAndLocation(theaterOption, location);
    //       emit(SuccessSelectedTheaterLocation(
    //         selectedLocation: event.locationCinema,
    //         listData: listData,
    //       ));
    //     } catch (e) {
    //       log(e.toString());
    //     }
    //   });
  }
}

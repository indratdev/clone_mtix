import 'dart:developer';

import 'package:clone_mtix/module/theaterLocation/controller/theater_location_controller.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'theaterlocation_event.dart';
part 'theaterlocation_state.dart';

class TheaterlocationBloc
    extends Bloc<TheaterlocationEvent, TheaterlocationState> {
  final TheaterLocationController controller = TheaterLocationController();

  TheaterlocationBloc() : super(TheaterlocationInitial()) {
    // on<getLocationCinemaEvent>((event, emit) {
    //   emit(LoadingTheaterLocation());
    //   try {
    //     List<String> listLocation = controller.getAllLocationTheater();
    //     emit(SuccessTheaterLocation(locationCinema: listLocation));
    //   } catch (e) {
    //     log(e.toString());
    //     emit(FailureTheaterLocation(info: e.toString()));
    //   }
    // });

    // on<SearchLocationCinemaEvent>((event, emit) {
    //   emit(LoadingListTheaterLocation());
    //   try {
    //     List<String> filterLocation = [];
    //     var text = event.text;
    //     var master = event.masterData;

    //     if (text.isNotEmpty) {
    //       filterLocation = master
    //           .where((element) =>
    //               element.toLowerCase().contains(text.toLowerCase()))
    //           .toList();
    //     } else {
    //       filterLocation = master;
    //     }
    //     emit(SuccessListTheaterLocation(listLocationCinema: filterLocation));
    //   } catch (e) {
    //     log(e.toString());
    //     emit(FailureListTheaterLocation(info: e.toString()));
    //   }
    // });

    // on<SelectedLocationCinemaEvent>((event, emit) {
    //   print("bloc jalan");
    //   emit(SuccessSelectedTheaterLocation(
    //       selectedLocation: event.locationCinema));
    // });
  }
}

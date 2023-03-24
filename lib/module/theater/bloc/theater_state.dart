part of 'theater_bloc.dart';

abstract class TheaterState extends Equatable {
  const TheaterState();

  @override
  List<Object> get props => [];
}

class TheaterInitial extends TheaterState {}

class FailureTheater extends TheaterState {
  String info;

  FailureTheater({
    required this.info,
  });

  @override
  List<Object> get props => [info];
}

class LoadingTheater extends TheaterState {}

class FailureTheaterCinema extends FailureTheater {
  FailureTheaterCinema({required super.info});
}

class SuccessTheaterCinema extends TheaterState {
  List<TheaterModel> theaterModel;
  String location;
  TheaterOption theaterOption;

  SuccessTheaterCinema({
    required this.location,
    required this.theaterModel,
    required this.theaterOption,
  });

  List<Object> get props => [location, theaterModel];
}

// location cinema

// class FailureTheater extends TheaterState {
//   String info;

//   FailureTheater({
//     required this.info,
//   });

//   @override
//   List<Object> get props => [info];
// }

// theater location
class LoadingTheaterLocation extends TheaterState {}

class FailureTheaterLocation extends FailureTheater {
  FailureTheaterLocation({required super.info});
}

class SuccessTheaterLocation extends TheaterState {
  List<String> locationCinema;

  SuccessTheaterLocation({
    required this.locationCinema,
  });

  List<Object> get props => [locationCinema];
}
// theater location end

// theater list location cinema
class LoadingListTheaterLocation extends TheaterState {}

class FailureListTheaterLocation extends FailureTheater {
  FailureListTheaterLocation({required super.info});
}

class SuccessListTheaterLocation extends TheaterState {
  List<String> listLocationCinema;

  SuccessListTheaterLocation({
    required this.listLocationCinema,
  });

  List<Object> get props => [listLocationCinema];
}
// theater list location cinema end

// selected location cinema
class SuccessSelectedTheaterLocation extends TheaterState {
  String selectedLocation;
  List<TheaterModel> listData;

  SuccessSelectedTheaterLocation({
    required this.selectedLocation,
    required this.listData,
  });

  List<Object> get props => [selectedLocation, listData];
}
// selected location cinema end
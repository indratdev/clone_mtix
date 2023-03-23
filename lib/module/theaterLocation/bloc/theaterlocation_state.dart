part of 'theaterlocation_bloc.dart';

abstract class TheaterlocationState extends Equatable {
  const TheaterlocationState();

  @override
  List<Object> get props => [];
}

class TheaterlocationInitial extends TheaterlocationState {}

// class FailureTheater extends TheaterlocationState {
//   String info;

//   FailureTheater({
//     required this.info,
//   });

//   @override
//   List<Object> get props => [info];
// }

// // theater location
// class LoadingTheaterLocation extends TheaterlocationState {}

// class FailureTheaterLocation extends FailureTheater {
//   FailureTheaterLocation({required super.info});
// }

// class SuccessTheaterLocation extends TheaterlocationState {
//   List<String> locationCinema;

//   SuccessTheaterLocation({
//     required this.locationCinema,
//   });

//   List<Object> get props => [locationCinema];
// }
// // theater location end

// // theater list location cinema
// class LoadingListTheaterLocation extends TheaterlocationState {}

// class FailureListTheaterLocation extends FailureTheater {
//   FailureListTheaterLocation({required super.info});
// }

// class SuccessListTheaterLocation extends TheaterlocationState {
//   List<String> listLocationCinema;

//   SuccessListTheaterLocation({
//     required this.listLocationCinema,
//   });

//   List<Object> get props => [listLocationCinema];
// }
// // theater list location cinema end

// // selected location cinema
// class SuccessSelectedTheaterLocation extends TheaterlocationState {
//   String selectedLocation;

//   SuccessSelectedTheaterLocation({
//     required this.selectedLocation,
//   });

//   List<Object> get props => [selectedLocation];
// }
// // selected location cinema end
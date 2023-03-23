part of 'theaterlocation_bloc.dart';

abstract class TheaterlocationEvent extends Equatable {
  const TheaterlocationEvent();

  @override
  List<Object> get props => [];
}

// class getLocationCinemaEvent extends TheaterlocationEvent {}

// class SearchLocationCinemaEvent extends TheaterlocationEvent {
//   String text;
//   List<String> masterData;

//   SearchLocationCinemaEvent({
//     required this.text,
//     required this.masterData,
//   });
// }

// class SelectedLocationCinemaEvent extends TheaterlocationEvent {
//   String locationCinema;

//   SelectedLocationCinemaEvent({
//     required this.locationCinema,
//   });
// }

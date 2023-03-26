part of 'mfood_bloc.dart';

abstract class MfoodEvent extends Equatable {
  const MfoodEvent();

  @override
  List<Object> get props => [];
}

class GetTheaterFoodEvent extends MfoodEvent {
  String location;
  // TheaterOption theaterOption;
  bool isSearch;

  GetTheaterFoodEvent({
    required this.location,
    // required this.theaterOption,
    required this.isSearch,
  });
}

// class getLocationCinemaEvent extends MfoodEvent {}

// class SearchLocationCinemaEvent extends MfoodEvent {
//   String text;
//   List<String> masterData;

//   SearchLocationCinemaEvent({
//     required this.text,
//     required this.masterData,
//   });
// }

class SelectedLocationCinemaMfoodEvent extends MfoodEvent {
  String locationCinema;

  SelectedLocationCinemaMfoodEvent({
    required this.locationCinema,
  });
}

class SelectedGroupFoodEvent extends MfoodEvent {
  ListGroupFood listGroupFood;

  SelectedGroupFoodEvent({
    required this.listGroupFood,
  });
}

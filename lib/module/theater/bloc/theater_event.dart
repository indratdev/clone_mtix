part of 'theater_bloc.dart';

abstract class TheaterEvent extends Equatable {
  const TheaterEvent();

  @override
  List<Object> get props => [];
}

class GetTheaterEvent extends TheaterEvent {
  String location;
  TheaterOption theaterOption;
  bool isSearch;

  GetTheaterEvent({
    required this.location,
    required this.theaterOption,
    required this.isSearch,
  });
}

class getLocationCinemaEvent extends TheaterEvent {}

class SearchLocationCinemaEvent extends TheaterEvent {
  String text;
  List<String> masterData;

  SearchLocationCinemaEvent({
    required this.text,
    required this.masterData,
  });
}

class SelectedLocationCinemaEvent extends TheaterEvent {
  String locationCinema;

  SelectedLocationCinemaEvent({
    required this.locationCinema,
  });
}

class NowPlayingOnCinemaEvent extends TheaterEvent {}

part of 'playing_bloc.dart';

abstract class PlayingEvent extends Equatable {
  const PlayingEvent();

  @override
  List<Object> get props => [];
}

class GetNowPlayingEvent extends PlayingEvent {}

class GetDetailNowPlayingEvent extends PlayingEvent {
  int idMovie;

  GetDetailNowPlayingEvent({
    required this.idMovie,
  });
}

class SelectedLocationPlayingEvent extends PlayingEvent {
  String locationCinema;

  SelectedLocationPlayingEvent({
    required this.locationCinema,
  });
}

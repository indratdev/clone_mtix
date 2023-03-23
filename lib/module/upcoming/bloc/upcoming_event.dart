part of 'upcoming_bloc.dart';

abstract class UpcomingEvent extends Equatable {
  const UpcomingEvent();

  @override
  List<Object> get props => [];
}

class GetListUpcomingMovie extends UpcomingEvent {}

class SearchListUpcomingMovieEvent extends UpcomingEvent {
  String text;
  List<Results> masterData;

  SearchListUpcomingMovieEvent({
    required this.text,
    required this.masterData,
  });
}

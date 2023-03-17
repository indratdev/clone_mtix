part of 'upcoming_bloc.dart';

abstract class UpcomingState extends Equatable {
  const UpcomingState();

  @override
  List<Object> get props => [];
}

class UpcomingInitial extends UpcomingState {}

class FailurePlaying extends UpcomingState {
  String info;

  FailurePlaying({
    required this.info,
  });

  @override
  List<Object> get props => [info];
}

// now playing

class FailureUpcomingMovie extends FailurePlaying {
  FailureUpcomingMovie({required super.info});
}

class LoadingUpcomingMovie extends UpcomingState {}

class SuccessUpcomingMovie extends UpcomingState {
  MovieModel result;

  SuccessUpcomingMovie({
    required this.result,
  });

  List<Object> get props => [result];
}

// now playing end
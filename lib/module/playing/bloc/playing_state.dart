part of 'playing_bloc.dart';

abstract class PlayingState extends Equatable {
  const PlayingState();

  @override
  List<Object> get props => [];
}

class PlayingInitial extends PlayingState {}

class FailurePlaying extends PlayingState {
  String info;

  FailurePlaying({
    required this.info,
  });

  @override
  List<Object> get props => [info];
}

// now playing

class FailureNowPlaying extends FailurePlaying {
  FailureNowPlaying({required super.info});
}

class LoadingNowPlaying extends PlayingState {}

class SuccessNowPlaying extends PlayingState {
  MovieModel result;

  SuccessNowPlaying({
    required this.result,
  });

  List<Object> get props => [result];
}

// now playing end

// credit movie
// class FailureCreditsMovie extends FailurePlaying {
//   FailureCreditsMovie({required super.info});
// }

// class LoadingCreditsMovie extends PlayingState {}

// class SuccessCreditsMovie extends PlayingState {
//   MovieCreditsModel result;

//   SuccessCreditsMovie({
//     required this.result,
//   });

//   List<Object> get props => [result];
// }

// credit movie end

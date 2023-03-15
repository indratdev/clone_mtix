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

// detail now playing movie
class FailureDetailNowPlayingMovie extends FailurePlaying {
  FailureDetailNowPlayingMovie({required super.info});
}

class LoadingDetailNowPlayingMovie extends PlayingState {}

class SuccessDetailNowPlayingMovie extends PlayingState {
  MovieCreditsModel creditsResult;
  MovieDetailModel detailResult;

  SuccessDetailNowPlayingMovie({
    required this.creditsResult,
    required this.detailResult,
  });

  List<Object> get props => [creditsResult, detailResult];
}

// credit movie end

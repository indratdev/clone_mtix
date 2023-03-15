import 'package:bloc/bloc.dart';
import 'package:clone_mtix/model/movie/movie_model.dart';
import 'package:clone_mtix/model/movie_credits/movie_credits_model.dart';
import 'package:clone_mtix/module/playing/controller/playing_controller.dart';
import 'package:equatable/equatable.dart';

part 'playing_event.dart';
part 'playing_state.dart';

class PlayingBloc extends Bloc<PlayingEvent, PlayingState> {
  PlayingBloc() : super(PlayingInitial()) {
    PlayingController controller = PlayingController();

    on<GetNowPlayingEvent>((event, emit) async {
      emit(LoadingNowPlaying());
      try {
        var result = await controller.nowPlayingMovie();
        emit(SuccessNowPlaying(result: result!));
      } catch (e) {
        emit(FailureNowPlaying(info: e.toString()));
      }
    });
  }
}

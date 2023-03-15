import 'package:clone_mtix/model/movie/movie_model.dart';
import 'package:clone_mtix/service/api_service.dart';

class PlayingController {
  final APIService serviceApi = APIService();

  Future<MovieModel?> nowPlayingMovie() async {
    return await serviceApi.getNowPlayingMovie();
  }
}

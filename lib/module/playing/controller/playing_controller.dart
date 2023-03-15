import 'package:clone_mtix/model/movie/movie_model.dart';
import 'package:clone_mtix/model/movie_credits/movie_credits_model.dart';
import 'package:clone_mtix/model/movie_detail/movie_detail_model.dart';
import 'package:clone_mtix/service/api_service.dart';

class PlayingController {
  final APIService serviceApi = APIService();

  Future<MovieModel?> nowPlayingMovie() async {
    return await serviceApi.getNowPlayingMovie();
  }

  Future<MovieCreditsModel?> creditMovie(int idMovie) async {
    return await serviceApi.getCreditMovie(idMovie);
  }

  Future<MovieDetailModel?> movieDetail(int idMovie) async {
    return await serviceApi.getDetailMovie(idMovie);
  }
}

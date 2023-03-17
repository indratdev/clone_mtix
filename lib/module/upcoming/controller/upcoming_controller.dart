import 'package:clone_mtix/model/movie/movie_model.dart';
import 'package:clone_mtix/service/api_service.dart';

class UpcomingController {
  final APIService serviceAPI = APIService();

  Future<MovieModel?> upcomoingMovie() async {
    return await serviceAPI.getMoviebyParam(TypeMovie.upcoming);
  }
}

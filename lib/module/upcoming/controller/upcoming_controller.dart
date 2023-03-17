import 'package:clone_mtix/model/movie/movie_model.dart';
import 'package:clone_mtix/service/api_service.dart';

class UpcomingController {
  final APIService serviceAPI = APIService();

  Future<MovieModel?> upcomoingMovie() async {
    return await serviceAPI.getMoviebyParam(TypeMovie.upcoming);
  }

  searchUpcomingMovie(MovieModel movieModel, String searchString) {
    MovieModel? value;

    movieModel.results.forEach((element) {
      if (element.title.toLowerCase().toString().contains("or")) {
        print(">>> ${element.title}");
        value?.results.add(element);
      }

      print(value);
    });
  }
}

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

  String convertGenreListToString(List<Genres> value) {
    List<String> result = [];
    value.forEach((value) {
      result.add(value.name);
    });
    return result.join(", ");
  }

  String findProducerName(List<Crew> crew) {
    String producerName = "";
    crew.forEach((element) {
      if (element.job.toLowerCase() == "producer") {
        producerName = element.name;
      }
    });

    return producerName;
  }

  String findCrewName(List<Crew> crew) {
    List<String> listName = [];
    crew.forEach((element) {
      if (element.job.toLowerCase().contains("writer")) {
        listName.add(element.name);
      }
    });

    return listName.first.toString();
  }

  String findAllCastName(List<Cast> cast) {
    List<String> listName = [];
    cast.forEach((element) {
      listName.add(element.name.toString());
    });

    return listName.join(", ");
  }

  String findProductionCompany(List<ProductionCompanies> company) {
    List<String> listName = [];
    company.forEach((element) {
      listName.add("${element.name}");
    });

    return listName.join(", ");
  }
}

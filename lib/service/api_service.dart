import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:clone_mtix/model/movie_credits/movie_credits_model.dart';

import '../model/movie/movie_model.dart';
import 'package:http/http.dart' as http;
import '../shared//utils/constants/constants.dart';

class APIService {
  final endPointUrl = "api.themoviedb.org";
  final nowPlayingUrl = "/3/movie/now_playing";
  final creditsUrl = "/3/movie/";

  var queryParameters = {
    'api_key': apiKey,
    'language': languageApi,
  };

  var headers = {
    HttpHeaders.contentTypeHeader: "application/json",
  };

  Future<MovieModel?> getNowPlayingMovie() async {
    MovieModel? result;
    try {
      var uri = Uri.https(endPointUrl, nowPlayingUrl, queryParameters);

      final response = await http.get(uri, headers: headers);

      // log(response.body);
      if (response.statusCode == 200) {
        final item = jsonDecode(response.body);
        result = MovieModel.fromJson(item);
      }
    } catch (e) {
      print("error : $e");
      throw Exception(e.toString());
    }

    return result;
  }

  // get credits movie
  // https://api.themoviedb.org/3/movie/315162/credits?api_key=257a08071c1baefe6dadf1d9957e0ef2

  Future<MovieCreditsModel?> getCreditMovie(int idMovie) async {
    MovieCreditsModel? result;

    String path = "$creditsUrl$idMovie/credits";
    try {
      var uri = Uri.https(endPointUrl, path, queryParameters);

      final response = await http.get(uri, headers: headers);
      if (response.statusCode == 200) {
        final item = jsonDecode(response.body);
        result = MovieCreditsModel.fromJson(item);
      }
    } catch (e) {
      print("error : $e");
      throw Exception(e.toString());
    }
    print("getCreditMovie : ${result}");
    return result;
  }
}

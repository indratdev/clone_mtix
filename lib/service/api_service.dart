import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:clone_mtix/model/movie_credits/movie_credits_model.dart';
import 'package:clone_mtix/model/movie_detail/movie_detail_model.dart';

import '../model/movie/movie_model.dart';
import 'package:http/http.dart' as http;
import '../shared//utils/constants/constants.dart';

enum TypeMovie {
  now,
  upcoming,
}

class APIService {
  final endPointUrl = "api.themoviedb.org";
  final nowPlayingUrl = "/3/movie/now_playing";
  final creditsUrl = "/3/movie/";
  final upcomingUrl = "/3/movie/upcoming";

  var queryParameters = {
    'api_key': apiKey,
    'language': languageApi,
  };

  var headers = {
    HttpHeaders.contentTypeHeader: "application/json",
  };

  String urlMovie(TypeMovie typeMovie) {
    String url = "";
    if (typeMovie.name == TypeMovie.now.name) {
      url = nowPlayingUrl;
    } else if (typeMovie.name == TypeMovie.upcoming.name) {
      url = upcomingUrl;
    }

    return url;
  }

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
    return result;
  }

  // get detail movie
  Future<MovieDetailModel?> getDetailMovie(int idMovie) async {
    // /movie/{movie_id}
    MovieDetailModel? result;
    String path = "$creditsUrl$idMovie";
    try {
      var uri = Uri.https(endPointUrl, path, queryParameters);

      final response = await http.get(uri, headers: headers);
      if (response.statusCode == 200) {
        final item = jsonDecode(response.body);
        result = MovieDetailModel.fromJson(item);
      }
    } catch (e) {
      print("error : $e");
      throw Exception(e.toString());
    }

    return result;
  }

  // get movie by param
  Future<MovieModel?> getMoviebyParam(TypeMovie typeMovie) async {
    MovieModel? result;
    try {
      String urlPath = urlMovie(typeMovie);

      var uri = Uri.https(endPointUrl, urlPath, queryParameters);

      final response = await http.get(uri, headers: headers);

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
}

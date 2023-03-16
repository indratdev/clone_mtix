import 'package:json_annotation/json_annotation.dart';

part 'movie_detail_model.g.dart';

@JsonSerializable()
class MovieDetailModel {
  bool adult;
  String backdrop_path;
  BelongToCollection? belongs_to_collection;
  int budget;
  List<Genres> genres;
  String homepage;
  int id;
  String imdb_id;
  String original_language;
  String original_title;
  String overview;
  double popularity;
  String poster_path;
  List<ProductionCompanies> production_companies;
  List<ProductionCountries> production_countries;
  String release_date;
  int revenue;
  int runtime;
  List<SpokenLanguages> spoken_languages;
  String status;
  String tagline;
  String title;
  bool video;
  double vote_average;
  int vote_count;

  MovieDetailModel({
    required this.adult,
    required this.backdrop_path,
    this.belongs_to_collection,
    required this.budget,
    required this.genres,
    required this.homepage,
    required this.id,
    required this.imdb_id,
    required this.original_language,
    required this.original_title,
    required this.overview,
    required this.popularity,
    required this.poster_path,
    required this.production_companies,
    required this.production_countries,
    required this.release_date,
    required this.revenue,
    required this.runtime,
    required this.spoken_languages,
    required this.status,
    required this.tagline,
    required this.title,
    required this.video,
    required this.vote_average,
    required this.vote_count,
  });

  factory MovieDetailModel.fromJson(Map<String, dynamic> json) =>
      _$MovieDetailModelFromJson(json);

  Map<String, dynamic> toJson() => _$MovieDetailModelToJson(this);
}

@JsonSerializable()
class Genres {
  int id;
  String name;

  Genres({
    required this.id,
    required this.name,
  });

  factory Genres.fromJson(Map<String, dynamic> json) => _$GenresFromJson(json);

  Map<String, dynamic> toJson() => _$GenresToJson(this);
}

@JsonSerializable()
class BelongToCollection {
  int id;
  String name;
  String poster_path;
  String backdrop_path;

  BelongToCollection({
    required this.backdrop_path,
    required this.id,
    required this.name,
    required this.poster_path,
  });

  factory BelongToCollection.fromJson(Map<String, dynamic> json) =>
      _$BelongToCollectionFromJson(json);

  Map<String, dynamic> toJson() => _$BelongToCollectionToJson(this);
}

@JsonSerializable()
class ProductionCompanies {
  int id;
  String? logo_path;
  String? name;
  String? origin_country;

  ProductionCompanies({
    required this.id,
    this.logo_path,
    this.name,
    this.origin_country,
  });

  factory ProductionCompanies.fromJson(Map<String, dynamic> json) =>
      _$ProductionCompaniesFromJson(json);

  Map<String, dynamic> toJson() => _$ProductionCompaniesToJson(this);
}

@JsonSerializable()
class ProductionCountries {
  String iso_3166_1;
  String name;

  ProductionCountries({
    required this.iso_3166_1,
    required this.name,
  });

  factory ProductionCountries.fromJson(Map<String, dynamic> json) =>
      _$ProductionCountriesFromJson(json);

  Map<String, dynamic> toJson() => _$ProductionCountriesToJson(this);
}

@JsonSerializable()
class SpokenLanguages {
  String english_name;
  String iso_639_1;
  String name;

  SpokenLanguages({
    required this.english_name,
    required this.iso_639_1,
    required this.name,
  });

  factory SpokenLanguages.fromJson(Map<String, dynamic> json) =>
      _$SpokenLanguagesFromJson(json);

  Map<String, dynamic> toJson() => _$SpokenLanguagesToJson(this);
}

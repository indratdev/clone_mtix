import 'package:json_annotation/json_annotation.dart';

part 'movie_credits_model.g.dart';

@JsonSerializable()
class MovieCreditsModel {
  int id;
  List<Cast> cast;
  List<Crew> crew;

  MovieCreditsModel({
    required this.id,
    required this.cast,
    required this.crew,
  });

  factory MovieCreditsModel.fromJson(Map<String, dynamic> json) =>
      _$MovieCreditsModelFromJson(json);

  Map<String, dynamic> toJson() => _$MovieCreditsModelToJson(this);
}

@JsonSerializable()
class Cast {
  bool adult;
  int gender;
  int id;
  String known_for_department;
  String name;
  String original_name;
  double popularity;
  String? profile_path = "";
  int cast_id;
  String character;
  String credit_id;
  int order;

  Cast({
    required this.adult,
    required this.cast_id,
    required this.character,
    required this.credit_id,
    required this.gender,
    required this.id,
    required this.known_for_department,
    required this.name,
    required this.order,
    required this.original_name,
    required this.popularity,
    required this.profile_path,
  });

  factory Cast.fromJson(Map<String, dynamic> json) => _$CastFromJson(json);

  Map<String, dynamic> toJson() => _$CastToJson(this);
}

@JsonSerializable()
class Crew {
  bool adult;
  int gender;
  int id;
  String known_for_department;
  String name;
  String original_name;
  double popularity;
  String? profile_path = "";
  String credit_id;
  String department;
  String job;

  Crew({
    required this.adult,
    required this.credit_id,
    required this.department,
    required this.gender,
    required this.id,
    required this.job,
    required this.known_for_department,
    required this.name,
    required this.original_name,
    required this.popularity,
    required this.profile_path,
  });

  factory Crew.fromJson(Map<String, dynamic> json) => _$CrewFromJson(json);

  Map<String, dynamic> toJson() => _$CrewToJson(this);
}

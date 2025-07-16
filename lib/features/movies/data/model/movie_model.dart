import 'package:json_annotation/json_annotation.dart';

part 'movie_model.g.dart';

@JsonSerializable()
class MovieModel {
  final int id;
  final int albumId;
  final String title;
  final String url;
  final String thumbnailUrl;

  const MovieModel({
    required this.id,
    required this.albumId,
    required this.title,
    required this.url,
    required this.thumbnailUrl,
  });

  factory MovieModel.fromJson(Map<String, dynamic> json) =>
      _$MovieModelFromJson(json);

  Map<String, dynamic> toJson() => _$MovieModelToJson(this);
}

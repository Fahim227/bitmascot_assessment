import 'package:bitmascot_assessment/features/movies/domain/entity/movie_entity.dart';
import 'package:hive/hive.dart';

part 'movie_local_model.g.dart';

@HiveType(typeId: 0)
class MovieLocalModel extends HiveObject {
  @HiveField(0)
  int id;
  @HiveField(1)
  final int albumId;
  @HiveField(2)
  final String title;
  @HiveField(3)
  final String url;
  @HiveField(4)
  final String thumbnailUrl;

  MovieLocalModel({
    required this.id,
    required this.albumId,
    required this.title,
    required this.url,
    required this.thumbnailUrl,
  });

  factory MovieLocalModel.fromEntity(MovieEntity entity) {
    return MovieLocalModel(
      id: entity.id,
      title: entity.title,
      albumId: entity.albumId,
      url: entity.url,
      thumbnailUrl: entity.thumbnailUrl,
    );
  }
}

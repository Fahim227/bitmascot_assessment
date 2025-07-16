import 'package:bitmascot_assessment/core/utils/mapper.dart';
import 'package:bitmascot_assessment/features/favorite_movies/data/model/movie_local_model.dart';
import 'package:bitmascot_assessment/features/movies/domain/entity/movie_entity.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: Mapper<List<MovieLocalModel>, List<MovieEntity>>)
class MovieModelToEntity
    implements Mapper<List<MovieLocalModel>, List<MovieEntity>> {
  @override
  List<MovieEntity> map(List<MovieLocalModel> allModels) {
    return allModels
        .map(
          (e) => MovieEntity(
            id: e.id,
            albumId: e.albumId,
            title: e.title,
            url: e.url,
            thumbnailUrl: e.thumbnailUrl,
          ),
        )
        .toList();
  }
}

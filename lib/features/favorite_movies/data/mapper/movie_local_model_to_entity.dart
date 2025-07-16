import 'package:bitmascot_assessment/core/utils/mapper.dart';
import 'package:bitmascot_assessment/features/favorite_movies/data/model/movie_local_model.dart';
import 'package:bitmascot_assessment/features/movies/domain/entity/movie_entity.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: Mapper<MovieLocalModel, MovieEntity>)
class MovieModelToEntity implements Mapper<MovieLocalModel, MovieEntity> {
  @override
  MovieEntity map(MovieLocalModel movieLocalModel) {
    return MovieEntity(
      id: movieLocalModel.id,
      albumId: movieLocalModel.albumId,
      title: movieLocalModel.title,
      url: movieLocalModel.url,
      thumbnailUrl: movieLocalModel.thumbnailUrl,
    );
  }
}

import 'package:bitmascot_assessment/core/network/custom_exception.dart';
import 'package:bitmascot_assessment/features/movies/domain/entity/movie_entity.dart';
import 'package:dartz/dartz.dart';

abstract class FavoriteMoviesRepository {
  Future<Either<CustomException, MovieEntity>> addFavoriteMovie(
    MovieEntity movie,
  );

  Future<Either<CustomException, List<MovieEntity>>> getAllFavMovies();
}

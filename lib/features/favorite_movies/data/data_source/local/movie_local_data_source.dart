import 'package:bitmascot_assessment/core/network/custom_exception.dart';
import 'package:bitmascot_assessment/features/favorite_movies/data/model/movie_local_model.dart';
import 'package:dartz/dartz.dart';

abstract class MovieLocalDataSource {
  Future<Either<CustomException, MovieLocalModel>> addMovieToFavorite(
    MovieLocalModel movieModel,
  );

  Future<Either<CustomException, List<MovieLocalModel>>> getAllFavMovies();
}

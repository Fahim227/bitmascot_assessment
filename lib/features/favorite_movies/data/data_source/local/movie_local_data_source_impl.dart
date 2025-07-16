import 'package:bitmascot_assessment/core/network/custom_exception.dart';
import 'package:bitmascot_assessment/features/favorite_movies/data/data_source/local/movie_local_data_source.dart';
import 'package:bitmascot_assessment/features/favorite_movies/data/model/movie_local_model.dart';
import 'package:dartz/dartz.dart';
import 'package:hive/hive.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: MovieLocalDataSource)
class MovieHiveLocalDataSourceImpl implements MovieLocalDataSource {
  final Box<MovieLocalModel> movieBox;

  MovieHiveLocalDataSourceImpl(this.movieBox);

  @override
  Future<Either<CustomException, MovieLocalModel>> addMovieToFavorite(
    MovieLocalModel movieModel,
  ) async {
    try {
      await movieBox.put(movieModel.id.toString(), movieModel);
      return Right(movieModel);
    } catch (e) {
      return Left(CustomException.fromHiveError(e));
    }
  }

  @override
  Future<Either<CustomException, List<MovieLocalModel>>>
  getAllFavMovies() async {
    try {
      final movies = movieBox.values.toList();
      return Right(movies);
    } catch (e) {
      return Left(CustomException.fromHiveError(e));
    }
  }
}

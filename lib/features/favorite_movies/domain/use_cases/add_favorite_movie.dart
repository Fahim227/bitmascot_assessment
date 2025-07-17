import 'package:bitmascot_assessment/core/network/custom_exception.dart';
import 'package:bitmascot_assessment/features/favorite_movies/domain/repository/favorite_movies_repository.dart';
import 'package:bitmascot_assessment/features/movies/domain/entity/movie_entity.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

@injectable
class AddFavoriteMovie {
  final FavoriteMoviesRepository _repository;

  AddFavoriteMovie(this._repository);

  Future<Either<CustomException, MovieEntity>> call(MovieEntity movie) async {
    return await _repository.addFavoriteMovie(movie);
  }
}

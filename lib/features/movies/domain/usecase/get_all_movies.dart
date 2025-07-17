import 'package:bitmascot_assessment/core/network/custom_exception.dart';
import 'package:bitmascot_assessment/features/movies/domain/entity/movie_entity.dart';
import 'package:bitmascot_assessment/features/movies/domain/repository/get_all_movies_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

@injectable
class GetAllMovies {
  final GetAllMoviesRepository _repository;

  GetAllMovies(this._repository);

  Future<Either<CustomException, List<MovieEntity>>> call() async {
    return await _repository.getAllMovies();
  }
}

import 'package:bitmascot_assessment/core/network/custom_exception.dart';
import 'package:bitmascot_assessment/features/movies/domain/entity/movie_entity.dart';
import 'package:dartz/dartz.dart';

abstract class GetAllMoviesRepository {
  Future<Either<CustomException, List<MovieEntity>>> getAllMovies();
}

import 'package:bitmascot_assessment/core/network/custom_exception.dart';
import 'package:bitmascot_assessment/features/movies/data/model/movie_model.dart';
import 'package:dartz/dartz.dart';

abstract class MoviesDataSource {
  Future<Either<CustomException, List<MovieModel>>> getAllPosts();
}

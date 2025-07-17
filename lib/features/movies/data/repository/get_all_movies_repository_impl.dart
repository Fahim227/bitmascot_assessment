import 'package:bitmascot_assessment/core/network/custom_exception.dart';
import 'package:bitmascot_assessment/core/utils/mapper.dart';
import 'package:bitmascot_assessment/features/movies/data/data_source/remote/data_source.dart';
import 'package:bitmascot_assessment/features/movies/data/model/movie_model.dart';
import 'package:bitmascot_assessment/features/movies/domain/entity/movie_entity.dart';
import 'package:bitmascot_assessment/features/movies/domain/repository/get_all_movies_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: GetAllMoviesRepository)
class GetAllMoviesRepositoryImpl implements GetAllMoviesRepository {
  final MoviesDataSource _dataSource;
  final Mapper<List<MovieModel>, List<MovieEntity>> _movieModelToEntityMapper;

  GetAllMoviesRepositoryImpl(this._dataSource, this._movieModelToEntityMapper);

  @override
  Future<Either<CustomException, List<MovieEntity>>> getAllMovies() async {
    final result = await _dataSource.getAllPosts();
    return result.fold((error) => Left(error), (data) {
      final allMovies = _movieModelToEntityMapper.map(data);
      return Right(allMovies);
    });
  }
}

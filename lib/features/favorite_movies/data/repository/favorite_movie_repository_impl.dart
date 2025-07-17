import 'package:bitmascot_assessment/core/network/custom_exception.dart';
import 'package:bitmascot_assessment/core/utils/mapper.dart';
import 'package:bitmascot_assessment/features/favorite_movies/data/data_source/local/movie_local_data_source.dart';
import 'package:bitmascot_assessment/features/favorite_movies/data/model/movie_local_model.dart';
import 'package:bitmascot_assessment/features/favorite_movies/domain/repository/favorite_movies_repository.dart';
import 'package:bitmascot_assessment/features/movies/domain/entity/movie_entity.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: FavoriteMoviesRepository)
class FavoriteMoviesRepositoryImpl implements FavoriteMoviesRepository {
  final MovieLocalDataSource _dataSource;
  final Mapper<MovieLocalModel, MovieEntity> _movieLocalModelToEntity;
  final Mapper<List<MovieLocalModel>, List<MovieEntity>>
  _allLocalMoviesModelToEntity;

  FavoriteMoviesRepositoryImpl(
    this._dataSource,
    this._movieLocalModelToEntity,
    this._allLocalMoviesModelToEntity,
  );

  @override
  Future<Either<CustomException, MovieEntity>> addFavoriteMovie(
    MovieEntity movie,
  ) async {
    final movieModel = MovieLocalModel(
      id: movie.id,
      albumId: movie.albumId,
      title: movie.title,
      url: movie.url,
      thumbnailUrl: movie.thumbnailUrl,
    );
    final result = await _dataSource.addMovieToFavorite(movieModel);
    return result.fold((error) => Left(error), (data) {
      final mappedPostEntity = _movieLocalModelToEntity.map(data);
      return Right(mappedPostEntity);
    });
  }

  @override
  Future<Either<CustomException, List<MovieEntity>>> getAllFavMovies() async {
    final result = await _dataSource.getAllFavMovies();
    return result.fold((error) => Left(error), (data) {
      final mappedPostEntity = _allLocalMoviesModelToEntity.map(data);
      return Right(mappedPostEntity);
    });
  }
}

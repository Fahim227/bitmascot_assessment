import 'dart:math';

import 'package:bitmascot_assessment/core/di/di.dart';
import 'package:bitmascot_assessment/core/network/network_client.dart';
import 'package:bitmascot_assessment/core/utils/mapper.dart';
import 'package:bitmascot_assessment/features/movies/data/data_source/remote/data_source.dart';
import 'package:bitmascot_assessment/features/movies/data/data_source/remote/data_source_impl.dart';
import 'package:bitmascot_assessment/features/movies/data/mapper/movie_model_to_entity.dart';
import 'package:bitmascot_assessment/features/movies/data/model/movie_model.dart';
import 'package:bitmascot_assessment/features/movies/data/repository/get_all_movies_repository_impl.dart';
import 'package:bitmascot_assessment/features/movies/domain/entity/movie_entity.dart';
import 'package:bitmascot_assessment/features/movies/domain/repository/get_all_movies_repository.dart';
import 'package:bitmascot_assessment/features/movies/domain/usecase/get_all_movies.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

part 'state_notifier.dart';

final moviesDataSourceProvider = Provider<MoviesDataSource>(
  (ref) => PostsDataSourceImpl(sl<NetworkClient>()),
);

final movieModelToEntityMapperProvider =
    Provider<Mapper<List<MovieModel>, List<MovieEntity>>>((ref) {
      return MovieModelToEntity();
    });

final moviesRepositoryProvider = Provider<GetAllMoviesRepository>((ref) {
  final datasourceProvider = ref.read(moviesDataSourceProvider);
  final movieModelToEntityMapper = ref.read(movieModelToEntityMapperProvider);
  return GetAllMoviesRepositoryImpl(
    datasourceProvider,
    movieModelToEntityMapper,
  );
});

final getAllMoviesUseCaseProvider = Provider<GetAllMovies>((ref) {
  final repositoryProvider = ref.read(moviesRepositoryProvider);
  return GetAllMovies(repositoryProvider);
});

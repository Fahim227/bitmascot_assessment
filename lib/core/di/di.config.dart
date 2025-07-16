// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:bitmascot_assessment/core/network/network_client.dart'
    as _i1063;
import 'package:bitmascot_assessment/core/network/private_network_client.dart'
    as _i285;
import 'package:bitmascot_assessment/core/utils/mapper.dart' as _i71;
import 'package:bitmascot_assessment/features/favorite_movies/data/data_source/local/movie_local_data_source.dart'
    as _i566;
import 'package:bitmascot_assessment/features/favorite_movies/data/data_source/local/movie_local_data_source_impl.dart'
    as _i53;
import 'package:bitmascot_assessment/features/favorite_movies/data/mapper/all_movies_local_model_to_entity.dart'
    as _i272;
import 'package:bitmascot_assessment/features/favorite_movies/data/mapper/movie_local_model_to_entity.dart'
    as _i424;
import 'package:bitmascot_assessment/features/favorite_movies/data/model/movie_local_model.dart'
    as _i1034;
import 'package:bitmascot_assessment/features/favorite_movies/data/repository/favorite_movie_repository_impl.dart'
    as _i237;
import 'package:bitmascot_assessment/features/favorite_movies/domain/repository/favorite_movies_repository.dart'
    as _i699;
import 'package:bitmascot_assessment/features/favorite_movies/domain/use_cases/add_favorite_movie.dart'
    as _i94;
import 'package:bitmascot_assessment/features/favorite_movies/domain/use_cases/all_favorite_movies.dart'
    as _i588;
import 'package:bitmascot_assessment/features/favorite_movies/presentation/bloc/favorite_movie_cubit.dart'
    as _i823;
import 'package:bitmascot_assessment/features/login/domain/use_case/login_usecase.dart'
    as _i85;
import 'package:bitmascot_assessment/features/login/presentation/bloc/login_cubit.dart'
    as _i59;
import 'package:bitmascot_assessment/features/movie_details/presentation/bloc/movie_details_cubit.dart'
    as _i1017;
import 'package:bitmascot_assessment/features/movies/data/data_source/remote/data_source.dart'
    as _i453;
import 'package:bitmascot_assessment/features/movies/data/data_source/remote/data_source_impl.dart'
    as _i26;
import 'package:bitmascot_assessment/features/movies/data/mapper/movie_model_to_entity.dart'
    as _i418;
import 'package:bitmascot_assessment/features/movies/data/model/movie_model.dart'
    as _i128;
import 'package:bitmascot_assessment/features/movies/data/repository/get_all_movies_repository_impl.dart'
    as _i579;
import 'package:bitmascot_assessment/features/movies/domain/entity/movie_entity.dart'
    as _i813;
import 'package:bitmascot_assessment/features/movies/domain/repository/get_all_movies_repository.dart'
    as _i246;
import 'package:bitmascot_assessment/features/movies/domain/usecase/get_all_movies.dart'
    as _i130;
import 'package:bitmascot_assessment/features/movies/presentation/bloc/all_movies_cubit.dart'
    as _i90;
import 'package:get_it/get_it.dart' as _i174;
import 'package:hive/hive.dart' as _i979;
import 'package:injectable/injectable.dart' as _i526;

extension GetItInjectableX on _i174.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    gh.factory<_i85.LoginUseCase>(() => _i85.LoginUseCase());
    gh.factory<_i71.Mapper<_i1034.MovieLocalModel, _i813.MovieEntity>>(
        () => _i424.MovieModelToEntity());
    gh.singleton<_i1063.NetworkClient>(() => _i285.PrivateNetworkClient());
    gh.factory<_i71.Mapper<List<_i128.MovieModel>, List<_i813.MovieEntity>>>(
        () => _i418.MovieModelToEntity());
    gh.factory<
            _i71.Mapper<List<_i1034.MovieLocalModel>, List<_i813.MovieEntity>>>(
        () => _i272.MovieModelToEntity());
    gh.factory<_i566.MovieLocalDataSource>(() =>
        _i53.MovieHiveLocalDataSourceImpl(
            gh<_i979.Box<_i1034.MovieLocalModel>>()));
    gh.factory<_i699.FavoriteMoviesRepository>(() =>
        _i237.FavoriteMoviesRepositoryImpl(
          gh<_i566.MovieLocalDataSource>(),
          gh<_i71.Mapper<_i1034.MovieLocalModel, _i813.MovieEntity>>(),
          gh<
              _i71
              .Mapper<List<_i1034.MovieLocalModel>, List<_i813.MovieEntity>>>(),
        ));
    gh.factory<_i94.AddFavoriteMovie>(
        () => _i94.AddFavoriteMovie(gh<_i699.FavoriteMoviesRepository>()));
    gh.factory<_i588.AllFavoriteMovies>(
        () => _i588.AllFavoriteMovies(gh<_i699.FavoriteMoviesRepository>()));
    gh.factory<_i59.LoginCubit>(() => _i59.LoginCubit(gh<_i85.LoginUseCase>()));
    gh.factory<_i453.MoviesDataSource>(
        () => _i26.PostsDataSourceImpl(gh<_i1063.NetworkClient>()));
    gh.factory<_i1017.MovieDetailsCubit>(
        () => _i1017.MovieDetailsCubit(gh<_i94.AddFavoriteMovie>()));
    gh.factory<_i246.GetAllMoviesRepository>(() =>
        _i579.GetAllMoviesRepositoryImpl(
          gh<_i453.MoviesDataSource>(),
          gh<_i71.Mapper<List<_i128.MovieModel>, List<_i813.MovieEntity>>>(),
        ));
    gh.factory<_i823.FavoriteMovieCubit>(
        () => _i823.FavoriteMovieCubit(gh<_i588.AllFavoriteMovies>()));
    gh.factory<_i130.GetAllMovies>(
        () => _i130.GetAllMovies(gh<_i246.GetAllMoviesRepository>()));
    gh.factory<_i90.AllMoviesCubit>(
        () => _i90.AllMoviesCubit(gh<_i130.GetAllMovies>()));
    return this;
  }
}

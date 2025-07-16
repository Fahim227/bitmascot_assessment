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
import 'package:bitmascot_assessment/features/login/domain/use_case/login_usecase.dart'
    as _i85;
import 'package:bitmascot_assessment/features/login/presentation/bloc/login_cubit.dart'
    as _i59;
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
import 'package:injectable/injectable.dart' as _i526;

extension GetItInjectableX on _i174.GetIt {
  // initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(this, environment, environmentFilter);
    gh.factory<_i85.LoginUseCase>(() => _i85.LoginUseCase());
    gh.singleton<_i1063.NetworkClient>(() => _i285.PrivateNetworkClient());
    gh.factory<_i71.Mapper<List<_i128.MovieModel>, List<_i813.MovieEntity>>>(
      () => _i418.MovieModelToEntity(),
    );
    gh.factory<_i59.LoginCubit>(() => _i59.LoginCubit(gh<_i85.LoginUseCase>()));
    gh.factory<_i453.MoviesDataSource>(
      () => _i26.PostsDataSourceImpl(gh<_i1063.NetworkClient>()),
    );
    gh.factory<_i246.GetAllMoviesRepository>(
      () => _i579.GetAllMoviesRepositoryImpl(
        gh<_i453.MoviesDataSource>(),
        gh<_i71.Mapper<List<_i128.MovieModel>, List<_i813.MovieEntity>>>(),
      ),
    );
    gh.factory<_i130.GetAllMovies>(
      () => _i130.GetAllMovies(gh<_i246.GetAllMoviesRepository>()),
    );
    gh.factory<_i90.AllMoviesCubit>(
      () => _i90.AllMoviesCubit(gh<_i130.GetAllMovies>()),
    );
    return this;
  }
}

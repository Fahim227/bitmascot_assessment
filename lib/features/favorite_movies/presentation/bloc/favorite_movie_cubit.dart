import 'package:bitmascot_assessment/features/favorite_movies/domain/use_cases/all_favorite_movies.dart';
import 'package:bitmascot_assessment/features/movies/domain/entity/movie_entity.dart';
import 'package:bloc/bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';

part 'favorite_movie_state.dart';

@injectable
class FavoriteMovieCubit extends Cubit<FavoriteMovieState> {
  final AllFavoriteMovies _allFavoriteMovies;

  FavoriteMovieCubit(AllFavoriteMovies allFavoriteMovies)
    : _allFavoriteMovies = allFavoriteMovies,
      super(FavoriteMovieLoadingState());

  Future<void> getAllFavoriteMovies() async {
    final result = await _allFavoriteMovies.call();
    result.fold(
      (error) => emit(FavoriteMovieErrorState(error.message)),
      (data) => emit(FavoriteMovieLoadedState(data)),
    );
  }
}

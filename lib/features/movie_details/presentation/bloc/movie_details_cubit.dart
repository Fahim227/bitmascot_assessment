import 'package:bitmascot_assessment/features/favorite_movies/domain/use_cases/add_favorite_movie.dart';
import 'package:bitmascot_assessment/features/favorite_movies/domain/use_cases/all_favorite_movies.dart';
import 'package:bitmascot_assessment/features/movies/domain/entity/movie_entity.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

part 'movie_details_state.dart';

@injectable
class MovieDetailsCubit extends Cubit<MovieDetailsState> {
  final AddFavoriteMovie _addFavoriteMovie;

  MovieDetailsCubit(
    AddFavoriteMovie addFavoriteMovie,
    AllFavoriteMovies allFavoriteMovies,
  ) : _addFavoriteMovie = addFavoriteMovie,
      super(MovieDetailsInitial());

  Future<void> addToFavMovie(MovieEntity movie) async {
    await _addFavoriteMovie.call(movie);
  }
}

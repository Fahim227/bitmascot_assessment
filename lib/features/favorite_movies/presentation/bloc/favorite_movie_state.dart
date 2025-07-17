part of 'favorite_movie_cubit.dart';

@immutable
sealed class FavoriteMovieState {}

final class FavoriteMovieLoadingState extends FavoriteMovieState {}

final class FavoriteMovieErrorState extends FavoriteMovieState {
  final String errorMessage;

  FavoriteMovieErrorState(this.errorMessage);
}

final class FavoriteMovieLoadedState extends FavoriteMovieState {
  final List<MovieEntity> allMovies;

  FavoriteMovieLoadedState(this.allMovies);
}

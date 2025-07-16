part of 'all_movies_cubit.dart';

sealed class AllMoviesState {}

final class AllMoviesLoadingState extends AllMoviesState {}

final class AllMoviesErrorState extends AllMoviesState {
  final String errorMessage;

  AllMoviesErrorState(this.errorMessage);
}

final class AllMoviesLoadedState extends AllMoviesState {
  final List<MovieEntity> allMovies;

  AllMoviesLoadedState(this.allMovies);
}

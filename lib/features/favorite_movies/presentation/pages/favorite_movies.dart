import 'package:bitmascot_assessment/features/favorite_movies/presentation/bloc/favorite_movie_cubit.dart';
import 'package:bitmascot_assessment/features/movies/presentation/widget/movie_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FavoriteMovies extends StatelessWidget {
  const FavoriteMovies({super.key});

  @override
  Widget build(BuildContext context) {
    final primaryColor = Theme.of(context).colorScheme.primary;

    return Scaffold(
      appBar: AppBar(
        title: const Text("Favorite Movies"),
        backgroundColor: primaryColor,
      ),
      body: BlocConsumer<FavoriteMovieCubit, FavoriteMovieState>(
        listener: (context, state) {},
        builder: (context, state) {
          switch (state) {
            case FavoriteMovieLoadingState():
              return const Center(child: CircularProgressIndicator());
            case FavoriteMovieErrorState():
              return Center(child: Text('Error: ${state.errorMessage}'));

            case FavoriteMovieLoadedState():
              final movies = state.allMovies;

              if (movies.isEmpty) {
                return const Center(child: Text("No data found"));
              }

              return RefreshIndicator(
                onRefresh: () async {
                  return Future.delayed(const Duration(seconds: 1)).then(
                    (value) => context
                        .read<FavoriteMovieCubit>()
                        .getAllFavoriteMovies(),
                  );
                },
                child: MovieList(movies: movies),
              );
          }
        },
      ),
    );
  }
}

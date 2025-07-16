import 'package:bitmascot_assessment/core/utils/app_colors.dart';
import 'package:bitmascot_assessment/features/movies/presentation/bloc/all_movies_cubit.dart';
import 'package:bitmascot_assessment/features/movies/presentation/widget/movie_tile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AllMovies extends StatelessWidget {
  const AllMovies({super.key});

  @override
  Widget build(BuildContext context) {
    final primaryColor = Theme.of(context).colorScheme.primary;

    return Scaffold(
      appBar: AppBar(
        title: const Text("All Movies"),
        backgroundColor: primaryColor,
      ),
      body: BlocConsumer<AllMoviesCubit, AllMoviesState>(
        listener: (context, state) {},
        builder: (context, state) {
          switch (state) {
            case AllMoviesLoadingState():
              return const Center(child: CircularProgressIndicator());
            case AllMoviesErrorState():
              return Center(child: Text('Error: ${state.errorMessage}'));

            case AllMoviesLoadedState():
              final movies = state.allMovies;

              if (movies.isEmpty) {
                return const Center(child: Text("No data found"));
              }

              return RefreshIndicator(
                onRefresh: () async {
                  return Future.delayed(const Duration(seconds: 1)).then(
                    (value) => context.read<AllMoviesCubit>().getAllMovies(),
                  );
                },
                child: ListView.separated(
                  itemCount: movies.length,
                  itemBuilder: (context, index) {
                    final movieEntity = movies[index];

                    return InkWell(
                      onTap: () {
                        // Todo: got to movie details page

                        // Navigator.pushNamed(
                        //   context,
                        //   '/details',
                        //   arguments: movieEntity,
                        // );
                      },
                      child: MovieTile(movie: movieEntity),
                    );
                  },
                  separatorBuilder: (BuildContext context, int index) {
                    return Divider(
                      color: AppColors.dividerColor,
                      thickness: 2,
                      indent: 1,
                      endIndent: 1,
                      height: 1,
                    );
                  },
                ),
              );
          }
        },
      ),
    );
  }
}

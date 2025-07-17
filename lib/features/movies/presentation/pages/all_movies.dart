import 'package:bitmascot_assessment/features/movies/presentation/bloc/all_movies_cubit.dart';
import 'package:bitmascot_assessment/features/movies/presentation/widget/movie_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AllMovies extends StatefulWidget {
  const AllMovies({super.key});

  @override
  State<AllMovies> createState() => _AllMoviesState();
}

class _AllMoviesState extends State<AllMovies> {
  final _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(() {
      if (_scrollController.position.pixels >=
          _scrollController.position.maxScrollExtent) {
        context.read<AllMoviesCubit>().loadMoreMovies();
      }
    });
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final primaryColor = Theme.of(context).colorScheme.primary;

    return Scaffold(
      appBar: AppBar(
        title: const Text("All Movies"),
        backgroundColor: primaryColor,
        actions: [
          IconButton(
            onPressed: () => Navigator.pushNamed(context, "/favorite_movies"),
            icon: Icon(Icons.favorite, color: Colors.red),
          ),
        ],
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
                child: MovieList(
                  movies: movies,
                  scrollController: _scrollController,
                  hasMore: state.hasMore,
                ),
              );
          }
        },
      ),
    );
  }
}

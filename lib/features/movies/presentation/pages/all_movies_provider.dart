import 'package:bitmascot_assessment/core/network/custom_exception.dart';
import 'package:bitmascot_assessment/features/movies/presentation/riverpod/provider.dart';
import 'package:bitmascot_assessment/features/movies/presentation/widget/movie_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AllMoviesProvider extends ConsumerWidget {
  const AllMoviesProvider({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final allMoviesState = ref.watch(allMoviesNotifierProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text("All Movies"),
        backgroundColor: Colors.purple,
      ),
      body: allMoviesState.when(
        data: (data) => MovieList(movies: data),
        loading: () => Center(child: CircularProgressIndicator()),
        error: (error, _) =>
            Center(child: Text('Error: ${(error as CustomException).message}')),
      ),
    );
  }
}

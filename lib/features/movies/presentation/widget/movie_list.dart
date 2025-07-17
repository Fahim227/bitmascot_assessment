import 'package:bitmascot_assessment/core/utils/app_colors.dart';
import 'package:bitmascot_assessment/features/movies/domain/entity/movie_entity.dart';
import 'package:flutter/material.dart';

import 'movie_tile.dart';

class MovieList extends StatelessWidget {
  final List<MovieEntity> movies;
  final ScrollController? scrollController;
  final bool hasMore;

  const MovieList({
    super.key,
    required this.movies,
    this.hasMore = false,
    this.scrollController,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      controller: scrollController,
      itemCount: hasMore ? movies.length + 1 : movies.length,
      itemBuilder: (context, index) {
        if (index == movies.length) {
          return Padding(
            padding: EdgeInsets.symmetric(horizontal: 16),
            child: LinearProgressIndicator(minHeight: 8),
          );
        }

        final movieEntity = movies[index];

        return InkWell(
          onTap: () {
            Navigator.pushNamed(context, '/details', arguments: movieEntity);
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
    );
  }
}

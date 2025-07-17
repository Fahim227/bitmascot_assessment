import 'package:bitmascot_assessment/features/movie_details/presentation/bloc/movie_details_cubit.dart';
import 'package:bitmascot_assessment/features/movie_details/presentation/widget/favorite_widget.dart';
import 'package:bitmascot_assessment/features/movie_details/presentation/widget/key_value_widget.dart';
import 'package:bitmascot_assessment/features/movies/domain/entity/movie_entity.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MovieDetailsPage extends StatelessWidget {
  final MovieEntity movie;

  const MovieDetailsPage({super.key, required this.movie});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    final primaryColor = Theme.of(context).colorScheme.primary;

    return Scaffold(
      appBar: AppBar(
        title: const Text("All Movies"),
        backgroundColor: primaryColor,
      ),
      backgroundColor: Colors.grey.shade200,
      body: BlocListener<MovieDetailsCubit, MovieDetailsState>(
        listener: (context, state) {},
        child: Padding(
          padding: EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CachedNetworkImage(
                width: size.width,
                height: 120,
                imageUrl: movie.thumbnailUrl,
                placeholder: (context, url) =>
                    Icon(Icons.image, size: 60, color: Colors.grey),
                errorWidget: (context, url, error) =>
                    Icon(Icons.image, size: 60, color: Colors.grey),
              ),
              SizedBox(height: 8),
              FavoriteWidget(
                isFav: false,
                onFavTap: () {
                  context.read<MovieDetailsCubit>().addToFavMovie(movie);
                },
              ),
              SizedBox(height: 8),

              TitleDescriptionWidget(title: "Title:", description: movie.title),
              SizedBox(height: 8),
              TitleDescriptionWidget(
                title: "Album Id:",
                description: movie.albumId.toString(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

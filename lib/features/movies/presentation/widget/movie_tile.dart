import 'package:bitmascot_assessment/features/movies/domain/entity/movie_entity.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class MovieTile extends StatelessWidget {
  final MovieEntity movie;

  const MovieTile({super.key, required this.movie});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
      decoration: const BoxDecoration(color: Colors.white),
      child: Row(
        children: [
          CachedNetworkImage(
            width: 60,
            height: 60,
            imageUrl: movie.thumbnailUrl,
            placeholder: (context, url) =>
                Icon(Icons.image, size: 60, color: Colors.grey),
            errorWidget: (context, url, error) =>
                Icon(Icons.image, size: 60, color: Colors.grey),
          ),
          SizedBox(width: 8),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  movie.title,
                  softWrap: true,

                  style: const TextStyle(
                    fontSize: 14,
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    overflow: TextOverflow.ellipsis,
                  ),
                  maxLines: 2,
                ),
                const SizedBox(height: 8),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

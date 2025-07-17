class MovieEntity {
  final int id;
  final int albumId;
  final String title;
  final String url;
  final String thumbnailUrl;

  const MovieEntity({
    required this.id,
    required this.albumId,
    required this.title,
    required this.url,
    required this.thumbnailUrl,
  });
}

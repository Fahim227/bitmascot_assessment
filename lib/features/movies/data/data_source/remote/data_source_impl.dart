import 'package:bitmascot_assessment/core/network/custom_exception.dart';
import 'package:bitmascot_assessment/core/network/network_client.dart';
import 'package:bitmascot_assessment/features/movies/data/data_source/remote/data_source.dart';
import 'package:bitmascot_assessment/features/movies/data/model/movie_model.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: MoviesDataSource)
class PostsDataSourceImpl implements MoviesDataSource {
  final NetworkClient _client;

  PostsDataSourceImpl(this._client);

  final String path = "/photos/";

  @override
  Future<Either<CustomException, List<MovieModel>>> getAllPosts() async {
    return await _client.get(
      path,
      parser: (data) =>
          (data as List).map((e) => MovieModel.fromJson(e)).toList(),
    );
  }
}

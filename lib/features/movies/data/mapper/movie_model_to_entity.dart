import 'package:bitmascot_assessment/core/utils/mapper.dart';
import 'package:bitmascot_assessment/features/movies/data/model/movie_model.dart';
import 'package:bitmascot_assessment/features/movies/domain/entity/movie_entity.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: Mapper<MovieModel, MovieEntity>)
class MovieModelToEntity
    implements Mapper<List<MovieModel>, List<MovieEntity>> {
  @override
  List<MovieEntity> map(List<MovieModel> allModels) {
    final String dummyImage1 =
        "https://images.unsplash.com/photo-1478720568477-152d9b164e26?q=80&w=870&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D";
    final String dummyImage2 =
        "https://plus.unsplash.com/premium_photo-1661675440353-6a6019c95bc7?q=80&w=1032&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D";
    final someDummyData = [
      MovieEntity(
        id: 1,
        albumId: 1,
        title: "Dummy Movie 1",
        url: "",
        thumbnailUrl: dummyImage1,
      ),
      MovieEntity(
        id: 2,
        albumId: 2,
        title: "Dummy Movie 2",
        url: "",
        thumbnailUrl: dummyImage2,
      ),
    ];

    final allRemoteData = allModels
        .map(
          (e) => MovieEntity(
            id: e.id,
            albumId: e.albumId,
            title: e.title,
            url: e.url,
            thumbnailUrl: e.thumbnailUrl,
          ),
        )
        .toList();

    return [...someDummyData, ...allRemoteData];
  }
}

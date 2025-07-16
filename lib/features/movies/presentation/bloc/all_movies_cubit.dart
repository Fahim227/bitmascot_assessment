import 'package:bitmascot_assessment/features/movies/domain/entity/movie_entity.dart';
import 'package:bitmascot_assessment/features/movies/domain/usecase/get_all_movies.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

part 'all_movies_state.dart';

@injectable
class AllMoviesCubit extends Cubit<AllMoviesState> {
  final GetAllMovies _getAllMovies;

  AllMoviesCubit(GetAllMovies getAllMovies)
    : _getAllMovies = getAllMovies,
      super(AllMoviesLoadingState());

  List<MovieEntity> _allMovies = [];

  Future<void> getAllMovies() async {
    emit(AllMoviesLoadingState());
    final result = await _getAllMovies.call();
    result.fold((error) => emit(AllMoviesErrorState(error.message)), (data) {
      _allMovies = data;
      emit(AllMoviesLoadedState(data));
    });
  }
}

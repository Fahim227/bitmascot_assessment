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

  int _currentIndex = 0;
  final int _pageSize = 10;
  bool _hasMore = true;

  Future<void> getAllMovies() async {
    emit(AllMoviesLoadingState());
    final result = await _getAllMovies.call();
    result.fold((error) => emit(AllMoviesErrorState(error.message)), (data) {
      _allMovies = data;
      _currentIndex = 0;
      _hasMore = true;
      _emitNextPage();
    });
  }

  void loadMoreMovies() {
    if (_hasMore) {
      _emitNextPage();
    }
  }

  void _emitNextPage() {
    final nextIndex = _currentIndex + _pageSize;
    final isLastPage = nextIndex >= _allMovies.length;

    final paginatedData = <MovieEntity>[];

    if (state is AllMoviesLoadedState) {
      paginatedData.addAll([...(state as AllMoviesLoadedState).allMovies]);
    }

    final pageItems = [
      ..._allMovies.sublist(
        _currentIndex,
        isLastPage ? _allMovies.length : nextIndex,
      ),
    ];
    paginatedData.addAll(pageItems);

    _currentIndex += pageItems.length;
    _hasMore = !isLastPage;
    emit(AllMoviesLoadedState(paginatedData, _hasMore));
  }
}

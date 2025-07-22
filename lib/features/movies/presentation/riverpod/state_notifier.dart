part of 'provider.dart';

final allMoviesNotifierProvider =
    StateNotifierProvider<AllMoviesNotifier, AsyncValue<List<MovieEntity>>>((
      ref,
    ) {
      final getAllMovies = ref.read(getAllMoviesUseCaseProvider);
      return AllMoviesNotifier(getAllMovies);
    });

class AllMoviesNotifier extends StateNotifier<AsyncValue<List<MovieEntity>>> {
  final GetAllMovies _getAllMovies;
  AllMoviesNotifier(this._getAllMovies) : super(const AsyncValue.loading()) {
    getAllMovies();
  }

  Future<void> getAllMovies() async {
    final allMovies = await _getAllMovies();
    return allMovies.fold(
      (error) {
        state = AsyncValue.error(error, StackTrace.current);
      },
      (data) {
        Future.delayed(Duration(seconds: 2)).then((_) {
          state = AsyncValue.data(data);
        });
      },
    );
  }
}

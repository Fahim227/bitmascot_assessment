import 'package:bitmascot_assessment/features/favorite_movies/data/model/movie_local_model.dart';
import 'package:get_it/get_it.dart';
import 'package:hive/hive.dart';
import 'package:injectable/injectable.dart';

import 'di.config.dart';

final sl = GetIt.instance;

@InjectableInit()
Future<void> configureDependencies() async {
  sl.init();

  // local sotrage
  final postBox = await Hive.openBox<MovieLocalModel>('movies');
  sl.registerSingleton<Box<MovieLocalModel>>(postBox);
}

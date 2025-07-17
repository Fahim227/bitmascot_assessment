import 'package:bitmascot_assessment/core/models/flavor_config.dart';
import 'package:bitmascot_assessment/features/favorite_movies/data/model/movie_local_model.dart';
import 'package:bitmascot_assessment/features/favorite_movies/presentation/bloc/favorite_movie_cubit.dart';
import 'package:bitmascot_assessment/features/favorite_movies/presentation/pages/favorite_movies.dart';
import 'package:bitmascot_assessment/features/login/presentation/bloc/login_cubit.dart';
import 'package:bitmascot_assessment/features/login/presentation/pages/login_page.dart';
import 'package:bitmascot_assessment/features/movie_details/presentation/bloc/movie_details_cubit.dart';
import 'package:bitmascot_assessment/features/movie_details/presentation/pages/movie_details_page.dart';
import 'package:bitmascot_assessment/features/movies/domain/entity/movie_entity.dart';
import 'package:bitmascot_assessment/features/movies/presentation/bloc/all_movies_cubit.dart';
import 'package:bitmascot_assessment/features/movies/presentation/pages/all_movies.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart';

import 'core/di/di.dart';
import 'core/theme/app_theme.dart';

const String apiUrl = String.fromEnvironment('API_URL');

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final appDocDir = await getApplicationDocumentsDirectory();
  Hive.init(appDocDir.path);
  Hive.registerAdapter(MovieLocalModelAdapter());
  FlavorConfig.initialize(flavor: Flavor.dev, baseUrl: apiUrl);
  await configureDependencies();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.translucent,
      onTapDown: (details) {
        final tappedContext = FocusManager.instance.primaryFocus?.context;
        debugPrint("Tapped widget: $tappedContext");
      },
      child: MaterialApp(
        title: 'Bitmascot Assessment',
        theme: AppTheme.themeData,
        initialRoute: '/',
        routes: {
          '/': (context) => BlocProvider(
            create: (context) => sl.get<LoginCubit>(),
            child: const LoginPage(),
          ),
          '/all_movies': (context) => BlocProvider(
            create: (context) => sl.get<AllMoviesCubit>()..getAllMovies(),
            child: const AllMovies(),
          ),
          '/favorite_movies': (context) => BlocProvider(
            create: (context) =>
                sl.get<FavoriteMovieCubit>()..getAllFavoriteMovies(),
            child: const FavoriteMovies(),
          ),
        },
        onGenerateRoute: (settings) {
          if (settings.name!.startsWith('/details')) {
            final movie = settings.arguments as MovieEntity;

            return MaterialPageRoute(
              builder: (_) => BlocProvider(
                create: (context) => sl.get<MovieDetailsCubit>(),
                child: MovieDetailsPage(movie: movie),
              ),
            );
          }
          return null;
        },
      ),
    );
  }
}

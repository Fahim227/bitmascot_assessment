import 'package:bitmascot_assessment/core/models/flavor_config.dart';
import 'package:bitmascot_assessment/features/login/presentation/bloc/login_cubit.dart';
import 'package:bitmascot_assessment/features/login/presentation/pages/login_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'core/di/di.dart';
import 'core/theme/app_theme.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  FlavorConfig.initialize(
    flavor: Flavor.dev,
    baseUrl: 'https://jsonplaceholder.typicode.com',
  );
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
        },
      ),
    );
  }
}

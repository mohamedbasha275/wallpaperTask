import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wallpaper_app/core/bloc_observer/bloc_observer.dart';
import 'package:wallpaper_app/core/di/service_locator.dart';
import 'package:wallpaper_app/core/resources/app_constants.dart';
import 'package:wallpaper_app/core/resources/app_routers.dart';
import 'package:wallpaper_app/core/resources/theme_manager.dart';
import 'package:wallpaper_app/features/business_logic/wallpapers/wallpapers_cubit.dart';
import 'package:wallpaper_app/features/data/repositories/wallpapers_repo.dart';
import 'package:wallpaper_app/features/presentation/views/home/home_screen.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await setupServiceLocator();
  Bloc.observer = MyBlocObserver();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => WallpapersCubit(getIt.get<WallpapersRepoImpl>())..fetchLastWallpapers(),
        ),
      ],
      child: MaterialApp(
        title: AppConstants.appName,
        debugShowCheckedModeBanner: false,
        theme: getApplicationTheme(),
        home: const HomeScreen(),
        onGenerateRoute: RouteGenerator.getRoute,
      ),
    );
  }
}

import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:wallpaper_app/core/dio/api_service.dart';
import 'package:wallpaper_app/core/shared_preferences/app_prefs.dart';
import 'package:wallpaper_app/features/data/repositories/favourites_repo.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:wallpaper_app/features/data/repositories/wallpapers_repo.dart';

final getIt = GetIt.instance;

Future<void> setupServiceLocator() async {
  // Dio instance
  getIt.registerSingleton<Dio>(Dio());
  // ApiService instance
  getIt.registerSingleton<ApiService>(ApiService(getIt.get<Dio>()));
  // SharedPreferences instance
  final sharedPrefs = await SharedPreferences.getInstance();
  getIt.registerSingleton<SharedPreferences>(sharedPrefs);
  // AppPreferences instance
  getIt.registerSingleton<AppPreferences>(
    AppPreferences(getIt.get<SharedPreferences>()),
  );
  // WallpapersRepoImpl
  getIt.registerSingleton<WallpapersRepoImpl>(WallpapersRepoImpl(getIt.get<ApiService>()));
  // FavouritesRepoImpl
  getIt.registerSingleton<FavouritesRepoImpl>(FavouritesRepoImpl(getIt.get<ApiService>()));
}

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wallpaper_app/core/di/service_locator.dart';
import 'package:wallpaper_app/features/business_logic/favourites/favourite_cubit.dart';
import 'package:wallpaper_app/features/business_logic/search/search_cubit.dart';
import 'package:wallpaper_app/features/data/models/wallpaper_model.dart';
import 'package:wallpaper_app/features/data/repositories/favourites_repo.dart';
import 'package:wallpaper_app/features/data/repositories/wallpapers_repo.dart';
import 'package:wallpaper_app/features/presentation/views/favourites/favourites_screen.dart';
import 'package:wallpaper_app/features/presentation/views/home/home_screen.dart';
import 'package:wallpaper_app/features/presentation/views/search/search_screen.dart';
import 'package:wallpaper_app/features/presentation/views/show_wallpaper_details/wallpaper_details_screen.dart';

class Routes {
  static const String home = "/homeScreen";
  static const String showWallpaperDetails = "/showWallpaperDetails";
  static const String searchScreen = "/searchScreen";
  static const String favouritesScreen = "/favouritesScreen";
}

class RouteGenerator {
  static Route<dynamic> getRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.home:
        return MaterialPageRoute(builder: (_) => const HomeScreen());
      case Routes.showWallpaperDetails:
        final wallpaper = settings.arguments as WallpaperModel;
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (context) =>
                FavouritesCubit(getIt.get<FavouritesRepoImpl>()),
            child: WallpaperDetailsScreen(wallpaper: wallpaper),
          ),
        );
      case Routes.searchScreen:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (context) => SearchCubit(getIt.get<WallpapersRepoImpl>())
              ..searchWallpapers(''),
            child: const SearchScreen(), // to send model when navigate
          ),
        );
      case Routes.favouritesScreen:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (context) =>
                FavouritesCubit(getIt.get<FavouritesRepoImpl>())
                  ..fetchFavourites(),
            child: const FavouritesScreen(), // to send model when navigate
          ),
        );
      default:
        return _buildUndefinedRoute();
    }
  }

  static Route<dynamic> _buildUndefinedRoute() {
    return MaterialPageRoute(
      builder: (_) => Scaffold(
        appBar: AppBar(
          title: const Text('No route'),
        ),
        body: const Center(child: Text('No route')),
      ),
    );
  }
}

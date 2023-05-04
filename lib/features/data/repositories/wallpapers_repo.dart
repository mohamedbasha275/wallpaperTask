import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:wallpaper_app/core/dio/api_service.dart';
import 'package:wallpaper_app/core/dio/end_points.dart';
import 'package:wallpaper_app/core/errors/failures.dart';
import 'package:wallpaper_app/features/data/models/wallpaper_model.dart';

abstract class WallpapersRepo {
  Future<Either<Failure, List<WallpaperModel>>> fetchLastWallpapers();
  Future<Either<Failure, List<WallpaperModel>>> searchWallpapers({query});
}

class WallpapersRepoImpl implements WallpapersRepo {
  final ApiService apiService;
  WallpapersRepoImpl(this.apiService);
  @override
  Future<Either<Failure, List<WallpaperModel>>> fetchLastWallpapers() async {
    try {
      var data = await apiService.get(endpoint: Endpoint.lastWallpapers);
      List<WallpaperModel> wallpapers = [];
      for (var item in data['photos']) {
        wallpapers.add(WallpaperModel.fromJson(item));
      }
      return right(wallpapers);
    } catch (e) {
      if (e is DioError) {
        return left(ServerFailure.fromDioError(e));
      }
      return left(ServerFailure(e.toString()));
    }
  }
  @override
  Future<Either<Failure, List<WallpaperModel>>> searchWallpapers({query}) async {
    try {
      var data = await apiService.get(endpoint: Endpoint.search,parameter: '?query=$query&per_page=30&page=1');
      List<WallpaperModel> wallpapers = [];
      for (var item in data['photos']) {
        wallpapers.add(WallpaperModel.fromJson(item));
      }
      return right(wallpapers);
    } catch (e) {
      if (e is DioError) {
        return left(ServerFailure.fromDioError(e));
      }
      return left(ServerFailure(e.toString()));
    }
  }
}
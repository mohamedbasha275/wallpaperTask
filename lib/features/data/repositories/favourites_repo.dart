import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:sqflite/sqflite.dart';
import 'package:wallpaper_app/core/dio/api_service.dart';
import 'package:wallpaper_app/core/errors/failures.dart';
import 'package:wallpaper_app/features/data/models/wallpaper_model.dart';

abstract class FavouritesRepo {
  Future<Either<Failure, List<WallpaperModel>>> fetchFavourites();

  Future<Either<Failure, String>> addFavourites({WallpaperModel wallpaper});
  Future<Either<Failure, String>> removeFavourite({int id});
  Future<List<int>> favouriteList();
}

class FavouritesRepoImpl implements FavouritesRepo {
  final ApiService apiService;

  FavouritesRepoImpl(this.apiService);

  String dbName = 'wallpaper.db';
  String columnName = 'favourites';
  Future<Database> get _database async {
    return await openDatabase(
      dbName,
      version: 1,
      onCreate: (database, version) {
       // print('database created');
        database
            .execute('CREATE TABLE $columnName (id INTEGER, tinyImage TEXT,largeImage TEXT,photographer TEXT)')
            .then((value) {
        //  print('table created');
        }).catchError((error) {
      //    print('Error When Creating Table ${error.toString()}');
        });
      },
      onOpen: (database) {
       // print('database opened');
      },
    );
  }
  //
  @override
  Future<List<int>> favouriteList() async{
    final db = await _database;
    final List<Map<String, dynamic>> maps = await db.query(columnName);
    List<int> favouritesList = [];
    for (var item in maps) {
      favouritesList.add(item['id']);
    }
    return favouritesList;
  }

  @override
  Future<Either<Failure, List<WallpaperModel>>> fetchFavourites() async {
    try {
      final db = await _database;
      final List<Map<String, dynamic>> maps = await db.query(columnName);
      List<WallpaperModel> favourites = [];
      for (var item in maps) {
        final wallpaper = WallpaperModel.fromJson(item,isFavourite: true);
        favourites.add(wallpaper);
      }
      return right(favourites);
    } catch (e) {
      if (e is DioError) {
        return left(ServerFailure.fromDioError(e));
      }
      return left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, String>> addFavourites(
      {WallpaperModel? wallpaper}) async {
    try {
      final db = await _database;
      final list = await favouriteList();
      if(list.contains(wallpaper!.id)){
        return Left(ServerFailure('This wallpaper already added'));
      }else{
        await db.insert(columnName, {
          'id': wallpaper.id,
          'tinyImage': wallpaper.tinyImage,
          'largeImage': wallpaper.largeImage,
          'photographer': wallpaper.photographer
        });
        return const Right('Add favourite successfully');
      }
    } catch (e) {
      if (e is DioError) {
        return left(ServerFailure.fromDioError(e));
      }
      return left(ServerFailure(e.toString()));
    }
  }
  @override
  Future<Either<Failure, String>> removeFavourite({int? id}) async {
    try {
      final db = await _database;
      await db.delete(columnName, where: 'id = ?', whereArgs: [id]);
      return const Right('Remove favourite successfully');
    } catch (e) {
      if (e is DioError) {
        return left(ServerFailure.fromDioError(e));
      }
      return left(ServerFailure(e.toString()));
    }
  }
}

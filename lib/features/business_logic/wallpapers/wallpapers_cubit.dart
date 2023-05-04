import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:wallpaper_app/features/data/models/wallpaper_model.dart';
import 'package:wallpaper_app/features/data/repositories/wallpapers_repo.dart';

part 'wallpaper_state.dart';

class WallpapersCubit extends Cubit<WallpapersState> {
  final WallpapersRepo wallpapersRepo;
  WallpapersCubit(this.wallpapersRepo) : super(WallpapersInitial());
  // fetch Last Wallpapers
  Future<void> fetchLastWallpapers() async {
    emit(WallpapersLoading());
    var result = await wallpapersRepo.fetchLastWallpapers();
    result.fold((failure) {
      emit(WallpapersFailure(failure.errorMessage));
    }, (wallpapers) {
      if (wallpapers.isEmpty) {
        emit(WallpapersEmpty());
      } else {
        emit(WallpapersSuccess(wallpapers));
      }
    });
  }
}

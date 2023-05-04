import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:wallpaper_app/features/data/models/wallpaper_model.dart';
import 'package:wallpaper_app/features/data/repositories/wallpapers_repo.dart';
part 'search_state.dart';

class SearchCubit extends Cubit<SearchState> {
  final WallpapersRepo wallpapersRepo;
  SearchCubit(this.wallpapersRepo) : super(SearchInitial());
  // fetch Last Wallpapers
  Future<void> searchWallpapers(String query) async {
    emit(SearchLoading());
    var result = await wallpapersRepo.searchWallpapers(query: query);
    result.fold((failure) {
      emit(SearchFailure(failure.errorMessage));
    }, (wallpapers) {
      if (wallpapers.isEmpty) {
        emit(SearchEmpty());
      } else {
        emit(SearchSuccess(wallpapers));
      }
    });
  }
}

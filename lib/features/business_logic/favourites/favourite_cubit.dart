import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:wallpaper_app/features/data/models/wallpaper_model.dart';
import 'package:wallpaper_app/features/data/repositories/favourites_repo.dart';
part 'favourite_state.dart';

class FavouritesCubit extends Cubit<FavouritesState> {
  final FavouritesRepo favouritesRepo;
  FavouritesCubit(this.favouritesRepo) : super(FavouritesInitial());

  // fetch Favourites
  Future<void> fetchFavourites() async {
    emit(FavouritesLoading());
    var result = await favouritesRepo.fetchFavourites();
    result.fold((failure) {
      emit(FavouritesFailure(failure.errorMessage));
    }, (favourites) {
      if (favourites.isEmpty) {
        emit(FavouritesEmpty());
      } else {
        emit(FavouritesSuccess(favourites));
      }
    });
  }
  // fetch Favourites
  Future<bool> isFavourite({required int id}) async {
    emit(FavouritesLoading());
    var result = await favouritesRepo.favouriteList();
    return result.contains(id);
  }
  // addToFavourites
  Future<void> addFavourites({required WallpaperModel wallpaper}) async {
    var result = await favouritesRepo.addFavourites(wallpaper: wallpaper);
    result.fold((failure) {
      emit(AddFavouritesFailure(failure.errorMessage));
    }, (favourites) {
      emit(AddFavourites(favourites));
    });
  }
  Future<void> removeFavourites({required int id}) async {
    //emit(FavouritesLoading());
    var result = await favouritesRepo.removeFavourite(id: id);
    result.fold((failure) {
      //emit(FavouritesFailure(failure.errorMessage));
    }, (favourites) {
     fetchFavourites();
     emit(RemoveFavourites());
      // if (favourites.isEmpty) {
      //   emit(FavouritesEmpty());
      // } else {
      //   emit(FavouritesSuccess('favourites'));
      // }
    });
  }
}

part of 'favourite_cubit.dart';
@immutable
abstract class FavouritesState {
  const FavouritesState();
}

class FavouritesInitial extends FavouritesState {}
class FavouritesLoading extends FavouritesState {}
class FavouritesEmpty extends FavouritesState {}
class FavouritesFailure extends FavouritesState {
  final String errorMessage;
  const FavouritesFailure(this.errorMessage);
}
class FavouritesSuccess extends FavouritesState {
  final List<WallpaperModel> wallpapers;
  const FavouritesSuccess(this.wallpapers);
}

class AddFavouritesFailure extends FavouritesState {
  final String message;
  const AddFavouritesFailure(this.message);
}
class AddFavourites extends FavouritesState {
  final String message;
  const AddFavourites(this.message);
}
class RemoveFavourites extends FavouritesState {}

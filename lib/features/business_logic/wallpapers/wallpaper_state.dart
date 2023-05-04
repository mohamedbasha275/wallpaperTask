part of 'wallpapers_cubit.dart';
@immutable
abstract class WallpapersState {
  const WallpapersState();
}

class WallpapersInitial extends WallpapersState {}
class WallpapersLoading extends WallpapersState {}
class WallpapersEmpty extends WallpapersState {}
class WallpapersFailure extends WallpapersState {
  final String errorMessage;
  const WallpapersFailure(this.errorMessage);
}
class WallpapersSuccess extends WallpapersState {
  final List<WallpaperModel> wallpapers;
  const WallpapersSuccess(this.wallpapers);
}


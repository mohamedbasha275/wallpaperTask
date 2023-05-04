part of 'search_cubit.dart';
@immutable
abstract class SearchState {
  const SearchState();
}

class SearchInitial extends SearchState {}
class SearchLoading extends SearchState {}
class SearchEmpty extends SearchState {}
class SearchFailure extends SearchState {
  final String errorMessage;
  const SearchFailure(this.errorMessage);
}
class SearchSuccess extends SearchState {
  final List<WallpaperModel> wallpapers;
  const SearchSuccess(this.wallpapers);
}


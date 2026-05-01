part of 'fav_cubit.dart';

sealed class FavState {}

class FavInitial extends FavState {}

class FavLoading extends FavState {}

class FavLoaded extends FavState {
  final Set<String> favs;
  FavLoaded(this.favs);
}

class FavError extends FavState {
  final String message;
  FavError(this.message);
}
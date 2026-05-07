import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:grocify/features/products_&_fav/domain/repo/fav_repo.dart';

part 'fav_state.dart';

class FavCubit extends Cubit<FavState> {
  final FavRepo favRepo;
  final String userId;

  FavCubit({required this.favRepo, required this.userId}) : super(FavInitial());

  Set<String> _favs = {};

  Future<void> loadFav() async {
    emit(FavLoading());

    final result = await favRepo.loadFav(userId);

    result.fold(
      (failure) => emit(FavError(failure.message)),
      (favs) {
        _favs = favs;
        emit(FavLoaded(favs));
      },
    );
  }
  
  Future<void> toggleFav(String productId) async {
    
    final originalFavs = Set<String>.from(_favs);

    // Optimistic update
    final updatedFavs = Set<String>.from(_favs);

    if (updatedFavs.contains(productId)) {
      updatedFavs.remove(productId);
    } else {
      updatedFavs.add(productId);
    }

    _favs = updatedFavs;
    emit(FavLoaded(updatedFavs));

    final result = await favRepo.toggleFav(productId, originalFavs, userId);

    result.fold(
      (failure) {
        _favs = originalFavs; // revert
        emit(FavLoaded(originalFavs));
        emit(FavError(failure.message));
      },
      (_) => null, // already updated optimistically
    );
  }

  bool isFav(String productId) => _favs.contains(productId);
}

import 'package:dartz/dartz.dart';
import 'package:grocify/core/errors/failures.dart';

abstract class FavRepo {
  Future<Either<Failure, Set<String>>> loadFav(String userId);

  Future<Either<Failure ,void>> toggleFav(String productId, Set<String> favs, String userId);
}

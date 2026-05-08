import 'package:dartz/dartz.dart';
import 'package:grocify/core/errors/failures.dart';

abstract class CartRepo {
  Future<Either<Failure, Set<String>>> loadCart(String userId);
  Future<Either<Failure, void>> addToCart(String productId, String userId);
  Future<Either<Failure, void>> removeFromCart(String productId, String userId);
  Future<Either<Failure, void>> clearCart(String userId);
}

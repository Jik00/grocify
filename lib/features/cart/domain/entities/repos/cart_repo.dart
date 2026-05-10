import 'package:dartz/dartz.dart';
import 'package:grocify/core/errors/failures.dart';
import 'package:grocify/features/cart/domain/entities/all_cart_entity.dart';

abstract class CartRepo {
  Future<Either<Failure, AllCartEntity>> loadCart(String userId);
  Future<Either<Failure, void>> addToCart(String productId, String userId, int quantity);
  Future<Either<Failure, void>> updateCart(String productId, String userId, int quantity);
  Future<Either<Failure, void>> removeFromCart(String productId, String userId);
  Future<Either<Failure, void>> clearCart(String userId);
}

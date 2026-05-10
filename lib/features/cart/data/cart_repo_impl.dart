import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:grocify/core/data_sources/supa_data_source.dart';
import 'package:grocify/core/entities/product_entity.dart';
import 'package:grocify/core/errors/failures.dart';
import 'package:grocify/core/utils/constants.dart';
import 'package:grocify/features/cart/domain/entities/all_cart_entity.dart';
import 'package:grocify/features/cart/domain/entities/cart_item_entity.dart';
import 'package:grocify/features/cart/domain/entities/repos/cart_repo.dart';

class CartRepoImpl extends CartRepo {
  final SupabaseDataSource supabaseDataSource;

  CartRepoImpl({required this.supabaseDataSource});

  @override
  Future<Either<Failure, void>> addToCart(
      String productId, String userId) async {
    try {
      log("adding to cart");
      await supabaseDataSource.addData(
          tableName: kSupaCartTable,
          data: {kUserIdQuery: userId, kProductIdQuery: productId});
      return const Right(null);
    } catch (e) {
      log("error adding to cart $e");
      return Left(ServerFailure('Failed to add to cart: ${e.toString()}'));
    }
  }

  @override
  Future<Either<Failure, void>> clearCart(String userId) async {
    try {
      log("clearing cart");
      await supabaseDataSource.deleteData(
          tableName: kSupaCartTable, query: kUserIdQuery, value: userId);
      return const Right(null);
    } catch (e) {
      log("error clearing cart $e");
      return Left(ServerFailure('Failed to clear cart: ${e.toString()}'));
    }
  }

  @override
  Future<Either<Failure, AllCartEntity>> loadCart(String userId) async {
    try {
      log("loading cart");
      final response = await supabaseDataSource.fetchDataBy(
          tableName: kSupaCartTable, query: kUserIdQuery, value: userId);

      final Map<String, ProductEntity> productsMap = {
        for (final p in productsEntities) p.id: p,
      };

      final cartItems = response.map((row) {
        final productId = row[kProductIdQuery] as String;
        final product = productsMap[productId];
        final quantity = row[kQuantityQuery] as int;

        if (product == null) return null;

        return CartItemEntity(
          product: product,
          count: quantity,
        );
      }).whereType<CartItemEntity>().toList();

      log("fetched ${cartItems.length} cartItems cart items");


      return Right(AllCartEntity(cartItems: cartItems));
    } catch (e) {
      log("error loading cart $e");
      return Left(ServerFailure('Failed to load cart: ${e.toString()}'));
    }
  }

  @override
  Future<Either<Failure, void>> removeFromCart(
      String productId, String userId) async {
    try {
      log("removing from cart");
      await supabaseDataSource.deleteData(
          tableName: kSupaCartTable,
          query: kUserIdQuery,
          value: userId,
          query2: kProductIdQuery,
          value2: productId);
      return const Right(null);
    } catch (e) {
      log("error removing from cart $e");
      return Left(ServerFailure('Failed to remove from cart: ${e.toString()}'));
    }
  }

  @override
  Future<Either<Failure, void>> updateCart(
      String productId, String userId, int quantity) async {
    try {
      log("updating cart");
      await supabaseDataSource.updataData(
          tableName: kSupaCartTable,
          query: kUserIdQuery,
          value: userId,
          query2: kProductIdQuery,
          value2: productId,
          newData: {kQuantityQuery: quantity});
      return const Right(null);
    } catch (e) {
      log("error updating cart $e");
      return Left(ServerFailure('Failed to update cart: ${e.toString()}'));
    }
  }
}

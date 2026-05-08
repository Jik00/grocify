import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:grocify/core/data_sources/supa_data_source.dart';
import 'package:grocify/core/errors/failures.dart';
import 'package:grocify/core/utils/constants.dart';
import 'package:grocify/features/cart/domain/entities/repos/cart_repo.dart';

class CartRepoImpl extends CartRepo {
  final SupabaseDataSource supabaseDataSource;

  CartRepoImpl({required this.supabaseDataSource});

  @override
  Future<Either<Failure, void>> addToCart(String productId, String userId)  async{
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
  Future<Either<Failure, Set<String>>> loadCart(String userId) async {
    try {
      log("loading cart");
      final response = await supabaseDataSource.fetchDataBy(
          tableName: kSupaCartTable, query: kUserIdQuery, value: userId);

      final cart = response.map((e) => e[kProductIdQuery] as String).toSet();

      log("fetched ${cart.length} cart items");
      return Right(cart);
    } catch (e) {
      log("error loading cart $e");
      return Left(ServerFailure('Failed to load cart: ${e.toString()}'));
    }
  }

  @override
  Future<Either<Failure, void>> removeFromCart(String productId, String userId) async {
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
  Future<Either<Failure, void>> updateCart(String productId, String userId, String quantity) async {
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
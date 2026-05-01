import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:grocify/core/data_sources/supa_data_source.dart';
import 'package:grocify/core/errors/failures.dart';
import 'package:grocify/core/utils/constants.dart';
import 'package:grocify/core/utils/globals.dart';
import 'package:grocify/features/products_&_fav/domain/repo/fav_repo.dart';

class FavRepoImpl implements FavRepo {
  final SupabaseDataSource supabaseDataSource;

  FavRepoImpl({required this.supabaseDataSource});

  @override
  Future<Either<Failure, Set<String>>> loadFav() async {
    if (globalUserId == null) {
      return Left(ServerFailure('User id is null'));
    }

    try {
      log("loading favs");
      final response = await supabaseDataSource.fetchDataBy(
          tableName: kSupaFavTable, query: kUserIdQuery, value: globalUserId!);

      final favs = response.map((e) => e[kProductIdQuery] as String).toSet();

      log("fetched ${favs.length} favs");
      return Right(favs);
    } catch (e) {
      log("error loading favs $e");
      return Left(ServerFailure('Failed to load favs: ${e.toString()}'));
    }
  }

  @override
  Future<Either<Failure, void>> toggleFav(
      String productId, Set<String> favs) async {

    if (globalUserId == null) {
      return Left(ServerFailure('User id is null'));
    }

    try {
      log( favs.contains(productId) ? "removing" : "adding");
      
      if (favs.contains(productId)) {
        await supabaseDataSource.deleteData(
          tableName: kSupaFavTable,
          query: kUserIdQuery,
          value: globalUserId!,
          query2: kProductIdQuery,
          value2: productId,
        );
      } else {
        await supabaseDataSource.addData(
            tableName: kSupaFavTable,
            data: {kUserIdQuery: globalUserId!, kProductIdQuery: productId});
      }
    } catch (e) {
      log("error toggling fav $e");
      return Left(ServerFailure('Failed to toggle fav: ${e.toString()}'));
    }

    return const Right(null);
  }
}

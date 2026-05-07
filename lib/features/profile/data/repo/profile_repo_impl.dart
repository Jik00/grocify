import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:grocify/core/data_sources/supa_data_source.dart';
import 'package:grocify/core/errors/failures.dart';
import 'package:grocify/core/utils/constants.dart';
import 'package:grocify/features/profile/data/datasource/hive_profile_datasource.dart';
import 'package:grocify/features/profile/domain/entities/profile_entity.dart';
import 'package:grocify/features/profile/domain/repo/profile_repo.dart';

class ProfileRepoImpl extends ProfileRepo {
  final SupabaseDataSource supabaseDataSource;
  final HiveProfileDataSource _localDataSource;

  ProfileRepoImpl(
      {required this.supabaseDataSource,
      required HiveProfileDataSource localDataSource})
      : _localDataSource = localDataSource;


    @override
    Future<Either<Failure, ProfileEntity>> getProfile(String userId) async {
    try {
      log("Fetching profile for userId: $userId");

      final data = await supabaseDataSource.fetchSingleById(
          tableName: kSupaProfilesTable, id: userId);

      await _localDataSource.cacheProfile(ProfileEntity.fromMap(data));

      return Right( ProfileEntity.fromMap(data));
    } catch (e) {
      log("Error fetching profile: $e");
      return Left(CustomException("Failed to fetch profile"));
    }
  }

  @override
  Future<Either<Failure, ProfileEntity>> getCachedProfile(String userId) async {
    try {
      final profile = await _localDataSource.getCachedProfile(userId);
      return Right(profile);
    } catch (e) {
      return Left(CustomException("No cached profile found"));
    }
  }
}

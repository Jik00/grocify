import 'package:dartz/dartz.dart';
import 'package:grocify/core/errors/failures.dart';
import 'package:grocify/features/profile/domain/entities/profile_entity.dart';

abstract class ProfileRepo {
  Future<Either<Failure, ProfileEntity>> getProfile(String userId);

  Future<Either<Failure, ProfileEntity>> getCachedProfile(String userId);
}

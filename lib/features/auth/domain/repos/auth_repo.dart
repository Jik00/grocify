import 'package:dartz/dartz.dart';
import 'package:grocify/core/errors/failures.dart';
import 'package:grocify/features/auth/domain/entities/user_entity.dart';

abstract class AuthRepo {
  Future<Either<Failure, UserEntity>> createUserWithEmail(
      String email, String password, String username);

  Future<Either<Failure, UserEntity>> signInWithEmailAndPassword(
      String email, String password);

  Future<Either<Failure, void>> signInWithGoogle();

  Future<Either<Failure, void>> signInWithFacebook();

  Stream<UserEntity?> authStateChanges();
}

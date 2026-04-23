import 'dart:developer';
import 'package:dartz/dartz.dart';
import 'package:grocify/core/errors/cutoms_exception.dart';
import 'package:grocify/core/errors/failures.dart';
import 'package:grocify/features/auth/data/models/user_model.dart';
import 'package:grocify/features/auth/domain/entities/user_entity.dart';
import 'package:grocify/features/auth/domain/repos/auth_repo.dart';

import '../../../../core/services/get_it_service.dart';
import '../../../../core/services/supabase_auth_service.dart';

class AuthRepoImpl extends AuthRepo {
  final SupabaseAuthService supabaseAuthService;

  AuthRepoImpl(
      {required this.supabaseAuthService});

  @override
  Future<Either<Failure, UserEntity>> createUserWithEmail(
      String email, String password, String username) async {
    try {


      final user = await supabaseAuthService.signUpWithEmail(
          email: email, password: password, username: username);


      return Right(UserModel.fromSupabaseUser(user));

    } on CustomException catch (e) {
      return Left(ServerFailure(e.message));
    } catch (e) {
      log('Error in AuthRepoImpl.createUserWithEmail: $e');
      return Left(
        ServerFailure('just in case we added more logic in the future'),
      );
    }
  }

  @override
  Future<Either<Failure, UserEntity>> signInWithEmailAndPassword(
      String email, String password) async {
    try {

      final user = await supabaseAuthService.signInWithEmail(
          email: email, password: password);

      return Right(UserModel.fromSupabaseUser(user)); 

    } on CustomException catch (e) {
      return Left(ServerFailure(e.message));
    } catch (e) {
      log('Error in AuthRepoImpl.signInWithEmailAndPassword ${e.toString()}');
      return Left(
        ServerFailure('just in case we added more logic in the future'),
      );
    }
  }
  
  @override
  Future<Either<Failure, void>> signInWithGoogle() async {
    try {
      await supabaseAuthService.signInWithGoogle();

      return const Right(null);

    } on CustomException catch (e) {
      return Left(ServerFailure(e.message));
    } catch (e) {
      log('Error in AuthRepoImpl.signInWithGoogle ${e.toString()}');
      return Left(
        ServerFailure('just in case we added more logic in the future'),
      );
    }
  }

  @override
  Future<Either<Failure, void>> signInWithFacebook() async {
    try {
      await supabaseAuthService.signInWithFacebook();

      return const Right(null);

    } on CustomException catch (e) {
      return Left(ServerFailure(e.message));
    } catch (e) {
      log('Error in AuthRepoImpl.signInWithGoogle ${e.toString()}');
      return Left(
        ServerFailure('just in case we added more logic in the future'),
      );
    }
  }


  @override
  Stream<UserEntity?> authStateChanges() {
    return supabase.auth.onAuthStateChange.map((data) {
      final session = data.session;
      if (session == null) return null;

      return UserModel.fromSupabaseUser(session.user);
    });
  }

}

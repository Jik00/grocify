import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:grocify/features/auth/domain/entities/user_entity.dart';
import 'package:grocify/features/auth/domain/repos/auth_repo.dart';

part 'signin_state.dart';

class SignInCubit extends Cubit<SignInState> {
  SignInCubit(this.authRepo) : super(SignInInitial()) {
    // Listen to auth state changes
    authRepo.authStateChanges().listen((user) {
      if (user != null) {
        emit(SignInSuccess(user: user));
      } else {
        emit(SignInInitial());
      }
    });
  }

  final AuthRepo authRepo;

  Future<void> signInWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    emit(SignInLoading());

    final result = await authRepo.signInWithEmailAndPassword(email, password);

    result.fold(
      (failure) => emit(SignInFailure(message: failure.message)),
      (_) {
        // Do nothing — wait for authStateChanges to emit SignInSuccess
      },
    );
  }

  Future<void> signInWithGoogle() async {
    emit(SignInLoading());

    final result = await authRepo.signInWithGoogle();

    result.fold(
      (failure) => emit(SignInFailure(message: failure.message)),
      (_) {
        // Do nothing — user will be emitted via authStateChanges stream
      },
    );
  }

  Future<void> signInWithFacebook() async {
    emit(SignInLoading());

    final result = await authRepo.signInWithFacebook();

    result.fold(
      (failure) => emit(SignInFailure(message: failure.message)),
      (_) {
        // Do nothing — user will be emitted via authStateChanges stream
      },
    );
  }

}

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:grocify/features/auth/domain/entities/user_entity.dart';
import 'package:grocify/features/auth/domain/repos/auth_repo.dart';

part 'signup_state.dart';

class SignupCubit extends Cubit<SignupState> {
  SignupCubit({required this.authRepo}) : super(SignupInitial());

  final AuthRepo authRepo;

  Future<void> createUserWithEmailAndPassword(
      {required String email,
      required String password,
      required String username}) async {
    emit(SignupLoading());

    final result =
        await authRepo.createUserWithEmail(email, password, username);

    result.fold(
      (failure) => emit(SignupFailure(failure.message)),
      (user) => emit(SignupSuccess(user: user)),
    );
  }
}

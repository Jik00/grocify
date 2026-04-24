import 'package:grocify/features/auth/domain/repos/auth_repo.dart';

class CheckAuthStatusUseCase {
  CheckAuthStatusUseCase(this.authRepo);

    final AuthRepo authRepo;

  // Returns a stream of auth status changes
  Stream<AuthStatus> execute() {
    return authRepo.authStateChanges().map((user) {
      if (user != null) {
        return AuthStatus.authenticated;
      } else {
        return AuthStatus.unauthenticated;
      }
    });
  }
}

// Simple enum for auth status
enum AuthStatus {
  authenticated,
  unauthenticated,
  unknown,
}
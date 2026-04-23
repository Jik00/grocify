import 'package:grocify/core/errors/failures.dart';
import 'package:grocify/generated/l10n.dart';

CustomException handleAuthErrorMessage( String code) {

  switch (code) {
    case 'weak-password':
      return CustomException(S().weakPassword);

    case 'network-request-failed':
      return CustomException(S().networkRequestFailed);

    case 'email-already-in-use':
      return CustomException(S().emailAlreadyInUse);

    case 'invalid-email':
      return CustomException(S().invalidEmail);

    case 'invalid_credentials':
      return CustomException(S().invalidCredential);

    case 'user-not-found':
      return CustomException(S().userNotFound);

    case 'wrong-password':
      return CustomException(S().wrongPassword);

    default:
      return CustomException(S().defaultAuthError);
  }
}
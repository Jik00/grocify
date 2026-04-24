import 'package:flutter/foundation.dart';
import 'package:grocify/features/auth/domain/usecases/check_auth_status.dart';

class AuthController extends ChangeNotifier {
  final CheckAuthStatusUseCase _checkAuthStatusUseCase;
  AuthStatus _status = AuthStatus.unknown;

  AuthController(this._checkAuthStatusUseCase) {
    _listenToAuthChanges();
  }

  AuthStatus get status => _status;
  bool get isAuthenticated => _status == AuthStatus.authenticated;
  bool get isUnauthenticated => _status == AuthStatus.unauthenticated;
  bool get isUnknown => _status == AuthStatus.unknown;

  void _listenToAuthChanges() {
    _checkAuthStatusUseCase.execute().listen((status) {
      _status = status;
      notifyListeners();
    });
  }
  
}
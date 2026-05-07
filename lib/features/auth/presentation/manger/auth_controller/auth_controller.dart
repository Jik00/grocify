import 'package:flutter/foundation.dart';
import 'package:grocify/features/auth/domain/usecases/check_auth_status.dart';
import 'package:grocify/features/profile/domain/repo/profile_repo.dart';
import 'package:grocify/features/profile/domain/entities/profile_entity.dart';

class AuthController extends ChangeNotifier {
  final CheckAuthStatusUseCase _checkAuthStatusUseCase;
  final ProfileRepo _profileRepo;

  AuthStatus _status = AuthStatus.unknown;
  ProfileEntity? _currentProfile;
  String? _userId;

  AuthController(this._checkAuthStatusUseCase, this._profileRepo) {
    _listenToAuthChanges();
  }

  AuthStatus get status => _status;
  ProfileEntity? get currentProfile => _currentProfile;
  String? get userId => _userId;
  bool get isAuthenticated => _status == AuthStatus.authenticated;
  bool get isUnauthenticated => _status == AuthStatus.unauthenticated;
  bool get isUnknown => _status == AuthStatus.unknown;

  void _listenToAuthChanges() {
    _checkAuthStatusUseCase.execute().listen((status) async {
      _status = status;

      if (status == AuthStatus.authenticated) {
        await _onAuthenticated();
      } else {
        _onUnauthenticated();
      }

      notifyListeners();
    });
  }

  Future<void> _onAuthenticated() async {
    try {
      final user = await _checkAuthStatusUseCase.authRepo.getCurrentUser();
      if (user == null) return;

      _userId = user.uId;

      final result = await _profileRepo.getProfile(user.uId);
      result.fold(
        (failure) => debugPrint('Profile load failed: $failure'),
        (profile) => _currentProfile = profile,
      );
    } catch (e) {
      debugPrint('Error during auth setup: $e');
    }
  }

  void _onUnauthenticated() {
    _userId = null;
    _currentProfile = null;
  }
}
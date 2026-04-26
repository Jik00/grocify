import 'package:flutter/foundation.dart';
import 'package:grocify/features/auth/domain/usecases/check_auth_status.dart';
import 'package:grocify/features/profile/domain/repo/profile_repo.dart';
import 'package:grocify/features/profile/domain/entities/profile_entity.dart';
import 'package:grocify/core/utils/globals.dart';

class AuthController extends ChangeNotifier {
  final CheckAuthStatusUseCase _checkAuthStatusUseCase;
  final ProfileRepo _profileRepo;

  AuthStatus _status = AuthStatus.unknown;
  ProfileEntity? _currentProfile;

  AuthController(this._checkAuthStatusUseCase, this._profileRepo) {
    _listenToAuthChanges();
  }

  AuthStatus get status => _status;
  ProfileEntity? get currentProfile => _currentProfile;
  bool get isAuthenticated => _status == AuthStatus.authenticated;
  bool get isUnauthenticated => _status == AuthStatus.unauthenticated;
  bool get isUnknown => _status == AuthStatus.unknown;

  void _listenToAuthChanges() {
    _checkAuthStatusUseCase.execute().listen((status) async {
      _status = status;

      if (status == AuthStatus.authenticated) {
        final currentUser =
            await _checkAuthStatusUseCase.authRepo.getCurrentUser();
        if (currentUser != null) {
          globalUserId = currentUser.uId;
          await _loadProfile();

          // Also set profile globally
          if (_currentProfile != null) {
            globalProfile = _currentProfile;
          }
        }
      } else if (status == AuthStatus.unauthenticated) {
        globalUserId = null;
        globalProfile = null;
      }

      notifyListeners();
    });
  }

  Future<void> _loadProfile() async {
    try {
      final currentUser =
          await _checkAuthStatusUseCase.authRepo.getCurrentUser();
      if (currentUser != null) {
        final result = await _profileRepo.getProfile(currentUser.uId);
        result.fold(
          (failure) => throw ('Profile load failed: $failure'),
          (profile) {
            _currentProfile = profile;
            globalProfile = profile;
            notifyListeners();
          },
        );
      }
    } catch (e) {
      throw ('Error loading profile: $e');
    }
  }
}

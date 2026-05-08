import 'package:flutter/foundation.dart';
import 'package:grocify/features/auth/domain/usecases/check_auth_status.dart';
import 'package:grocify/features/profile/data/datasource/hive_profile_datasource.dart';
import 'package:grocify/features/profile/domain/repo/profile_repo.dart';
import 'package:grocify/features/profile/domain/entities/profile_entity.dart';

class AuthController extends ChangeNotifier {
  final CheckAuthStatusUseCase _checkAuthStatusUseCase;
  final ProfileRepo _profileRepo;
  final HiveProfileDataSource _hiveProfileDataSource;

  AuthStatus _status = AuthStatus.unknown;
  ProfileEntity? _currentProfile;
  String? _userId;

  AuthController(this._checkAuthStatusUseCase, this._profileRepo, this._hiveProfileDataSource) {
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

      final cached = _hiveProfileDataSource.getCachedProfileSync(user.uId);
      if (cached != null) {
        _currentProfile = cached;
        notifyListeners(); // show UI immediately with cached data
      }

      // ✅ 2. Then fetch fresh from network & update cache
      final result = await _profileRepo.getProfile(user.uId);
      result.fold(
        (failure) => debugPrint('Profile load failed: $failure'),
        (profile) {
          _currentProfile = profile;
          _hiveProfileDataSource.cacheProfile(profile); // keep cache fresh
          notifyListeners();
        },
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

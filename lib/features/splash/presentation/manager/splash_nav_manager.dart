import 'dart:async';

import 'package:grocify/core/services/shared_preferences_singleton.dart';
import 'package:grocify/core/utils/constants.dart';
import 'package:grocify/features/auth/presentation/manger/auth_controller/auth_controller.dart';
import 'package:grocify/features/auth/presentation/views/signin_view.dart';
import 'package:grocify/features/home/presentation/views/main_layout.dart';
import 'package:grocify/features/onboarding/presentation/views/onboarding_view.dart';

class SplashNavManager {
  final AuthController _authController;

  static const minDisplayDuration = Duration(seconds: 4);

  SplashNavManager(this._authController);

  Future<String> determineNextRoute() async {
    await Future.delayed(minDisplayDuration);

    final isOnboardingSeen = Prefs.getBool(kIsOnboardingSeen);
    if (!isOnboardingSeen) return OnboardingView.routeName;

    // Wait for auth to resolve if still unknown
    if (_authController.isUnknown) {
      await _waitForAuthResolution();
    }

    return _authController.isAuthenticated
        ? MainLayout.routeName
        : SignInView.routeName;
  }

  Future<void> _waitForAuthResolution() async {
    final completer = Completer<void>();

    void listener() {
      if (!_authController.isUnknown) {
        _authController.removeListener(listener);
        completer.complete();
      }
    }

    _authController.addListener(listener);
    return completer.future;
  }
}


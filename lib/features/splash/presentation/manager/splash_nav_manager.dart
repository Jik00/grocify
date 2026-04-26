import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:grocify/core/services/shared_preferences_singleton.dart';
import 'package:grocify/core/utils/constants.dart';
import 'package:grocify/features/auth/domain/repos/auth_repo.dart';
import 'package:grocify/features/auth/presentation/views/signin_view.dart';
import 'package:grocify/features/home/presentation/views/main_layout.dart';
import 'package:grocify/features/onboarding/presentation/views/onboarding_view.dart';

class SplashNavManager {
  final AuthRepo _authRepo;

  static const minDisplayDuration = Duration(seconds: 4);

  SplashNavManager(this._authRepo);

  Future<String> determineNextRoute() async {
    await Future.delayed(minDisplayDuration);

    final isOnboardingSeen = Prefs.getBool(kIsOnboardingSeen);

    if (!isOnboardingSeen) {
      return OnboardingView.routeName;
    }

    final currentUser = await _authRepo.getCurrentUser();
    final isAuthenticated = currentUser != null;

    if (isAuthenticated) {
      // ✅ Profile will be loaded automatically by AuthController
      // AuthController listens to auth changes and fetches profile
      return MainLayout.routeName;
    }

    return SignInView.routeName;
  }
}

extension SplashNavigationManagerExtension on BuildContext {
  SplashNavManager get splashNavigationManager =>
      SplashNavManager(read<AuthRepo>());     
}
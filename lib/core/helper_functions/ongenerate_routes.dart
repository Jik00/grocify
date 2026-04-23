import 'package:flutter/material.dart';
import 'package:grocify/features/auth/presentation/views/signin_view.dart';
import 'package:grocify/features/auth/presentation/views/signup_view.dart';
import 'package:grocify/features/onboarding/presentation/views/onboarding_view.dart';
import 'package:grocify/features/splash/presentation/views/splash_view.dart';

Route<dynamic>? onGenerateRoutes(RouteSettings settings) {
  switch (settings.name) {

    case SplashView.routeName:
      return MaterialPageRoute(
        builder: (_) => const SplashView(),
        settings: settings,
      );

    case OnboardingView.routeName:
      return MaterialPageRoute(
        builder: (_) => const OnboardingView(),
        settings: settings,
      );

    case SignInView.routeName:
    return MaterialPageRoute(
      builder: (_) => const SignInView(),
      settings: settings,
    );

  case SignupView.routeName:
    return MaterialPageRoute(
      builder: (_) => const SignupView(),
      settings: settings,
    );

    // case MainLayout.routeName:
    //   return MaterialPageRoute(
    //     builder: (_) => const MainLayout(),
    //     settings: settings,
    //   );

    // case HomeView.routeName:
    //   return MaterialPageRoute(
    //     builder: (_) => const HomeView(),
    //     settings: settings,
    //   );

    // case ErasView.routeName:
    //   return MaterialPageRoute(
    //     builder: (_) => const ErasView(),
    //     settings: settings,
    //   );

    // case FigureView.routeName:
    //   final String eraName = settings.arguments as String;
    //   return MaterialPageRoute(
    //     builder: (_) => FigureView(
    //       eraName: eraName,
    //     ),
    //     settings: settings,
    //   );

    // case DisplayDetailView.routeName:
    //   final FigureEntity figure = settings.arguments as FigureEntity;
    //   return PageRouteBuilder(
    //     settings: settings,
    //     transitionDuration: const Duration(milliseconds: 900),
    //     reverseTransitionDuration: const Duration(milliseconds: 900),
    //     pageBuilder: (_, animation, __) => DisplayDetailView( figure: figure),
    //     transitionsBuilder: (_, animation, __, child) {
    //       return FadeTransition(
    //         opacity: Tween<double>(
    //           begin: 0.0,
    //           end: 1.0,
    //         ).animate(
    //           CurvedAnimation(
    //             parent: animation,
    //             curve: const Interval(0.2, 1.0),
    //           ),
    //         ),
    //         child: child,
    //       );
    //     },
    //   );

    // case WeatherView.routeName:
    //   return MaterialPageRoute(
    //     builder: (_) => const WeatherView(),
    //     settings: settings,
    //   );

    // case ChatbotView.routeName:
    //   return MaterialPageRoute(
    //     builder: (_) => const ChatbotView(),
    //     settings: settings,
    //   );

    // case VrInstructionsView.routeName:
    //   return MaterialPageRoute(
    //     builder: (_) => const VrInstructionsView(),
    //     settings: settings,
    //   );

    // case ProfileView.routeName:
    //   return MaterialPageRoute(
    //     builder: (_) => const ProfileView(),
    //     settings: settings,
    //   );

    default:
      return null;
  }
}

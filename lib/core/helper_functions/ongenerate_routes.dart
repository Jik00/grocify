import 'package:flutter/material.dart';
import 'package:grocify/features/auth/presentation/views/signin_view.dart';
import 'package:grocify/features/auth/presentation/views/signup_view.dart';
import 'package:grocify/features/cart/presentation/views/cart_view.dart';
import 'package:grocify/features/home/presentation/views/categories_view.dart';
import 'package:grocify/features/home/presentation/views/home_view.dart';
import 'package:grocify/features/home/presentation/views/main_layout.dart';
import 'package:grocify/features/onboarding/presentation/views/onboarding_view.dart';
import 'package:grocify/core/entities/product_entity.dart';
import 'package:grocify/features/products_&_fav/presentation/views/fav_view.dart';
import 'package:grocify/features/products_&_fav/presentation/views/products_view.dart';
import 'package:grocify/features/products_&_fav/presentation/views/widgets/deatils_view.dart';
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

    case MainLayout.routeName:
      return MaterialPageRoute(
        builder: (_) => const MainLayout(),
        settings: settings,
      );

    case HomeView.routeName:
      return MaterialPageRoute(
        builder: (_) => const HomeView(),
        settings: settings,
      );

    case ProductsView.routeName:
      final int catId = settings.arguments as int;
      return MaterialPageRoute(
        builder: (_) => ProductsView(
          catId: catId,
        ),
        settings: settings,
      );

    case DetailsView.routeName:
      final ProductEntity product = settings.arguments as ProductEntity;
      return PageRouteBuilder(
        settings: settings,
        transitionDuration: const Duration(milliseconds: 900),
        reverseTransitionDuration: const Duration(milliseconds: 900),
        pageBuilder: (_, animation, __) => DetailsView(product: product),
        transitionsBuilder: (_, animation, __, child) {
          return FadeTransition(
            opacity: Tween<double>(
              begin: 0.0,
              end: 1.0,
            ).animate(
              CurvedAnimation(
                parent: animation,
                curve: const Interval(0.2, 1.0),
              ),
            ),
            child: child,
          );
        },
      );

    case FavView.routeName:
      return MaterialPageRoute(
        builder: (_) => const FavView(),
        settings: settings,
      );

    case CategoriesView.routeName:
      return MaterialPageRoute(
        builder: (_) => const CategoriesView(),
        settings: settings,
      );

    case CartView.routeName:
      return MaterialPageRoute(
        builder: (_) => const CartView(),
        settings: settings,
      );

    // case ProfileView.routeName:
    //   return MaterialPageRoute(
    //     builder: (_) => const ProfileView(),
    //     settings: settings,
    //   );

    default:
      return null;
  }
}

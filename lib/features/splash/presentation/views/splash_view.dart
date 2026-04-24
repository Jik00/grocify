import 'package:flutter/material.dart';
import 'package:grocify/core/services/get_it_service.dart';
import 'package:grocify/core/utils/app_colors.dart';
import 'package:grocify/features/auth/presentation/manger/auth_controller/auth_controller.dart';
import 'package:grocify/features/splash/presentation/views/widgets/splash_view_body.dart';
import 'package:provider/provider.dart';

class SplashView extends StatelessWidget {
  const SplashView({super.key});

  static const String routeName = '/splash';

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create : (_) => getIt<AuthController>(),
      child: Scaffold(
        backgroundColor: AppColors.splashBackground,
        body: const SplashViewBody(),
      ),
    );
  }
}
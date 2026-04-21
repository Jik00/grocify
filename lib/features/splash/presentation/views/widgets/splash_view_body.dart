import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:grocify/core/utils/app_images.dart';
import 'package:grocify/features/onboarding/presentation/views/onboarding_view.dart';

class SplashViewBody extends StatefulWidget {
  const SplashViewBody({super.key});

  @override
  State<SplashViewBody> createState() => _SplashViewBodyState();
}

class _SplashViewBodyState extends State<SplashViewBody>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _fade;

  @override
  void initState() {
    super.initState();
    _controller =
        AnimationController(vsync: this, duration: const Duration(seconds: 3));
    _fade = CurvedAnimation(parent: _controller, curve: Curves.easeIn);
    _controller.forward();

    _scheduleNavigation();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Spacer(),
        FadeTransition(
          opacity: _fade,
          child: Image.asset(
            Assets.assetsImagesAppIcon,
            width: 109.w,
            height: 122.h,
          ),
        ),
        Expanded(
          child: Align(
            alignment: Alignment.bottomCenter,
            child: FadeTransition(
              opacity: _fade,
              child: Image.asset(
                Assets.assetsImagesSplashBottom,
                width: double.maxFinite,
                height: 102.h,
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),
      ],
    );
  }

    void _scheduleNavigation() {

    // bool isOnboardingSeen = Prefs.getBool(kIsOnboardingSeen);
    final navigator = Navigator.of(context);
    
    Future.delayed(
      const Duration(seconds: 4),
      () {

        navigator.pushReplacementNamed(OnboardingView.routeName);

        // if (mounted) {
        //   if (isOnboardingSeen) {
        //     Navigator.pushReplacementNamed(context, LoginView.routeName);
        //     //navigator.pushReplacementNamed(ErasView.routeName);
        //     //navigator.pushReplacementNamed(ChatbotView.routeName);
        //    // navigator.pushReplacementNamed(MainLayout.routeName);

        //   } else {
        //     navigator.pushReplacementNamed(OnboardingView.routeName);
        //   }
        // }
      },
    );
  }


}

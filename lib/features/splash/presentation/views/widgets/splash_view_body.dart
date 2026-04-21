import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:grocify/core/utils/app_images.dart';

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
}

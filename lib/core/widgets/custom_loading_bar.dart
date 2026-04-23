import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';

class CustomLoadingBar extends StatelessWidget {
  const CustomLoadingBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: LottieBuilder.asset(
        'assets/animation/LoadingFruits.json',
        width: 250.w,
        height: 250.h,
        repeat: true,
      ),
    );
  }
}

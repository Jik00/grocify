import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:grocify/core/utils/app_colors.dart';

class NoAccountWidget extends StatelessWidget {
  const NoAccountWidget({
    super.key,
    required this.text1,
    required this.text2,
    this.onTap,
  });

  final String text1, text2;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return Text.rich(
      TextSpan(
        children: [
          TextSpan(
            text: text1,
            style: TextStyle(
              fontSize: 16.sp,
              color: AppColors.grayscale400,
            ),
          ),
          TextSpan(
            text: text2,
            recognizer: TapGestureRecognizer()..onTap = onTap,
            style: TextStyle(
              fontSize: 16.sp,
              fontWeight: FontWeight.w600,
              color: AppColors.onboardingGreen,
            ),
          ),
        ],
      ),
    );
  }
}

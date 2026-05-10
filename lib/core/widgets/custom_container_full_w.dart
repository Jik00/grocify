import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:grocify/core/utils/app_colors.dart';

class CustomContainerFullWidth extends StatelessWidget {
  const CustomContainerFullWidth({super.key, required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 343.h,
      height: 56.h,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8.r),
        color: AppColors.primary,
      ),
      child: Center(
        child: child,
      ),
    );
  }
}

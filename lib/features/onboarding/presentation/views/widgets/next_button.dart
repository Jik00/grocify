import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:grocify/core/utils/app_colors.dart';

class NextButton extends StatelessWidget {
  const NextButton({super.key, required this.onTap});

  final void Function() onTap;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80.h,
      width: 190.w,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(45.r),
        border: Border.all(color: Colors.black.withAlpha(75)),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withAlpha(35),
            blurRadius: 10.r,
          ),
        ],
      ),
      child: Padding(
        padding: EdgeInsets.all(6.sp),
        child: Container(
          decoration: BoxDecoration(
            color: AppColors.onboarding1,
            borderRadius: BorderRadius.circular(44.r),
          ),
          child: Center(
            child: IconButton(
              icon: Icon(
                Icons.arrow_forward_rounded,
                color: Colors.white,
                size: 28.sp,
                fontWeight: FontWeight.bold,
              ),
              onPressed: onTap,
            ),
          ),
        ),
      ),
    );
  }
}

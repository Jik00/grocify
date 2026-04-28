import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:grocify/core/utils/app_colors.dart';

class CustomContainer extends StatelessWidget {
  const CustomContainer({
    super.key, required this.title, required this.w, required this.h, required this.r, required this.sp,
  });

  final String title;
  final double w, h, r, sp;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: w.w,
      height: h.h,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(r.r),
        color: AppColors.primary,
      ),
      child: Center(
        child: Text(
          title,
          style: TextStyle(
            fontSize: sp.sp,
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}

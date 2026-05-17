import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:grocify/core/utils/app_colors.dart';

void buildErrorSnackBar(BuildContext context, String message) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Text(
        message,
        style: TextStyle(
          color: Colors.white,
          fontSize: 16.sp,
          fontWeight: FontWeight.w600,
        ),
      ),
      backgroundColor: AppColors.darkRedForErrorcolor,
      behavior: SnackBarBehavior.floating,
      margin: EdgeInsets.all(16.sp),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12.r),
      ),
      duration: const Duration(seconds: 2),
    ),
  );
}

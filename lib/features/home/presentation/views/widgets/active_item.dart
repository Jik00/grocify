import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:grocify/core/utils/app_colors.dart';

class ActiveItem extends StatelessWidget {
  const ActiveItem({super.key, required this.text, required this.image});

  final String text;
  final String image;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 6.h),
        decoration: ShapeDecoration(
          color: const Color(0xFFEEEEEE),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20.r),
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Container(
              width: 35.w,
              height: 35.h,
              decoration: ShapeDecoration(
                color: AppColors.navBarGreenon.withAlpha(210),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30.r),
                ),
              ),
              child: Center(
                  child: SvgPicture.asset(image, width: 18.w, height: 18.h)),
            ),
            Text(
              text,
              style: TextStyle(
                color: AppColors.navBarGreenon.withAlpha(210),
                fontWeight: FontWeight.bold,
                fontSize: 14.sp,
              ),
            ),
            SizedBox(width: 2.w),
          ],
        ),
      ),
    );
  }
}

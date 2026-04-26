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
        padding: EdgeInsets.only(left: 16.w),
        decoration: ShapeDecoration(
          color: const Color(0xFFEEEEEE),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30.r),
          ),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              width: 30.w,
              height: 30.h,
              decoration: ShapeDecoration(
                color: AppColors.navBarGreenon,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30.r),
                ),
              ),
              child: Center(child: SvgPicture.asset(image)),
            ),
           SizedBox(
              width: 4.w,
            ),
            Text(
              text,
              style: TextStyle(
                  color: AppColors.primary, fontWeight: FontWeight.bold, fontSize: 14.sp),
            )
          ],
        ),
      ),
    );
  }
}

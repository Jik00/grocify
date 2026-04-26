import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:grocify/core/utils/app_colors.dart';
import 'package:grocify/core/utils/context_extensions.dart';

class OfferContainer extends StatelessWidget {
  const OfferContainer({super.key, required this.color, required this.img});

  final Color color;
  final String img;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 270.w,
      height: 210.h,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.r),
        color: color,
      ),
      child: 
      Row (
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Column(
            //mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                context.loc.newMember,
                style: TextStyle(
                  fontSize: 20.sp,
                  fontWeight: FontWeight.bold,
                  color: AppColors.darkGreen,
                ),
              ),
              Text(
                context.loc.discount,
                style: TextStyle(
                  fontSize: 14.sp,
                  color: AppColors.darkGreen.withAlpha(190),
                ),
              ),
               Text(
                context.loc.off,
                style: TextStyle(
                  fontSize: 24.sp,
                  fontWeight: FontWeight.bold,
                  color: AppColors.darkGreen,
                ),
              ),
              SizedBox(height: 8.h),
              Container(
                width: 80.w,
                height: 28.h,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15.r),
                  color: AppColors.primary,
                ),
                child: Center(
                  child: Text(
                    context.loc.getNow,
                    style: TextStyle(
                      fontSize: 12.sp,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ],
          ),
          Image.asset(img,
          width: 120.w,
          height: 103.h,
          ),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:grocify/core/utils/app_colors.dart';

class ShippingMethod extends StatelessWidget {
  const ShippingMethod(
      {super.key,
      required this.title,
      required this.subtitle,
      required this.isSelected});

  final String title, subtitle;
  final bool isSelected;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      width: 343.h,
      height: 81.h,
      decoration: BoxDecoration(
        border:
            isSelected ? Border.all(color: Colors.green, width: 1.5.w) : null,
        borderRadius: BorderRadius.circular(4.r),
        color: AppColors.grayscale400.withAlpha(30),
      ),
      child: Row(
        children: [
          SizedBox(
            width: 2.w,
          ),
          Container(
            width: 18.w,
            decoration: BoxDecoration(
              color: Colors.white,
              shape: BoxShape.circle,
              border:
                  isSelected ? null : Border.all(color: AppColors.grayscale400),
            ),
            child: Center(
              child: Container(
                width: 12.w,
                decoration: BoxDecoration(
                  color: isSelected ? Colors.green : Colors.transparent,
                  shape: BoxShape.circle,
                ),
              ),
            ),
          ),
          SizedBox(
            width: 10.w,
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: TextStyle(fontSize: 14.sp, fontWeight: FontWeight.bold),
              ),
              Text(
                subtitle,
                style:
                    TextStyle(fontSize: 12.sp, color: AppColors.grayscale400),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

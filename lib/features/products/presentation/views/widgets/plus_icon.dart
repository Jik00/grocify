import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:grocify/core/utils/app_colors.dart';

class PlusIcon extends StatelessWidget {
  const PlusIcon({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        GestureDetector(
          child: Container(
            width: 28.w,
            decoration: BoxDecoration(
              color: AppColors.primary,
              shape: BoxShape.circle,
            ),
            child: Text(
              '+',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 28.sp,
                color: Colors.white,
              ),
            ),
          ),
        ),
      ],
    );
  }
}

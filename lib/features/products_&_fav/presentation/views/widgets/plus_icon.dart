import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:grocify/core/utils/app_colors.dart';

class PlusIcon extends StatelessWidget {
  const PlusIcon({super.key, required this.onTap, this.size});

  final void Function()? onTap;
  final double? size;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: size ?? 28.w,
        decoration: BoxDecoration(
          color: AppColors.primary,
          shape: BoxShape.circle,
        ),
        child: Text(
          '+',
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: size ?? 28.sp,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:grocify/core/widgets/quantity_selector.dart';

class QuantityContainer extends StatelessWidget {
  const QuantityContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 140.w,
      height: 50.h,
      padding: EdgeInsets.symmetric(horizontal: 12.w),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(40.r),
        border: Border.all(color: Colors.grey.withAlpha(100), width: 1.5.w),
      ),
      child: const QuantitySelector(w: 28, sp: 18),
    );
  }
}

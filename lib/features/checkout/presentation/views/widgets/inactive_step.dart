import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:grocify/features/checkout/domain/entities/step_entity.dart';

class InactiveStep extends StatelessWidget {
  const InactiveStep({super.key, required this.step});

  final StepEntity step;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          width: 20.w,
          decoration: BoxDecoration(
            color: Colors.grey[300],
            borderRadius: BorderRadius.circular(24.r),
          ),
          child: Text(
            step.num,
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 13.sp),
          ),
        ),
        SizedBox(width: 5.5.w),
        Text(
          step.title,
          style: TextStyle(color: Colors.grey[600], fontSize: 13.sp),
        ),
      ],
    );
  }
}

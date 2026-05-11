import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:grocify/features/checkout/domain/entities/step_entity.dart';

class ActiveStep extends StatelessWidget {
  const ActiveStep({super.key, required this.step});

  final StepEntity step;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          width: 20.w,
          decoration: BoxDecoration(
            color: Colors.green,
            shape: BoxShape.circle,
          ),
          child: Center(
            child: Icon(
              Icons.check,
              color: Colors.white,
              size: 13.sp,
            ),
          ),
        ),
        SizedBox(width: 5.5.w),
        Text(
          step.title,
          style: TextStyle(color: Colors.green, fontSize: 13.sp),
        ),
      ],
    );
  }
}

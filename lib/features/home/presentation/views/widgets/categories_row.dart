import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:grocify/core/utils/context_extensions.dart';

class CategoriesRow extends StatelessWidget {
  const CategoriesRow({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          context.loc.categories,
          style: TextStyle(
            fontSize: 20.sp,
            fontWeight: FontWeight.bold,
          ),
        ),
        GestureDetector(
          child: Row(
            children: [
              Text(
                context.loc.viewAll,
                style: TextStyle(
                  fontSize: 14,
                  color: Colors.green,
                ),
              ),
              SizedBox(
                width: 4.w,
              ),
              Icon(
                Icons.arrow_forward_ios,
                size: 14,
                color: Colors.green,
              ),
            ],
          ),
        ),
      ],
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PgViewItem extends StatelessWidget {
  const PgViewItem({
    super.key,
    required this.img,
    required this.title,
    required this.subtitle,
  });

  final String img;
  final String title;
  final String subtitle;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Image.asset(
          img,
          width: double.maxFinite,
          height: 490.h,
          fit: BoxFit.cover,
        ),
        Align(
          alignment: Alignment.bottomCenter,
          child: Container(
            width: double.maxFinite,
            height: 387.h,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(40.r),
                topRight: Radius.circular(40.r),
              ),
            ),
          ),
        ),
        Positioned(
          bottom: 85.h,
          left: 16.w,
          right: 16.w,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 24.sp,
                  fontWeight: FontWeight.bold,
                  // shadows: [
                  //   Shadow(
                  //     blurRadius: 8.r,
                  //     color: Colors.black.withAlpha(179),
                  //     offset: const Offset(2, 2),
                  //   ),
                  // ],
                ),
              ),
              SizedBox(height: 24.h),
              Text(
                subtitle,
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.grey,
                  fontSize: 16.sp,
                ),
              ),
              SizedBox(
                height: 52.h,
              ),
            ],
          ),
        ),
      ],
    );
  }
}

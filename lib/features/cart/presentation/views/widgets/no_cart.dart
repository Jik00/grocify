import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:grocify/core/utils/app_images.dart';
import 'package:grocify/generated/l10n.dart';

class NoCart extends StatelessWidget {
  const NoCart({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            Assets.assetsImagesEmptyCartt,
            height: 220.h,
          ),
          SizedBox(height: 16.h),
          Text(
            S.current.noCart,
            style: TextStyle(
              fontSize: 20.sp,
              color: Colors.grey[600],
            ),
          ),
        ],
      ),
    );
  }
}

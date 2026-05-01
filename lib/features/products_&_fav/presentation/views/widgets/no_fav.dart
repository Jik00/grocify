import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:grocify/core/utils/app_images.dart';
import 'package:grocify/generated/l10n.dart';

class NoFav extends StatelessWidget {
  const NoFav({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SvgPicture.asset(Assets.assetsImagesGroceriesBag, height: 120.h),
        SizedBox(height: 16.h),
        Text(
          S.current.noFavYet,
          style: TextStyle(
            fontSize: 20.sp,
            color: Colors.grey[600],
          ),
        ),
      ],
    );
  }
}

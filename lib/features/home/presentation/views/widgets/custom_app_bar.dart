import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:grocify/core/helper_functions/dummy_user.dart';
import 'package:grocify/core/utils/app_colors.dart';
import 'package:grocify/core/utils/context_extensions.dart';
import 'package:grocify/core/utils/globals.dart';
import 'package:grocify/features/profile/domain/entities/profile_entity.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    ProfileEntity profile = globalProfile ?? dummyProfile;

    return Row(
      children: [
        CircleAvatar(
          radius: 30.r,
          backgroundImage: NetworkImage(
            profile.avatarUrl,
          ),
        ),
        SizedBox(width: 12.w),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              context.loc.welcome,
              style: TextStyle(
                fontSize: 16.sp,
                color: AppColors.grayscale400,
              ),
            ),
            SizedBox(height: 2.h),
            Text(
              profile.name,
              style: TextStyle(
                fontSize: 16.sp,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ],
    );
  }
}

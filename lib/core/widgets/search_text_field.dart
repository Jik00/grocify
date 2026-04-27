import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:grocify/core/utils/app_colors.dart';
import 'package:grocify/core/utils/app_images.dart';
import 'package:grocify/core/utils/context_extensions.dart';

class SearchTextField extends StatelessWidget {
  const SearchTextField({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40.h,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8.r),
        border: Border.all(
          color: AppColors.grayscale400.withAlpha(80),
        ),
        boxShadow: [
          BoxShadow(
            color: Color(0x0A000000),
            blurRadius: 7,
            offset: Offset(2, 2),
            spreadRadius: 1,
          )
        ],
      ),
      child: TextField(
        keyboardType: TextInputType.text,
        decoration: InputDecoration(
          prefixIcon: SizedBox(
            width: 24.w,
            child: Center(
              child: SvgPicture.asset(Assets.assetsImagesIconsSearchIcon),
            ),
          ),
          suffixIcon: SizedBox(
            width: 20.w,
            child: Center(
              child: SvgPicture.asset(
                Assets.assetsImagesIconsFilter,
              ),
            ),
          ),
          hintStyle: TextStyle(
            fontSize: 14.sp,
            color: AppColors.grayscale400,
          ),
          hintText: context.loc.search,
          filled: true,
          fillColor: Colors.white,
          border: buildBorder(),
          enabledBorder: buildBorder(),
          focusedBorder: buildBorder(),
        ),
      ),
    );
  }

  OutlineInputBorder buildBorder() {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(8.r),
      borderSide: const BorderSide(
        width: 1,
        color: Colors.white,
      ),
    );
  }
}

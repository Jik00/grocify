import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:grocify/core/utils/app_colors.dart';
import 'package:grocify/core/utils/app_images.dart';
import 'package:grocify/features/home/presentation/views/widgets/offer_container.dart';

class DiscountList extends StatelessWidget {
  const DiscountList({super.key});

  @override
   Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: [
          Padding(
            padding: EdgeInsets.symmetric (horizontal: 16.w),
            child: OfferContainer(
              color: AppColors.container1,
              img: Assets.assetsImagesOfferImg1,
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric (horizontal: 16.w),
            child: OfferContainer(
              color: AppColors.container2,
              img: Assets.assetsImagesOfferImg2,
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric (horizontal: 16.w),
            child: OfferContainer(
              color: AppColors.container3,
              img: Assets.assetsImagesOfferImg3,
            ),
          ),

        ],
      ),
    );
  }
}
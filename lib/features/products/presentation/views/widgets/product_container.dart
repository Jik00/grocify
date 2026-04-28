import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:grocify/core/utils/app_colors.dart';
import 'package:grocify/features/products/domain/entities/product_entity.dart';
import 'package:grocify/features/products/presentation/views/widgets/fav_icon.dart';
import 'package:grocify/features/products/presentation/views/widgets/plus_icon.dart';
import 'package:grocify/generated/l10n.dart';

class ProductContainer extends StatelessWidget {
  const ProductContainer({super.key, required this.product});

  final ProductEntity product;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Align(
          alignment: Alignment.topCenter,
          child: Padding(
            padding: (product.name == S.current.cadbury_dairy_milk)
                ? EdgeInsets.only(top: 75.h)
                : EdgeInsets.only(top: 40.h),
            child: Image.asset(
              product.image,
              width: (product.id == 4 || product.id == 3) ? 50.w : 110.w,
            ),
          ),
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const FavIcon(),
            // Spacer(),
            SizedBox(
              height: 125.h,
            ),
            Text(
              product.price,
              style: TextStyle(
                fontSize: 14.sp,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              product.name,
              style: TextStyle(
                color: AppColors.grayscale400,
                fontSize: 11.sp,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
        Positioned(
          right: 0,
          bottom: 60.h,
          child: PlusIcon(),
        ),
      ],
    );
  }
}

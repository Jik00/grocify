import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:grocify/core/entities/product_entity.dart';
import 'package:grocify/features/products_&_fav/presentation/views/widgets/products_grid.dart';
import 'package:grocify/generated/l10n.dart';

class ProductsViewBody extends StatelessWidget {
  const ProductsViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsetsGeometry.symmetric(horizontal: 16.w),
      child: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  S.current.chocolate,
                  style: TextStyle(
                    fontSize: 20.sp,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 12.h),
              ],
            ),
          ),
          ProductsGrid(
            products: productsEntities,
          ),
          SliverToBoxAdapter(
            child: SizedBox(
              height: 90.h,
            ),
          ),
        ],
      ),
    );
  }
}

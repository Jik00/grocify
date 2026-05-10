import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:grocify/core/utils/app_colors.dart';
import 'package:grocify/core/utils/globals.dart';
import 'package:grocify/core/widgets/custom_container.dart';
import 'package:grocify/features/cart/presentation/manager/cart_cubit/cart_cubit.dart';
import 'package:grocify/features/products_&_fav/presentation/views/widgets/quantity_container.dart';
import 'package:grocify/core/entities/product_entity.dart';
import 'package:grocify/generated/l10n.dart';

class DetailsViewBody extends StatelessWidget {
  const DetailsViewBody({super.key, required this.product});

  final ProductEntity product;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      child: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            GestureDetector(
              onTap: () => Navigator.pop(context),
              child: Center(
                child: Hero(
                  tag: '${product.id}img',
                  child: Image.asset(
                    product.image,
                    width: (product.id == '3' || product.id == '4')
                        ? 120.w
                        : (product.id == '6' ||
                                product.id == '7' ||
                                product.id == '8')
                            ? 240.w
                            : double.maxFinite,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            SizedBox(height: 12.h),
            Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                SizedBox(
                  width: 230.w,
                  child: Hero(
                    tag: '${product.id}name',
                    child: Text(
                      product.name,
                      overflow: TextOverflow.ellipsis,
                      maxLines: 5,
                      style: TextStyle(
                        fontSize: 20.sp,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
                const Spacer(),
                Hero(
                  tag: '${product.id}price',
                  child: Text(
                    '${S.current.egp} ${product.price}',
                    style: TextStyle(
                        fontSize: 18.sp,
                        fontWeight: FontWeight.bold,
                        color: AppColors.primary),
                  ),
                ),
              ],
            ),
            SizedBox(height: 42.h),
            Text(
              S.current.description,
              style: TextStyle(
                fontSize: 16.sp,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 12.h),
            Text(
              product.description,
              style: TextStyle(
                fontSize: 14.sp,
                fontWeight: FontWeight.normal,
                color: Colors.grey[600],
              ),
            ),
            SizedBox(height: 52.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                QuantityContainer(),
                GestureDetector(
                  onTap: () {
                  fireCartAnimation = true;
                  context.read<CartCubit>().addToCart(product);
                },
                  child: CustomContainer(
                      title: S.current.addToCart, w: 139, h: 49, r: 40, sp: 16),
                ),
              ],
            ),
            SizedBox(height: 100.h),
          ],
        ),
      ),
    );
  }
}

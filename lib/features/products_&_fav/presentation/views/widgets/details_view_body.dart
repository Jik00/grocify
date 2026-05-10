import 'dart:developer';

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

class DetailsViewBody extends StatefulWidget {
  const DetailsViewBody({super.key, required this.product});

  final ProductEntity product;

  @override
  State<DetailsViewBody> createState() => _DetailsViewBodyState();
}

class _DetailsViewBodyState extends State<DetailsViewBody> {
  int quantity = 1;
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
                  tag: '${widget.product.id}img',
                  child: Image.asset(
                    widget.product.image,
                    width: (widget.product.id == '3' || widget.product.id == '4')
                        ? 120.w
                        : (widget.product.id == '6' ||
                                widget.product.id == '7' ||
                                widget.product.id == '8')
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
                    tag: '${widget.product.id}name',
                    child: Text(
                      widget.product.name,
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
                  tag: '${widget.product.id}price',
                  child: Text(
                    '${S.current.egp} ${widget.product.price}',
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
              widget.product.description,
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
                QuantityContainer( onCountChange: (count) => quantity = count,),
                GestureDetector(
                  onTap: () {
                  fireCartAnimation = true;
                  log(quantity.toString());
                  context.read<CartCubit>().addToCart(widget.product, quantity);
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

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:grocify/features/cart/presentation/views/widgets/quantity_selector.dart';
import 'package:grocify/features/cart/domain/entities/cart_item_entity.dart';

class CartItemContainer extends StatelessWidget {
  const CartItemContainer({super.key, required this.cartItemEntity});

  final CartItemEntity cartItemEntity;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(16),
      height: 75.h,
      // width: 343.w,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8.r),
        boxShadow: [
          BoxShadow(
            color: Colors.green.withAlpha(60),
            spreadRadius: 2,
            blurRadius: 5,
            offset: const Offset(0, 0),
          ),
        ],
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 8.w),
        child: Row(
          children: [
            Container(
              height: 50.h,
              width: 45.w,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8.r),
                image: DecorationImage(
                  image: AssetImage(cartItemEntity.product.image),
                  fit: BoxFit.fill,
                ),
              ),
            ),
            SizedBox(width: 5.w),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ConstrainedBox(
                  constraints: BoxConstraints(maxWidth: 180.w),
                  child: Text(
                    overflow: TextOverflow.ellipsis,
                    maxLines: 2,
                    cartItemEntity.product.name,
                    style: TextStyle(
                      fontSize: 14.sp,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Text(
                  cartItemEntity.product.price.toString(),
                  style: TextStyle(
                    fontSize: 14.sp,
                    color: Colors.grey[600],
                  ),
                ),
              ],
            ),
            const Spacer(),
            ConstrainedBox(
              constraints: BoxConstraints(maxWidth: 80.w),
              child: QuantitySelector(
                w: 20,
                sp: 14,
                cartItemEntity: cartItemEntity,
              ),
            ),
            const Spacer(),
          ],
        ),
      ),
    );
  }
}

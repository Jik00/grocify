import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:grocify/core/utils/globals.dart';
import 'package:grocify/features/cart/domain/entities/cart_item_entity.dart';
import 'package:grocify/features/cart/presentation/manager/cart_cubit/cart_cubit.dart';
import 'package:grocify/features/products_&_fav/presentation/views/widgets/plus_icon.dart';
import 'package:grocify/generated/l10n.dart';

class QuantitySelector extends StatelessWidget {
  const QuantitySelector(
      {super.key,
      required this.w,
      required this.sp,
      required this.cartItemEntity});

  final double w, sp;
  final CartItemEntity cartItemEntity;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        GestureDetector(
          onTap: () {
            context.read<CartCubit>().decrementFromCart(cartItemEntity.product);
          },
          child: Container(
            width: w .w,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(color: Colors.green, width: 1.5.w),
              color: Colors.transparent,
            ),
            child: Center(
              child: Icon(
                Icons.remove,
                color: Colors.green,
                size: sp.sp,
              ),
            ),
          ),
        ),

        // Text
        BlocBuilder<CartCubit, CartState>(
          buildWhen: (previous, current) {
            return current is CartItemUpdate &&
                current.productId == cartItemEntity.product.id;
          },
          builder: (context, state) {
            // Read live count from cubit's allCartEntity, not from the stale passed cartItemEntity
            final cubit = context.read<CartCubit>();
            final liveItem =
                cubit.allCartEntity.getCartItem(cartItemEntity.product);
            log("building text once");
            return Text(
              "${liveItem.count}${S.current.pc}",
              style: TextStyle(
                fontSize: sp.sp,
                fontWeight: FontWeight.w500,
              ),
            );
          },
        ),

        // Plus button
        PlusIcon(
          onTap: () {
            fireCartAnimation = false;
            context.read<CartCubit>().addToCart(cartItemEntity.product, 1);
          },
          size: w,
        ),
      ],
    );
  }
}

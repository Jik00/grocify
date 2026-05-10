import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:grocify/features/cart/domain/entities/all_cart_entity.dart';
import 'package:grocify/features/cart/presentation/views/widgets/cart_items_list.dart';

class CartViewBody extends StatelessWidget {
  const CartViewBody({super.key, required this.cart});

  final AllCartEntity cart;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: BouncingScrollPhysics(),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 12.h),
          CartItemsList(cart: cart),

        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:grocify/features/cart/domain/entities/all_cart_entity.dart';
import 'package:grocify/features/cart/presentation/views/widgets/cart_items_list.dart';
import 'package:grocify/features/cart/presentation/views/widgets/checkout_button.dart';

class CartViewBody extends StatelessWidget {
  const CartViewBody({super.key, required this.cart});

  final AllCartEntity cart;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 12.h),
              CartItemsList(cart: cart),
              SizedBox(height: 62.h),
            ],
          ),
        ),
        Align(
          alignment: Alignment.bottomCenter,
          child: Padding(
            padding: EdgeInsets.only(bottom: 75.h),
            child: CheckoutButton(),
          ),
        ),
      ],
    );
  }
}

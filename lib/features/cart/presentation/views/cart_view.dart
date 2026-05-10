import 'package:flutter/material.dart';
import 'package:grocify/core/utils/app_colors.dart';
import 'package:grocify/features/cart/presentation/views/widgets/cart_consumer.dart';
import 'package:grocify/features/products_&_fav/presentation/views/widgets/title_row.dart';

class CartView extends StatelessWidget {
  const CartView({super.key});

  static const routeName = '/cart';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      appBar: AppBar(
        backgroundColor: Colors.white,
        foregroundColor: AppColors.primary,
        centerTitle: true,
        title: const TitleRow(),
      ),
      body: CartConsumer(),
    );
  }
}

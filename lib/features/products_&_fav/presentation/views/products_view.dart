import 'package:add_to_cart_animation/add_to_cart_animation.dart';
import 'package:flutter/material.dart';
import 'package:grocify/core/utils/globals.dart';
import 'package:grocify/features/products_&_fav/presentation/views/widgets/products_app_bar.dart';
import 'package:grocify/features/products_&_fav/presentation/views/widgets/products_view_body.dart';

class ProductsView extends StatefulWidget {
  const ProductsView({super.key, required this.catId});

  static const routeName = '/products';

  final int catId;

  @override
  State<ProductsView> createState() => _ProductsViewState();
}

class _ProductsViewState extends State<ProductsView> {
  @override
  Widget build(BuildContext context) {
    return AddToCartAnimation(
      cartKey: gkCart,
      height: 20,
      width: 20,
      opacity: 0.85,
      dragAnimation: const DragToCartAnimationOptions(
        rotation: false,
        duration: Duration(milliseconds: 600),
      ),
      jumpAnimation: const JumpAnimationOptions(
        duration: Duration(milliseconds: 300),
      ),
      createAddToCartAnimation: (animation) {
        runAddToCartAnimation = animation;
      },
      child: Scaffold(
        appBar: productsAppBar(catId: widget.catId),
        extendBody: true,
        body: const ProductsViewBody(),
      ),
    );
  }
}

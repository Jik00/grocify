import 'package:flutter/material.dart';
import 'package:grocify/features/products_&_fav/presentation/views/widgets/products_app_bar.dart';
import 'package:grocify/features/products_&_fav/presentation/views/widgets/products_view_body.dart';

class ProductsView extends StatelessWidget {
  const ProductsView({super.key, required this.catId});

  static const routeName = '/products';

  final int catId;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: productsAppBar(catId: catId),
      extendBody: true,
      body: const ProductsViewBody(),
    );
  }
}

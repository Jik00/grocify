import 'package:flutter/material.dart';
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
    return Scaffold(
      appBar: productsAppBar(catId: widget.catId),
      extendBody: true,
      body: const ProductsViewBody(),
    );
  }
}

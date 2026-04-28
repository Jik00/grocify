import 'package:flutter/material.dart';
import 'package:grocify/features/products/presentation/views/widgets/products_app_bar.dart';
import 'package:grocify/features/products/presentation/views/widgets/products_view_body.dart';

class ProductsView extends StatelessWidget {
  const ProductsView({super.key, required this.cat});

  static const routeName = '/products';

  final String cat;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: productsAppBar(cat : cat),
      extendBody: true,
      body: const ProductsViewBody(),
    );
  }
}

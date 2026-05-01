import 'package:flutter/material.dart';
import 'package:grocify/core/entities/product_entity.dart';
import 'package:grocify/features/products_&_fav/presentation/views/widgets/product_container.dart';

class ProductsGrid extends StatelessWidget {
  const ProductsGrid({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverGrid.builder(
      itemCount: products.length,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        childAspectRatio: 0.45,
        mainAxisSpacing: 8,
        crossAxisSpacing: 10,
      ),
      itemBuilder: (context, index) {
        return ProductContainer(
          product: products[index],
        );
      },
    );
  }
}

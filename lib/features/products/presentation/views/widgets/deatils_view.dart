import 'package:flutter/material.dart';
import 'package:grocify/core/utils/app_colors.dart';
import 'package:grocify/features/products/domain/entities/product_entity.dart';
import 'package:grocify/features/products/presentation/views/widgets/details_view_body.dart';
import 'package:grocify/features/products/presentation/views/widgets/fav_icon.dart';

class DetailsView extends StatelessWidget {
  const DetailsView({super.key, required this.product});

  static const routeName = '/details';

  final ProductEntity product;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      appBar: AppBar(
        backgroundColor: Colors.white,
        automaticallyImplyActions: true,
        foregroundColor: AppColors.primary,
        title: FavIcon(),
      ),
      body: DetailsViewBody(product: product),
    );
  }
}
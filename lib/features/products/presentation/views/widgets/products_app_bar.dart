import 'package:flutter/material.dart';
import 'package:grocify/core/utils/app_colors.dart';
import 'package:grocify/features/products/presentation/views/widgets/categories_drop_list.dart';

AppBar productsAppBar({required String cat}) {
  return AppBar(
    backgroundColor: Colors.white,
    automaticallyImplyLeading: true,
    foregroundColor: AppColors.primary,
    title: Center(child: CategoriesDropList(cat: cat)),
  );
}

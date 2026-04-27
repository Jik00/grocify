import 'package:flutter/material.dart';
import 'package:grocify/features/home/domain/entities/category_entity.dart';
import 'package:grocify/features/home/presentation/views/widgets/category_conatiner.dart';

class CategoryGrid extends StatelessWidget {
  const CategoryGrid({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverGrid.builder(
      itemCount: categories.length,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        //childAspectRatio: 163 / 214,
        childAspectRatio: 0.66,
        mainAxisSpacing: 8,
        crossAxisSpacing: 8,
      ),
      itemBuilder: (context, index) {
        return CategoryConatiner(
          cat: categories[index],
        );
      },
    );
  }
}

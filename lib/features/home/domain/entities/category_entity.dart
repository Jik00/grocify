import 'package:flutter/material.dart';
import 'package:grocify/core/utils/app_colors.dart';
import 'package:grocify/core/utils/app_images.dart';
import 'package:grocify/generated/l10n.dart';

class CategoryEntity {
  final String name;
  final String img;
  final Color color;

  CategoryEntity({
    required this.name,
    required this.img,
    required this.color,
  });
}

List<CategoryEntity> get categories => [
      CategoryEntity(
        name: S.current.fruitsVegetables,
        img: Assets.assetsImagesCat1,
        color: Colors.white,
      ),
      CategoryEntity(
        name: S.current.eggCheeseColdcuts,
        img: Assets.assetsImagesCat3,
        color: AppColors.container5,
      ),
      CategoryEntity(
        name: S.current.bakeriesPastries,
        img: Assets.assetsImagesCat2,
        color: AppColors.container9,
      ),
      CategoryEntity(
        name: S.current.snacks,
        img: Assets.assetsImagesCat4,
        color: AppColors.container8,
      ),
      CategoryEntity(
        name: S.current.beverages,
        img: Assets.assetsImagesCat5,
        color: AppColors.container3,
      ),
      CategoryEntity(
        name: S.current.houseCleaning,
        img: Assets.assetsImagesCat6,
        color: Colors.white,
      ),
      CategoryEntity(
        name: S.current.beuty,
        img: Assets.assetsImagesCat7,
        color: Colors.white,
      ),
      CategoryEntity(
        name: S.current.frozen,
        img: Assets.assetsImagesCat8,
        color: AppColors.container6,
      ),
      CategoryEntity(
        name: S.current.petsSupplies,
        img: Assets.assetsImagesCat9,
        color: AppColors.container7,
      ),
    ];

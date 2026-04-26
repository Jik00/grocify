import 'package:flutter/material.dart';
import 'package:grocify/features/home/domain/entities/button_nav_bar_entity.dart';

import 'active_item.dart';
import 'in_active_item.dart';

class NaivgationBarItem extends StatelessWidget {
  const NaivgationBarItem(
      {super.key, required this.isSelected, required this.bottomNavBarEntity});

  final bool isSelected;
  final ButtomNavBarEntity bottomNavBarEntity;
  @override
  Widget build(BuildContext context) {
    return isSelected
        ? ActiveItem(
            image: bottomNavBarEntity.activeImg,
            text: bottomNavBarEntity.name,
          )
        : InActiveItem(
            image: bottomNavBarEntity.inActiveImg,
          );
  }
}

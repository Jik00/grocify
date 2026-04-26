import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:grocify/features/home/domain/entities/button_nav_bar_entity.dart';

import 'naivation_bar_item.dart';

class CustomBottomNavigationBar extends StatefulWidget {
  const CustomBottomNavigationBar({super.key, required this.onItemTapped});
  final ValueChanged<int> onItemTapped;
  @override
  State<CustomBottomNavigationBar> createState() =>
      _CustomBottomNavigationBarState();
}

class _CustomBottomNavigationBarState extends State<CustomBottomNavigationBar> {
  int selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 375.w,
      height: 70.h,
      decoration: ShapeDecoration(
        color: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(30.r),
            topRight: Radius.circular(30.r),
          ),
        ),
        shadows: [
          BoxShadow(
            color: Color(0x19000000),
            blurRadius: 25.r,
            offset: Offset(0, -2),
            spreadRadius: 0,
          )
        ],
      ),
      child: Row(
        children: bottomNavBarItems.asMap().entries.map((e) {
          var index = e.key;
          var entity = e.value;

          return Expanded(
            flex: index == selectedIndex ? 3 : 2,
            child: GestureDetector(
              onTap: () {
                setState(() {
                  selectedIndex = index;
                  widget.onItemTapped(index);
                });
              },
              child: NaivgationBarItem(
                isSelected: selectedIndex == index,
                bottomNavBarEntity: entity,
              ),
            ),
          );
        }).toList(),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:grocify/features/home/domain/entities/category_entity.dart';
import 'package:grocify/generated/l10n.dart';

class CategoryConatiner extends StatelessWidget {
  const CategoryConatiner({super.key, required this.cat});

  final CategoryEntity cat;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Container(
        width: 105.w,
        height: 143.h,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.r),
          gradient: LinearGradient(
            colors: [
              cat.color.withAlpha(100),
              cat.color,
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withAlpha(25),
              blurRadius: 3.r,
              offset: Offset(4, 4),
              spreadRadius: 0,
            )
          ],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            SizedBox(
              height: 16.h,
            ),
            Text(
              cat.name,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 12.sp,
              ),
            ),
            Spacer(),
            Image.asset(
              cat.img,
              width: (cat.name == S.current.houseCleaning ||
                      cat.name == S.current.beuty)
                  ? 95.w
                  : (cat.name == S.current.petsSupplies)
                      ? 90
                      : 105.w,
            ),
          ],
        ),
      ),
    );
  }
}

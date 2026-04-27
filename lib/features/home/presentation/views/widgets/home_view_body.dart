import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:grocify/core/widgets/search_text_field.dart';
import 'package:grocify/features/home/presentation/views/widgets/categories_row.dart';
import 'package:grocify/features/home/presentation/views/widgets/category_grid.dart';
import 'package:grocify/features/home/presentation/views/widgets/custom_app_bar.dart';
import 'package:grocify/features/home/presentation/views/widgets/discount_list.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 16.w, right: 16.w, top: 56.h),
      child: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: Column(
              children: [
                CustomAppBar(),
                SizedBox(
                  height: 16.h,
                ),
                SearchTextField(),
                SizedBox(
                  height: 12.h,
                ),
                DiscountList(),
                SizedBox(
                  height: 12.h,
                ),
                CategoriesRow(),
                SizedBox(
                  height: 12.h,
                ),
              ],
            ),
          ),
          CategoryGrid(),
          SliverToBoxAdapter(
            child: SizedBox(
              height: 80.h,
            ),
          ),
        ],
      ),
    );
  }
}

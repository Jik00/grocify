import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:grocify/core/utils/app_colors.dart';
import 'package:grocify/features/home/presentation/views/widgets/category_grid.dart';
import 'package:grocify/generated/l10n.dart';

class CategoriesView extends StatelessWidget {
  const CategoriesView({super.key});

  static const routeName = '/categories';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        foregroundColor: AppColors.primary,
        title: Text(S.current.categories),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.h),
        child: CustomScrollView(
          slivers: [
            const CategoryGrid(),
            SliverToBoxAdapter(
              child: SizedBox(
                height: 90.h,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

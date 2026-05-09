import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:grocify/core/helper_functions/filter_products_entities_by_id.dart';
import 'package:grocify/core/widgets/build_error_snack_bar.dart';
import 'package:grocify/core/widgets/custom_loading_bar.dart';
import 'package:grocify/features/products_&_fav/presentation/manager/fav_cubit/fav_cubit.dart';
import 'package:grocify/features/products_&_fav/presentation/views/widgets/no_fav.dart';
import 'package:grocify/features/products_&_fav/presentation/views/widgets/products_grid.dart';

class FavConsumer extends StatelessWidget {
  const FavConsumer({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<FavCubit, FavState>(
      listener: (context, state) {
        if (state is FavError) {
          buildErrorSnackBar(context, state.message);
        }
      },
      builder: (context, state) {
        if (state is FavLoading) {
          return const Center(child: CustomLoadingBar());
        }
        if (state is FavLoaded) {
          if (state.favs.isEmpty) {
            return const NoFav();
          }
          return Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.0.w),
            child: CustomScrollView(
              slivers: [
                ProductsGrid(products: filterProductsEntitiesById(state.favs)),
                SliverToBoxAdapter(
                  child: SizedBox(
                    height: 90.h,
                  ),
                ),
              ],
            ),
          );
        }
        return const SizedBox();
      },
    );
  }
}

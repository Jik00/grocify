import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:grocify/core/utils/app_colors.dart';
import 'package:grocify/features/products_&_fav/presentation/manager/fav_cubit/fav_cubit.dart';

class FavIcon extends StatelessWidget {
  const FavIcon({super.key, required this.productId});

  final String productId;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FavCubit, FavState>(
      builder: (context, state) {
        final isFav = context.read<FavCubit>().isFav(productId);
        return Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            IconButton(
              icon: Icon(
                isFav
                    ? Icons.favorite_outlined
                    : Icons.favorite_outline_outlined,
                color: isFav ? AppColors.red : AppColors.grayscale400,
              ),
              onPressed: () {
                context.read<FavCubit>().toggleFav(productId);
              },
            ),
          ],
        );
      },
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:grocify/core/services/navigation_service.dart';
import 'package:grocify/core/utils/app_colors.dart';
import 'package:grocify/core/entities/product_entity.dart';
import 'package:grocify/features/cart/presentation/manager/cart_cubit/cart_cubit.dart';
import 'package:grocify/features/products_&_fav/presentation/views/widgets/deatils_view.dart';
import 'package:grocify/features/products_&_fav/presentation/views/widgets/fav_icon.dart';
import 'package:grocify/features/products_&_fav/presentation/views/widgets/plus_icon.dart';
import 'package:grocify/generated/l10n.dart';

class ProductContainer extends StatelessWidget {
  const ProductContainer({super.key, required this.product});

  final ProductEntity product;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => NavigationService.navigateWithinTab(context, DetailsView.routeName, arguments: product),
      child: Stack(
        children: [
          Align(
            alignment: Alignment.topCenter,
            child: Padding(
              padding: (product.name == S.current.cadbury_dairy_milk)
                  ? EdgeInsets.only(top: 75.h)
                  : EdgeInsets.only(top: 40.h),
              child: Hero(
                tag: '${product.id}img',
                child: Image.asset(
                  product.image,
                  width: (product.id == '4' || product.id == '3') ? 50.w : 110.w,
                ),
              ),
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              FavIcon(productId: product.id),
              // Spacer(),
              SizedBox(
                height: 125.h,
              ),
              Hero(
                tag: '${product.id}price',
                child: Text(
                  product.price,
                  style: TextStyle(
                    fontSize: 14.sp,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Hero(
                tag: '${product.id}name',
                child: Text(
                  product.name,
                  style: TextStyle(
                    color: AppColors.grayscale400,
                    fontSize: 11.sp,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ],
          ),
          Positioned(
            right: 0,
            bottom: 60.h,
            child: PlusIcon( onTap: (){
              context.read<CartCubit>().addToCart( product);
            } ,),
          ),
        ],
      ),
    );
  }
}

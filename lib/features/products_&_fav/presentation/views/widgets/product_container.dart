import 'dart:developer';

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

class ProductContainer extends StatefulWidget {
  const ProductContainer(
      {super.key, required this.product, required this.onAddToCart});

  final ProductEntity product;
  final Function(GlobalKey) onAddToCart;

  @override
  State<ProductContainer> createState() => _ProductContainerState();
}

class _ProductContainerState extends State<ProductContainer> {
  final GlobalKey gkItemImg = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => NavigationService.navigateWithinTab(
        context,
        DetailsView.routeName,
        arguments: widget.product,
      ),
      child: Stack(
        children: [
          Align(
            alignment: Alignment.topCenter,
            child: Padding(
              padding: (widget.product.name == S.current.cadbury_dairy_milk)
                  ? EdgeInsets.only(top: 75.h)
                  : EdgeInsets.only(top: 40.h),
              child: Hero(
                tag: '${widget.product.id}img',
                child: Container(
                  key: gkItemImg,
                  child: Image.asset(
                    widget.product.image,
                    width:
                        (widget.product.id == '4' || widget.product.id == '3')
                            ? 50.w
                            : 110.w,
                  ),
                ),
              ),
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              FavIcon(productId: widget.product.id),
              // Spacer(),
              SizedBox(
                height: 125.h,
              ),
              Hero(
                tag: '${widget.product.id}price',
                child: Text(
                  widget.product.price,
                  style: TextStyle(
                    fontSize: 14.sp,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Hero(
                tag: '${widget.product.id}name',
                child: Text(
                  widget.product.name,
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
            child: BlocListener<CartCubit, CartState>(
              listener: (context, state) {
                if (state is CartSyncingAding &&
                    state.productId == widget.product.id) {
                  
                  widget.onAddToCart(gkItemImg);
                }
              },
              child: PlusIcon(
                onTap: () {
                  context.read<CartCubit>().addToCart(widget.product);
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}

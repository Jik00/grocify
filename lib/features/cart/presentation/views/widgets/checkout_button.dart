import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:grocify/core/services/navigation_service.dart';
import 'package:grocify/core/widgets/custom_container_full_w.dart';
import 'package:grocify/features/cart/presentation/manager/cart_cubit/cart_cubit.dart';
import 'package:grocify/features/checkout/presentation/views/checkout_view.dart';
import 'package:grocify/generated/l10n.dart';

class CheckoutButton extends StatelessWidget {
  const CheckoutButton({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap:() => NavigationService.navigateWithinTab(context, CheckoutView.routeName),
      child: CustomContainerFullWidth(
        child: Row(
          children: [
            Spacer(),
            Text(
              "\$${context.watch<CartCubit>().allCartEntity.calculateTotal().toStringAsFixed(2)}",
              style: TextStyle(
                fontSize: 16.sp,
                fontWeight: FontWeight.w600,
                color: Colors.white,
              ),
            ),
            Spacer(
              flex: 4,
            ),
            Text(
              S.current.checkout,
              style: TextStyle(
                fontSize: 16.sp,
                fontWeight: FontWeight.w600,
                color: Colors.white,
              ),
            ),
            SizedBox(width: 8.w),
            Icon(
              Icons.arrow_forward_ios,
              size: 16.sp,
              color: Colors.white,
            ),
            Spacer(),
          ],
        ),
      ),
    );
  }
}

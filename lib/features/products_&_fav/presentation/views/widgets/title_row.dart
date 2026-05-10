import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:grocify/features/cart/presentation/manager/cart_cubit/cart_cubit.dart';
import 'package:grocify/generated/l10n.dart';

class TitleRow extends StatelessWidget {
  const TitleRow({super.key});

  @override
 Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          S.current.cart,
          style: TextStyle(
            fontSize: 20.sp,
            fontWeight: FontWeight.bold,
          ),
        ),
        GestureDetector(
          onTap: () {
            context.read<CartCubit>().clearCart();
          },
          child: Row(
            children: [
              Text(
                S.current.clearAll,
                style: TextStyle(
                  fontSize: 14,
                  color: Colors.green,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

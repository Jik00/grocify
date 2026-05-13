import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:grocify/core/utils/app_colors.dart';
import 'package:grocify/features/checkout/presentation/views/widgets/edit_button.dart';
import 'package:grocify/generated/l10n.dart';

class OrderSummary extends StatelessWidget {
  const OrderSummary({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            S.current.orderSummary,
            style: TextStyle(
              fontSize: 18.sp,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 10.h),
          Container(
            width: double.infinity,
            padding: EdgeInsets.all(16.sp),
            color: AppColors.grayscale400.withAlpha(30),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _priceRow(S.current.subtotal, "\$ 180"),
                SizedBox(height: 16.h),
                _priceRow(S.current.delivery, "\$ 20"),
                Divider(height: 28.h),
                _priceRow(
                  S.current.total,
                  "\$ 200",
                  isBold: true,
                ),
              ],
            ),
          ),
          SizedBox(height: 18.h),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                S.current.payment,
                style: TextStyle(
                  fontSize: 16.sp,
                  fontWeight: FontWeight.bold,
                ),
              ),
              EditButton(),
            ],
          ),
          SizedBox(height: 10.h),
          Container(
            width: double.infinity,
            padding: EdgeInsets.all(14.sp),
            color: AppColors.grayscale400.withAlpha(30),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 14.h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      width: 65.w,
                      height: 45.h,
                      child: Container(
                        height: 60.h,
                        decoration: BoxDecoration(
                          color: const Color(0xff1434CB),
                          borderRadius: BorderRadius.circular(12),
                          border: Border.all(
                            color: Colors.blueGrey.withAlpha(140),
                          ),
                        ),
                        child: Center(
                          child: Text(
                            S.current.visa,
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 16.sp,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(width: 14.w),
                    Text(
                      "**** **** **** ",
                      style: TextStyle(
                        fontSize: 30.sp,
                        color: Colors.black87.withAlpha(160),
                      ),
                    ),
                    Transform.translate(
                      offset: Offset(0, -2.h),
                      child: Text(
                        "6522",
                        style: TextStyle(
                          fontSize: 20.sp,
                          color: Colors.black87.withAlpha(160),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _priceRow(
    String title,
    String value, {
    bool isBold = false,
  }) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: TextStyle(
            fontSize: isBold ? 20 : 18,
            fontWeight: isBold ? FontWeight.bold : FontWeight.w500,
          ),
        ),
        Text(
          value,
          style: TextStyle(
            fontSize: isBold ? 20 : 15,
            fontWeight: isBold ? FontWeight.bold : FontWeight.w500,
          ),
        ),
      ],
    );
  }
}

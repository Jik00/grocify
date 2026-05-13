import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:grocify/features/checkout/presentation/views/widgets/credit_card_form.dart';
import 'package:grocify/features/checkout/presentation/views/widgets/payment_method.dart';
import 'package:grocify/generated/l10n.dart';

class PayingSection extends StatefulWidget {
  const PayingSection({super.key});

  @override
  State<PayingSection> createState() => _PayingSectionState();
}

class _PayingSectionState extends State<PayingSection> {
  bool isChecked = false;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            "${S.current.paymentMethod} :",
            style: TextStyle(
              fontSize: 16.sp,
              fontWeight: FontWeight.bold,
            ),
          ),

          SizedBox(height: 12.h),

          Row(
            children: [
              PaymentMethod(
                child: Text(
                  S.current.payPal,
                  style: TextStyle(
                    fontSize: 18.sp,
                    fontWeight: FontWeight.bold,
                    color: Color(0xff003087),
                  ),
                ),
              ),
              SizedBox(width: 10.w),
              PaymentMethod(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      width: 26.w,
                      height: 26.h,
                      decoration: const BoxDecoration(
                        color: Colors.red,
                        shape: BoxShape.circle,
                      ),
                    ),
                    Transform.translate(
                      offset: const Offset(-10, 0),
                      child: Container(
                        width: 26.w,
                        height: 26.h,
                        decoration: BoxDecoration(
                          color: Colors.orange.withAlpha(230),
                          shape: BoxShape.circle,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(width: 10.w),
              PaymentMethod(
                backgroundColor: const Color(0xff1434CB),
                child: Text(
                  S.current.visa,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 24.sp,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),

          SizedBox(height: 18.h),

          CreditCardForm(),

          /// Virtual Card Checkbox
          Row(
            children: [
              Transform.scale(
                scale: 1.15,
                child: Checkbox(
                  value: isChecked,
                  onChanged: (value) {
                    setState(() {
                      isChecked = value!;
                    });
                  },
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(4.r)),
                  side: BorderSide(
                    color: Colors.black.withAlpha(40),
                  ),
                ),
              ),
              Text(
                S.current.makeCardVirtual,
                style: TextStyle(
                  fontSize: 14.sp,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

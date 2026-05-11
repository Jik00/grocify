import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:grocify/features/checkout/presentation/views/widgets/shipping_method.dart';
import 'package:grocify/generated/l10n.dart';

class ShippingSection extends StatefulWidget {
  const ShippingSection({super.key});

  @override
  State<ShippingSection> createState() => _ShippingSectionState();
}

class _ShippingSectionState extends State<ShippingSection> {
  bool option1 = false, option2 = false;
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        children: [
          GestureDetector(
            onTap: () {
              setState(() {
                option1 = true;
                option2 = false;
              });
            },
            child: ShippingMethod(
              title: S.current.cashOnDelivery,
              subtitle: S.current.cashOnDelivery,
              isSelected: option1,
            ),
          ),
          SizedBox(height: 8.h),
          GestureDetector(
            onTap: () {
              setState(() {
                option1 = false;
                option2 = true;
              });
            },
            child: ShippingMethod(
              title: S.current.creditCard,
              subtitle: S.current.creditCard,
              isSelected: option2,
            ),
          ),
        ],
      ),
    );
  }
}

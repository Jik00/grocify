import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:grocify/features/products_&_fav/presentation/views/widgets/plus_icon.dart';
import 'package:grocify/generated/l10n.dart';

class QuantitySelector extends StatefulWidget {
  const QuantitySelector({super.key});

  @override
  State<QuantitySelector> createState() => _QuantitySelectorState();
}

class _QuantitySelectorState extends State<QuantitySelector> {
  int count = 1;

  void increment() {
    setState(() => count++);
  }

  void decrement() {
    if (count > 1) {
      setState(() => count--);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 140.w,
      height: 50.h,
      padding: EdgeInsets.symmetric(horizontal: 12.w),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(40.r),
        border: Border.all(color: Colors.grey.withAlpha(100), width: 1.5.w),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          GestureDetector(
            onTap: decrement,
            child: Container(
              width: 28,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(color: Colors.green, width: 1.5),
                color: Colors.transparent,
              ),
              child: const Center(
                child: Icon(Icons.remove, color: Colors.green),
              ),
            ),
          ),

          // Text
          Text(
            "$count${S.current.pc}",
            style: TextStyle(
              fontSize: 18.sp,
              fontWeight: FontWeight.w500,
            ),
          ),

          // Plus button
          PlusIcon(
            onTap: increment,
          ),
        ],
      ),
    );
  }
}

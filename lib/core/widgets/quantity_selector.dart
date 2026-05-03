import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:grocify/features/products_&_fav/presentation/views/widgets/plus_icon.dart';
import 'package:grocify/generated/l10n.dart';

class QuantitySelector extends StatefulWidget {
  const QuantitySelector({super.key, required this.w, required this.sp});

  final double w, sp;

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
    final double w = widget.w - 4;
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        GestureDetector(
          onTap: decrement,
          child: Container(
            width: w.w,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(color: Colors.green, width: 1.5.w),
              color: Colors.transparent,
            ),
            child: Center(
              child: Icon(
                Icons.remove,
                color: Colors.green,
                size: widget.sp.sp,
              ),
            ),
          ),
        ),

        // Text
        Text(
          "$count${S.current.pc}",
          style: TextStyle(
            fontSize: widget.sp.sp,
            fontWeight: FontWeight.w500,
          ),
        ),

        // Plus button
        PlusIcon(
          onTap: increment,
          size: widget.w,
        ),
      ],
    );
  }
}

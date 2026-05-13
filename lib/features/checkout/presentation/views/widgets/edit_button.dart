import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:grocify/generated/l10n.dart';

class EditButton extends StatelessWidget {
  const EditButton({super.key});

  @override
  Widget build(BuildContext context) {
        return Row(
      children: [
        Icon(Icons.edit_outlined, size: 18.sp, color: Colors.grey),
        SizedBox(width: 4),
        Text(
          S.current.edit,
          style: TextStyle(
            color: Colors.grey,
            fontSize: 14,
            decoration: TextDecoration.underline,
          ),
        ),
      ],
    );
  }
}
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:grocify/core/utils/app_colors.dart';
import 'package:grocify/core/utils/context_extensions.dart';

class CustomFormTextfield extends StatelessWidget {
  const CustomFormTextfield(
      {super.key,
      required this.textInputType,
      required this.hintText,
      this.suffixIcon,
      this.prefixIcon,
      this.onSaved,
      this.obscure = false});

  final TextInputType textInputType;
  final String hintText;
  final Widget? suffixIcon;
  final Widget? prefixIcon;
  final void Function(String?)? onSaved;
  final bool obscure;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: obscure,
      onSaved: onSaved,
      validator: (value) {
        if (value == null || value.isEmpty) {
          return context.loc.requiredField;
        }
        if (textInputType == TextInputType.emailAddress) {
          final emailRegex = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
          if (!emailRegex.hasMatch(value)) {
            return context.loc.invalidEmail;
          }
        }
        return null;
      },
      keyboardType: textInputType,
      decoration: InputDecoration(
        labelText: hintText,
        helperText: " ",
        hintStyle: TextStyle(
          fontSize: 14.sp,
          color: AppColors.grayscale400,
          fontWeight: FontWeight.w700,
        ),
        prefixIcon: prefixIcon,
        suffixIcon: Padding(
          padding: EdgeInsets.only(left: 10.w),
          child: suffixIcon,
        ),
        filled: true,
        fillColor: AppColors.textFieldFillColor,
        enabled: true,
        enabledBorder: buildBorder(),
        border: buildBorder(),
      ),
    );
  }

  OutlineInputBorder buildBorder() {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(4.r),
      borderSide: const BorderSide(
        width: 1,
        color: AppColors.textFieldBorderColor,
      ),
    );
  }
}

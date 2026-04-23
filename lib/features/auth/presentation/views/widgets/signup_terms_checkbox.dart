import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:grocify/core/utils/app_colors.dart';
import 'package:grocify/core/utils/context_extensions.dart';

class SignupTermsCheckbox extends StatefulWidget {
  const SignupTermsCheckbox({super.key, required this.onTermsChanged});

  final ValueChanged<bool> onTermsChanged;

  @override
  State<SignupTermsCheckbox> createState() => _SignupTermsCheckboxState();
}

class _SignupTermsCheckboxState extends State<SignupTermsCheckbox> {
  bool isChecked = false;

  @override
  Widget build(BuildContext context) {
    return Transform.translate(
      offset: Offset(-15.w, 0),
      child: ListTile(
        horizontalTitleGap: 1,
        leading: Transform.scale(
          scale: 1.2,
          child: Checkbox(
              value: isChecked,
              onChanged: (value) {
                setState(() {
                  isChecked = value!;
                  widget.onTermsChanged(isChecked);
                });
              },
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(4.r)),
              side: BorderSide(
                color: Colors.black.withAlpha(25),
              )),
        ),
        title: Text.rich(
          TextSpan(children: [
            TextSpan(
              text: context.loc.makingAnAccount,
              style: TextStyle(
                fontSize: 14.sp,
                fontWeight: FontWeight.w600,
                color: AppColors.grayscale400,
              ),
            ),
            TextSpan(
              text: context.loc.termsAndConditions,
              style: TextStyle(
                fontSize: 14.sp,
                fontWeight: FontWeight.w600,
                color: AppColors.textColor,
                decoration: TextDecoration.underline,
              ),
            ),
          ]),
        ),
      ),
    );
  }
}

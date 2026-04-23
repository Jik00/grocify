import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:grocify/core/utils/app_images.dart';
import 'package:grocify/core/widgets/build_error_snack_bar.dart';
import 'package:grocify/core/utils/context_extensions.dart';
import 'package:grocify/core/widgets/custom_button.dart';
import 'package:grocify/core/widgets/custom_form_textfield.dart';
import 'package:grocify/core/widgets/password_field.dart';
import 'package:grocify/features/auth/presentation/cubits/signup_cubit/signup_cubit.dart';
import 'package:grocify/features/auth/presentation/views/widgets/no_account_widget.dart';
import 'package:grocify/features/auth/presentation/views/widgets/signup_terms_checkbox.dart';

class SignupViewBody extends StatefulWidget {
  const SignupViewBody({super.key});

  @override
  State<SignupViewBody> createState() => _SignupViewBodyState();
}

final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
late String name, email, password;
bool isChecked = false;
AutovalidateMode autovalidateMode = AutovalidateMode.disabled;

class _SignupViewBodyState extends State<SignupViewBody> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Form(
        key: _formKey,
        child: Column(
          children: [
            Transform.translate(
              offset: Offset(-120.w, 0),
              child: Text(
                context.loc.signUp,
                style: TextStyle(
                  fontSize: 24.sp,
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            SizedBox(height: 24.h),
            CustomFormTextfield(
                textInputType: TextInputType.name,
                hintText: context.loc.fullName,
                onSaved: (value) {
                  name = value!;
                }),
            SizedBox(height: 16.h),
            CustomFormTextfield(
              textInputType: TextInputType.emailAddress,
              hintText: context.loc.email,
              onSaved: (value) {
                email = value!;
              },
              prefixIcon: Image.asset(Assets.assetsImagesIconsEmail,
                  width: 16.w, height: 16.h),
            ),
            SizedBox(height: 16.h),
            PasswordField(
              onSaved: (value) {
                password = value!;
              },
            ),
            SizedBox(height: 16.h),
            SignupTermsCheckbox(onTermsChanged: (value) {
              isChecked = value;
            }),
            SizedBox(height: 33.h),
            CustomButton(
              hint: context.loc.signUp,
              onTap: () {
                if (_formKey.currentState!.validate()) {
                  if (isChecked) {
                    _formKey.currentState!.save();
                    context.read<SignupCubit>().createUserWithEmailAndPassword(
                        username: name, email: email, password: password);
                  } else {
                    buildErrorSnackBar(context, context.loc.acceptTerms);
                  }
                } else {
                  setState(() {
                    autovalidateMode = AutovalidateMode.always;
                  });
                }
              },
            ),
            SizedBox(height: 33.h),
            NoAccountWidget(
              text1: context.loc.haveAccount,
              text2: context.loc.loginTitle,
              onTap: () {
                Navigator.pop(context);
               // Navigator.pushNamed(context, SignInView.routeName);
              },
            ),
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:grocify/core/utils/app_colors.dart';
import 'package:grocify/core/utils/app_images.dart';
import 'package:grocify/core/utils/context_extensions.dart';
import 'package:grocify/core/widgets/custom_button.dart';
import 'package:grocify/core/widgets/custom_form_textfield.dart';
import 'package:grocify/core/widgets/password_field.dart';
import 'package:grocify/features/auth/presentation/cubits/signin_cubit/signin_cubit.dart';
import 'package:grocify/features/auth/presentation/views/signup_view.dart';
import 'package:grocify/features/auth/presentation/views/widgets/signin_with_listtile.dart';
import 'package:grocify/features/auth/presentation/views/widgets/no_account_widget.dart';
import 'package:grocify/features/auth/presentation/views/widgets/or_divider.dart';

class SignInViewBody extends StatefulWidget {
  const SignInViewBody({super.key});

  @override
  State<SignInViewBody> createState() => _SignInViewBodyState();
}

final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
AutovalidateMode autovalidateMode = AutovalidateMode.disabled;

late String email, password;

class _SignInViewBodyState extends State<SignInViewBody> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Form(
        key: _formKey,
        child: Column(
          children: [
            Transform.translate(
              offset: Offset(-130.w, 0),
              child: Text(
                context.loc.loginTitle,
                style: TextStyle(
                  fontSize: 24.sp,
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            SizedBox(height: 32.h),
            CustomFormTextfield(
              textInputType: TextInputType.emailAddress,
              hintText: context.loc.email,
              onSaved: (value) {
                email = value!;
              },
              prefixIcon: Image.asset(Assets.assetsImagesIconsEmail,
                  width: 16.w, height: 16.h),
            ),
            SizedBox(height: 18.h),
            PasswordField(
              onSaved: (value) {
                password = value!;
              },
            ),
            SizedBox(height: 16.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text(
                  context.loc.forgotPassword,
                  style: TextStyle(
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w600,
                    color: AppColors.grayscale400,
                  ),
                ),
              ],
            ),
            SizedBox(height: 33.h),
            CustomButton(
              hint: context.loc.loginTitle,
              onTap: () {
                if (_formKey.currentState!.validate()) {
                  _formKey.currentState!.save();
    
                  context.read<SignInCubit>().signInWithEmailAndPassword(
                      email: email, password: password);
                } else {
                  setState(() {
                    autovalidateMode = AutovalidateMode.always;
                  });
                }
              },
            ),
            SizedBox(height: 33.h),
            NoAccountWidget(
              text1: context.loc.noAccount,
              text2: context.loc.signUp,
              onTap: () {
                Navigator.pushNamed(context, SignupView.routeName);
              },
            ),
            SizedBox(height: 33.h),
            const OrDivider(),
            SizedBox(height: 21.h),
            SignInWithListtile(
              title: context.loc.loginWithGoogle,
              icon: Assets.assetsImagesIconsGoogleIcons,
              onTap: () {
                context.read<SignInCubit>().signInWithGoogle();
              },
            ),
            SizedBox(
              height: 16.h,
            ),
            SignInWithListtile(
              title: context.loc.loginWithFacebook,
              icon: Assets.assetsImagesIconsFacebookIcons,
              onTap: () {
                // context.read<SignInCubit>().signInWithFacebook();
              },
            ),
          ],
        ),
      ),
    );
  }
}

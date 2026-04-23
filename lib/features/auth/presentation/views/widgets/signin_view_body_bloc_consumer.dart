import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:grocify/core/widgets/build_error_snack_bar.dart';
import 'package:grocify/core/widgets/custom_loading_bar.dart';
import 'package:grocify/features/auth/presentation/views/widgets/customized_ui.dart';
import 'package:grocify/features/auth/presentation/views/widgets/signin_view_body.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import '../../cubits/signin_cubit/signin_cubit.dart';

class SigninViewBodyBlocConsumer extends StatelessWidget {
  const SigninViewBodyBlocConsumer({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SignInCubit, SignInState>(
      listener: (context, state) {
        if (state is SignInSuccess) {
          
        }
        if (state is SignInFailure) {
          buildErrorSnackBar(context, state.message);
        }
      },
      builder: (context, state) {
        return ModalProgressHUD(
          progressIndicator: const CustomLoadingBar(),
          inAsyncCall: state is SignInLoading ? true : false,
          child: CustomizedUI( child: SignInViewBody()),
        );
      },
    );
  }
}

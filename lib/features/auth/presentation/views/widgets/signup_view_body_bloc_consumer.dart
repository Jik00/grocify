import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:grocify/core/services/navigation_service.dart';
import 'package:grocify/core/widgets/custom_loading_bar.dart';
import 'package:grocify/features/auth/presentation/manger/signup_cubit/signup_cubit.dart';
import 'package:grocify/features/auth/presentation/views/widgets/customized_ui.dart';
import 'package:grocify/features/auth/presentation/views/widgets/signup_view_body.dart';
import 'package:grocify/features/home/presentation/views/main_layout.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

import '../../../../../core/widgets/build_error_snack_bar.dart';

class SignUpViewBodyBlocConsumer extends StatelessWidget {
  const SignUpViewBodyBlocConsumer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SignupCubit, SignupState>(
      listener: (context, state) {
        if (state is SignupSuccess) {
          NavigationService.navigateToGlobal( MainLayout.routeName);
        }
        if (state is SignupFailure) {
          buildErrorSnackBar(context, state.message);
        }
      },
      builder: (context, state) {
        return ModalProgressHUD(
          progressIndicator: const CustomLoadingBar(),
          inAsyncCall: state is SignupLoading ? true : false,
          child: CustomizedUI(child:  SignupViewBody()),
        );
      },
    );
  }
}

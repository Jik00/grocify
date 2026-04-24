import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:grocify/features/auth/presentation/manger/signin_cubit/signin_cubit.dart';
import 'package:grocify/features/auth/presentation/views/widgets/signin_view_body_bloc_consumer.dart';
import '../../../../core/services/get_it_service.dart';
import '../../domain/repos/auth_repo.dart';

class SignInView extends StatelessWidget {
  const SignInView({super.key});

  static const routeName = 'login';

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SignInCubit(getIt<AuthRepo>()),
      child: Scaffold(
        body: const SigninViewBodyBlocConsumer(),
      ),
    );
  }
}

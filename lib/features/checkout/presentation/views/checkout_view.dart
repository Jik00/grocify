import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:grocify/core/services/get_it_service.dart';
import 'package:grocify/features/checkout/domain/entities/step_entity.dart';
import 'package:grocify/features/checkout/domain/repos/location_repo.dart';
import 'package:grocify/features/checkout/presentation/manager/cubit/location_cubit.dart';
import 'package:grocify/features/checkout/presentation/views/widgets/build_appbar.dart';
import 'package:grocify/features/checkout/presentation/views/widgets/checkout_view_body.dart';

class CheckoutView extends StatefulWidget {
  const CheckoutView({super.key});

  static const routeName = '/checkout';

  @override
  State<CheckoutView> createState() => _CheckoutViewState();
}

class _CheckoutViewState extends State<CheckoutView> {
  int currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LocationCubit(
        locationRepo: getIt<LocationRepo>(),
      )..getCurrentLocation(),

      child: Scaffold(
        resizeToAvoidBottomInset: true,
        appBar: buildAppBar(
          context,
          title: stepsEntities[currentIndex].title,
        ),
        body: CheckoutViewBody( 
          onStepChange: (value) => setState(() => currentIndex = value),
        ),
        
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:grocify/core/services/get_it_service.dart';
import 'package:grocify/features/cart/presentation/manager/cart_cubit/cart_cubit.dart';
import 'package:grocify/features/checkout/domain/entities/order_entity.dart';
import 'package:grocify/features/checkout/domain/repos/location_repo.dart';
import 'package:grocify/features/checkout/presentation/manager/cubit/location_cubit.dart';
import 'package:grocify/features/checkout/presentation/views/widgets/checkout_appbar.dart';
import 'package:grocify/features/checkout/presentation/views/widgets/checkout_view_body.dart';
import 'package:provider/provider.dart';

class CheckoutView extends StatelessWidget {
  const CheckoutView({super.key});

  static const routeName = '/checkout';

  @override
  Widget build(BuildContext context) {
    final currentIndexValueNotifier = ValueNotifier<int>(0);

    return BlocProvider(
      create: (context) => LocationCubit(
        locationRepo: getIt<LocationRepo>(),
      )..getCurrentLocation(),


      child: Scaffold(
        resizeToAvoidBottomInset: true,
        appBar: buildAppBar(
          context,
          currentIndexValueNotifier: currentIndexValueNotifier,
        ),

        body: Provider.value(
          value: OrderEntity(
            cartEntity: context.read<CartCubit>().state.cart,
          ),
          child: CheckoutViewBody(
            currentIndexValueNotifier: currentIndexValueNotifier,
          ),
        ),

      ),
    );
  }
}

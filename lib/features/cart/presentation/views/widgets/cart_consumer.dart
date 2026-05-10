import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:grocify/core/widgets/build_error_snack_bar.dart';
import 'package:grocify/core/widgets/custom_loading_bar.dart';
import 'package:grocify/features/cart/presentation/manager/cart_cubit/cart_cubit.dart';
import 'package:grocify/features/cart/presentation/views/widgets/cart_items_list.dart';
import 'package:grocify/features/cart/presentation/views/widgets/cart_view_body.dart';
import 'package:grocify/features/cart/presentation/views/widgets/no_cart.dart';

class CartConsumer extends StatelessWidget {
  const CartConsumer({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<CartCubit, CartState>(
      listener: (context, state) {
        if (state is CartSyncFailed) {
          buildErrorSnackBar(context, state.error);
        }
      },
      builder: (context, state) {
        // if (state is CartLoading ) {
        //   return const Center(child: CustomLoadingBar());
        // }
        if (state is CartReady) {
          if (state.cart.cartItems.isEmpty) {
            return const NoCart();
          }else 
          {return CartViewBody(cart: state.cart);}
        }
        return const SizedBox();
      },
    );
  }
}

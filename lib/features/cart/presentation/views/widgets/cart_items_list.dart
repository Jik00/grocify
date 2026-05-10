import 'package:flutter/widgets.dart';
import 'package:grocify/features/cart/domain/entities/all_cart_entity.dart';
import 'package:grocify/features/cart/presentation/views/widgets/cart_slidable.dart';

class CartItemsList extends StatelessWidget {
  const CartItemsList({super.key, required this.cart});

  final AllCartEntity cart;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      itemCount: cart.cartItems.length,
      itemBuilder: (context, index) {
        return CartSlidable(cartItemEntity: cart.cartItems[index]);
      },
    );
  }
}

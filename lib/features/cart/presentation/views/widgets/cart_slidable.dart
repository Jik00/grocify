import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:grocify/core/entities/product_entity.dart';
import 'package:grocify/core/utils/app_colors.dart';
import 'package:grocify/features/cart/presentation/views/widgets/cart_item_container.dart';
import 'package:grocify/generated/l10n.dart';

class CartSlidable extends StatelessWidget {
  const CartSlidable({super.key});

  @override
  Widget build(BuildContext context) {
    return Slidable(
      // Specify a key if the Slidable is dismissible.
      key: const ValueKey(0),

      // The end action pane is the one at the right or the bottom side.
      endActionPane: ActionPane(
        motion: const BehindMotion(),
        children: [
          SlidableAction(
            onPressed: (context) {},
            backgroundColor: AppColors.darkRedForErrorcolor,
            foregroundColor: Colors.white,
            icon: Icons.delete,
            label: S.current.delete,
          ),
        ],
      ),

      // The child of the Slidable is what the user sees when the
      // component is not dragged.
      child: CartItemContainer(
        product: productsEntities[0],
      ),
    );
  }
}

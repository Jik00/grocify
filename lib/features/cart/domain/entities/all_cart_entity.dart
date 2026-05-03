import 'package:grocify/core/entities/product_entity.dart';
import 'package:grocify/features/cart/domain/entities/cart_item_entity.dart';

class AllCartEntity {
  final List<CartItemEntity> cartItems;
  //final double totalAmount;
  AllCartEntity({
    required this.cartItems,
    // required this.totalAmount,
  });

  void addCartItem(CartItemEntity cartItem) => cartItems.add(cartItem);

  bool doesExist(ProductEntity product) {
    return cartItems.any((element) => element.product.id == product.id);
  }

  CartItemEntity getCartItem(ProductEntity product) {
    return cartItems.firstWhere(
      (element) => element.product.id == product.id,
      orElse: () => CartItemEntity(product: product, count: 1),
    );
  }
}

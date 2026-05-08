import 'package:grocify/core/entities/product_entity.dart';
import 'package:grocify/features/cart/domain/entities/cart_item_entity.dart';

class AllCartEntity {
  final List<CartItemEntity> cartItems;

  AllCartEntity({
    required this.cartItems,
  });

  void addCartItem(CartItemEntity cartItem) => cartItems.add(cartItem);

  void removeCartItem(CartItemEntity cartItem) => cartItems.remove(cartItem);

  void clearCart() => cartItems.clear();

  bool doesExist(ProductEntity product) {
    return cartItems.any((element) => element.product.id == product.id);
  }

  CartItemEntity getCartItem(ProductEntity product) {
    return cartItems.firstWhere(
      (element) => element.product.id == product.id,
      orElse: () => CartItemEntity(product: product, count: 1),
    );
  }

  double calculateTotal() {
    double total = 0.0;
    for (var element in cartItems) {
      total += element.total;
    }
    return total;
  }
}

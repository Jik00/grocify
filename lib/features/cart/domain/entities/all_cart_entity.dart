import 'package:grocify/core/entities/product_entity.dart';
import 'package:grocify/features/cart/domain/entities/cart_item_entity.dart';

class AllCartEntity {
  final List<CartItemEntity> cartItems;

  const AllCartEntity({required this.cartItems});

  AllCartEntity addCartItem(CartItemEntity item) =>
      copyWith(cartItems: [...cartItems, item]);

  AllCartEntity removeCartItem(CartItemEntity item) =>
      copyWith(cartItems: cartItems.where((e) => e != item).toList());

  AllCartEntity updateCartItem(CartItemEntity updated) =>
      copyWith(cartItems: cartItems.map((e) => e.product.id == updated.product.id ? updated : e).toList());

  AllCartEntity clearCart() => copyWith(cartItems: []);

  bool doesExist(ProductEntity product) =>
      cartItems.any((e) => e.product.id == product.id);

  CartItemEntity getCartItem(ProductEntity product) =>
      cartItems.firstWhere(
        (e) => e.product.id == product.id,
        orElse: () => CartItemEntity(product: product, count: 1),
      );

  AllCartEntity copyWith({List<CartItemEntity>? cartItems}) =>
      AllCartEntity(cartItems: cartItems ?? this.cartItems);

  double calculateTotal() =>
      cartItems.fold(0.0, (sum, e) => sum + e.total);
}
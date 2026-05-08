part of 'cart_item_cubit.dart';

abstract class CartItemState extends Equatable {
  final AllCartEntity cart;
  const CartItemState(this.cart);

  @override
  List<Object?> get props => [cart];
}

class CartItemInitial extends CartItemState {
  const CartItemInitial(super.cart);
}

class CartItemUpdated extends CartItemState {
  const CartItemUpdated(super.cart);
}

class CartItemSyncing extends CartItemState {
  final String productId;
  const CartItemSyncing(super.cart, {required this.productId});
}

class CartItemSyncFailed extends CartItemState {
  // rollback
  final String error;
  final AllCartEntity previousCart; // to rollback to
  const CartItemSyncFailed(super.cart, this.previousCart, this.error);

  @override
  List<Object?> get props => [cart, previousCart, error];
}

part of 'cart_cubit.dart';

abstract class CartState extends Equatable {
  final AllCartEntity cart;
  const CartState(this.cart);

  @override
  List<Object?> get props => [cart];
}

class CartInitial extends CartState {
  const CartInitial() : super(const AllCartEntity(cartItems: []));
}

class CartLoading extends CartState {
  const CartLoading(super.cart);
}

class CartReady extends CartState {
  const CartReady(super.cart);
}

// optimistic update in flight
class CartSyncing extends CartState {
  final String productId;
  const CartSyncing(super.cart, {required this.productId});

  @override
  List<Object?> get props => [cart, productId];
}
class CartItemUpdate extends CartState {
  final String productId;
  const CartItemUpdate(super.cart, {required this.productId});

  @override
  List<Object?> get props => [cart, productId];
}
class CartSyncingAding extends CartState {
  final String productId;
  const CartSyncingAding(super.cart, {required this.productId});

  @override
  List<Object?> get props => [cart, productId];
}

// sync failed, rolled back
class CartSyncFailed extends CartState {
  final String error;
  const CartSyncFailed(super.cart, {required this.error});

  @override
  List<Object?> get props => [cart, error];
}
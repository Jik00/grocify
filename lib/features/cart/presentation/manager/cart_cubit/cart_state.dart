part of 'cart_cubit.dart';

sealed class CartState extends Equatable {
  const CartState();

  @override
  List<Object> get props => [];
}

final class CartInitial extends CartState {}

final class CartItemAdded extends CartState {
  final String productId;

  const CartItemAdded({required this.productId});
}

final class CartItemRemoved extends CartState {}

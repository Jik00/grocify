import 'dart:developer';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:grocify/core/entities/product_entity.dart';
import 'package:grocify/features/cart/domain/entities/all_cart_entity.dart';
import 'package:grocify/features/cart/domain/entities/repos/cart_repo.dart';

part 'cart_state.dart';

class CartCubit extends Cubit<CartState> {
  CartCubit({required this.cartRepo, required this.userId}) : super(CartInitial());

  final String userId;
  final CartRepo cartRepo;

  AllCartEntity allCartEntity = AllCartEntity(cartItems: []);

  void addToCart(ProductEntity product) {
    emit(CartInitial());
    bool isProductExist = allCartEntity.doesExist(product);

    var cartItem = allCartEntity.getCartItem(product);
    if (isProductExist) {
      cartItem.increaseCount();
    } else {
      allCartEntity.addCartItem(cartItem);
    }
    log(allCartEntity.cartItems.length.toString());
    emit(CartItemAdded( productId: product.id));
  }
}

import 'dart:developer';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:grocify/core/entities/product_entity.dart';
import 'package:grocify/features/cart/domain/entities/all_cart_entity.dart';
import 'package:grocify/features/cart/domain/entities/cart_item_entity.dart';
import 'package:grocify/features/cart/domain/entities/repos/cart_repo.dart';

part 'cart_item_state.dart';

class CartItemCubit extends Cubit<CartItemState> {
  CartItemCubit({required this.cartRepo, required this.userId})
      : super(CartItemInitial(AllCartEntity(cartItems: [])));

  final String userId;
  final CartRepo cartRepo;

  AllCartEntity allCartEntity = AllCartEntity(cartItems: []);

  void addToCart(ProductEntity product) async {
    final previousCart = allCartEntity;

    bool isProductExist = allCartEntity.doesExist(product);

    allCartEntity = isProductExist
        ? allCartEntity
            .updateCartItem(allCartEntity.getCartItem(product).increaseCount())
        : allCartEntity.addCartItem(CartItemEntity(product: product));

    emit(CartItemSyncing(allCartEntity, productId: product.id));

    log(allCartEntity.calculateTotal().toString());

    if (isProductExist) {
      try {
        await cartRepo.updateCart(product.id, userId, allCartEntity.getCartItem(product).count.toString());
        emit(CartItemUpdated(allCartEntity));
      } catch (e) {
        allCartEntity = previousCart;
        emit(CartItemSyncFailed(allCartEntity, previousCart, e.toString()));
      }
    } else {
      try {
        await cartRepo.addToCart(product.id, userId);
        emit(CartItemUpdated(allCartEntity));
      } catch (e) {
        allCartEntity = previousCart;
        emit(CartItemSyncFailed(allCartEntity, previousCart, e.toString()));
      }
    }
  }


}








////////// the unoptimistic version

// void addToCart(ProductEntity product) async {
//     emit(CartInitial());
//     bool isProductExist = allCartEntity.doesExist(product);

//     var cartItem = allCartEntity.getCartItem(product);
//     if (isProductExist) {
//       cartItem.increaseCount();
//     } else {
//       allCartEntity.addCartItem(cartItem);
//       await cartRepo.addToCart(product.id, userId);
//     }
//     log(allCartEntity.cartItems.length.toString());
//     emit(CartItemAdded( productId: product.id));
//   }
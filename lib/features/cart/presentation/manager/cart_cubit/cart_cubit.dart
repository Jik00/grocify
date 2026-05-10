import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:grocify/core/entities/product_entity.dart';
import 'package:grocify/features/cart/domain/entities/all_cart_entity.dart';
import 'package:grocify/features/cart/domain/entities/cart_item_entity.dart';
import 'package:grocify/features/cart/domain/entities/repos/cart_repo.dart';

part 'cart_state.dart';

class CartCubit extends Cubit<CartState> {
  CartCubit({required this.cartRepo, required this.userId})
      : super(CartInitial());

  final String userId;
  final CartRepo cartRepo;

  AllCartEntity allCartEntity = AllCartEntity(cartItems: []);

  Future<void> loadCart() async {
    emit(CartLoading(allCartEntity));

    final result = await cartRepo.loadCart(userId);

    result.fold(
      (e) => emit(CartSyncFailed(allCartEntity, error: e.message)),
      (cart) {
        allCartEntity = cart;
        emit(CartReady(cart));
      },
    );
  }

  Future<void> clearCart() async {
    emit(CartLoading(allCartEntity));

    final result = await cartRepo.clearCart(userId);

    result.fold(
      (e) => emit(CartSyncFailed(allCartEntity, error: e.message)),
      (_) {
        allCartEntity = AllCartEntity(cartItems: []);
        emit(CartReady(allCartEntity));
      },
    );
  }

  Future<void> addToCart(ProductEntity product) async {
    final previousCart = allCartEntity;
    final isExisting = allCartEntity.doesExist(product);

    allCartEntity = isExisting
        ? allCartEntity
            .updateCartItem(allCartEntity.getCartItem(product).increaseCount())
        : allCartEntity.addCartItem(CartItemEntity(product: product));

    emit(CartSyncingAding(allCartEntity, productId: product.id));

    try {
      if (isExisting) {
        await cartRepo.updateCart(
            product.id, userId, allCartEntity.getCartItem(product).count);
      } else {
        await cartRepo.addToCart(product.id, userId);
      }
      emit(CartReady(allCartEntity));
    } catch (e) {
      allCartEntity = previousCart;
      emit(CartSyncFailed(previousCart, error: e.toString()));
    }
  }

  Future<void> decrementFromCart(ProductEntity product) async {
    final previousCart = allCartEntity;

    allCartEntity = allCartEntity.getCartItem(product).count > 1
        ? allCartEntity
            .updateCartItem(allCartEntity.getCartItem(product).decreaseCount())
        : allCartEntity.removeCartItem(CartItemEntity(product: product));

    emit(CartSyncing(allCartEntity, productId: product.id));

    try {
      if (previousCart.getCartItem(product).count == 1) {
        await cartRepo.removeFromCart(product.id, userId);
      } else {
        await cartRepo.updateCart(
            product.id, userId, allCartEntity.getCartItem(product).count);
      }
      emit(CartReady(allCartEntity));
    } catch (e) {
      allCartEntity = previousCart;
      emit(CartSyncFailed(previousCart, error: e.toString()));
    }
  }

  Future<void> deleteFromCart(ProductEntity product) async {
    final previousCart = allCartEntity;

    allCartEntity =
        allCartEntity.removeCartItem(CartItemEntity(product: product));

    emit(CartSyncing(allCartEntity, productId: product.id));

    try {
      await cartRepo.removeFromCart(product.id, userId);

      emit(CartReady(allCartEntity));
    } catch (e) {
      allCartEntity = previousCart;
      emit(CartSyncFailed(previousCart, error: e.toString()));
    }
  }

  Future<void> updateItemInCart(CartItemEntity cartItem) async {
    final previousCart = allCartEntity;

    allCartEntity = allCartEntity.updateCartItem(cartItem);
    emit(CartSyncing(allCartEntity, productId: cartItem.product.id));

    try {
      await cartRepo.updateCart(cartItem.product.id, userId, cartItem.count);

      emit(CartReady(allCartEntity));
    } catch (e) {
      allCartEntity = previousCart;
      emit(CartSyncFailed(previousCart, error: e.toString()));
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
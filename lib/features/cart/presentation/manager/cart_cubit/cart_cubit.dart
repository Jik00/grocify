import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:grocify/core/entities/product_entity.dart';
import 'package:grocify/features/cart/domain/entities/all_cart_entity.dart';

part 'cart_state.dart';

class CartCubit extends Cubit<CartState> {
  CartCubit() : super(CartInitial());

  AllCartEntity cartEntity = AllCartEntity(cartItems: []);

  void addToCart(ProductEntity product) {
    bool isProductExist = cartEntity.doesExist(product);
    
    var cartItem = cartEntity.getCartItem(product);
    if (isProductExist) {
      cartItem.increaseCount();
    } else {
      cartEntity.addCartItem(cartItem);
    }
    emit(CartItemAdded());
  }
}

import 'package:equatable/equatable.dart';
import 'package:grocify/core/entities/product_entity.dart';

class CartItemEntity extends Equatable {
  final ProductEntity product;
  final int count;

  const CartItemEntity({required this.product, this.count = 1});

  double get total => (double.parse(product.price) * count).roundToDouble();

  CartItemEntity increaseCount() => copyWith(count: count + 1);

  CartItemEntity decreaseCount() => copyWith(count: count - 1);

  CartItemEntity copyWith({ProductEntity? product, int? count}) {
    return CartItemEntity(
      product: product ?? this.product,
      count: count ?? this.count,
    );
  }

  @override
  List<Object?> get props => [product];
}
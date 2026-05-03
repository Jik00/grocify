import 'package:grocify/core/entities/product_entity.dart';

class CartItemEntity {

  final ProductEntity product;
  int count;

  CartItemEntity({required this.product, this.count =1});

  String get total => ( int.parse(product.price) * count).toStringAsFixed(2);

  void increaseCount() => count + 1;

  void decreaseCount(){ 
    
    (count > 1)? count - 1 : count ;
    
  }
  
}
import 'package:grocify/features/cart/domain/entities/all_cart_entity.dart';

class OrderEntity {
  final String id = DateTime.now().millisecondsSinceEpoch.toString();
  final AllCartEntity cartEntity;
  String? location;
  bool? payWithCash;

  OrderEntity(
      {required this.cartEntity, this.location, this.payWithCash});
}

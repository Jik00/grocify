import 'package:grocify/core/entities/product_entity.dart';

List<ProductEntity> filterFavProductsEntities( Set<String> favIds) {
  return productsEntities.where ((element) => favIds.contains(element.id)).toList();
}
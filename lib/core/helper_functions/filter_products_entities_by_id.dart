import 'package:grocify/core/entities/product_entity.dart';

List<ProductEntity> filterProductsEntitiesById(Set<String> ids) {
  return productsEntities
      .where((element) => ids.contains(element.id))
      .toList();
}

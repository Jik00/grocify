import 'package:grocify/core/utils/app_images.dart';
import 'package:grocify/generated/l10n.dart';

class ProductEntity {
  final String name;
  final String price;
  final String image;
  final String description;
  final String id;

  ProductEntity({
    required this.name,
    required this.price,
    required this.image,
    required this.description, required this.id,
  });
}

List<ProductEntity> get products => [
      ProductEntity(
        name: S.current.galaxy_chocolate_vegan,
        price: S.current.price_1,
        image: Assets.assetsImagesChocolate5,
        description: S.current.description_galaxy_dark,
        id: '0',
      ),
      ProductEntity(
        name: S.current.galaxy_dark_chocolate_70_cocoa,
        price: S.current.price_2,
        image: Assets.assetsImagesChocolate1,
        description: S.current.description_galaxy_dark,
        id: '1',
      ),
      ProductEntity(
        name: S.current.galaxy_chocolate,
        price: S.current.price_3,
        image: Assets.assetsImagesChocolate9,
        description: S.current.description_galaxy_dark,
        id: '2',
      ),
      ProductEntity(
        name: S.current.cadbury_dairy_milk_oreo,
        price: S.current.price_7,
        image: Assets.assetsImagesChocolate8,
        description: S.current.description_galaxy_dark,
        id: '3',
      ),
      ProductEntity(
        name: S.current.cadbury_dairy_milk_caramel,
        price: S.current.price_8,
        image: Assets.assetsImagesChocolate4,
        description: S.current.description_galaxy_dark,
        id: '4',
      ),
      ProductEntity(
        name: S.current.cadbury_dairy_milk,
        price: S.current.price_9,
        image: Assets.assetsImagesChocolate3,
        description: S.current.description_galaxy_dark,
        id: '5',
      ),
      ProductEntity(
        name: S.current.kinder_chocolate_maxi,
        price: S.current.price_4,
        image: Assets.assetsImagesChocolate6,
        description: S.current.description_galaxy_dark,
        id: '6',
      ),
      ProductEntity(
        name: S.current.kinder_chocolate_bueno,
        price: S.current.price_5,
        image: Assets.assetsImagesChocolate7,
        description: S.current.description_galaxy_dark,
        id: '7',
      ),
      ProductEntity(
        name: S.current.kinder_chocolate_bueno_mini,
        price: S.current.price_6,
        image: Assets.assetsImagesChocolate2,
        description: S.current.description_galaxy_dark,
        id: '8',
      ),
    ];

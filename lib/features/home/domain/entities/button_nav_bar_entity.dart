import 'package:grocify/core/utils/app_images.dart';
import 'package:grocify/generated/l10n.dart';

class ButtomNavBarEntity {
  final String activeImg, inActiveImg, name;
  // routeName;

  ButtomNavBarEntity({
    required this.name,
    required this.activeImg,
    required this.inActiveImg,
    //required this.routeName,
  });
}

List<ButtomNavBarEntity> get bottomNavBarItems => [
      ButtomNavBarEntity(
        name: S.current.home,
        activeImg: Assets.assetsImagesIconsHomeBold,
        inActiveImg: Assets.assetsImagesIconsHomeOutline,
        // routeName: HomeView.routeName,
      ),
      ButtomNavBarEntity(
        name: S.current.fav,
        activeImg: Assets.assetsImagesIconsHeartBold,
        inActiveImg: Assets.assetsImagesIconsHeartOutline,
        //  routeName: ProductsView.routeName,
      ),
      ButtomNavBarEntity(
        name: S.current.cart,
        activeImg: Assets.assetsImagesIconsCartBold,
        inActiveImg: Assets.assetsImagesIconsCartOutline,
        //  routeName: CartView.routeName,
      ),
      ButtomNavBarEntity(
        name: S.current.profile,
        activeImg: Assets.assetsImagesIconsUserBold,
        inActiveImg: Assets.assetsImagesIconsUserOutline,
        //  routeName: ProfileView.routeName,
      ),
    ];

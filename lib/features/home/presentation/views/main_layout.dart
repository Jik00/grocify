import 'package:add_to_cart_animation/add_to_cart_animation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:grocify/core/services/get_it_service.dart';
import 'package:grocify/core/services/navigation_service.dart';
import 'package:grocify/core/utils/globals.dart';
import 'package:grocify/features/auth/presentation/manger/auth_controller/auth_controller.dart';
import 'package:grocify/features/cart/presentation/manager/cart_item_cubit/cart_item_cubit.dart';
import 'package:grocify/features/products_&_fav/presentation/manager/fav_cubit/fav_cubit.dart';
import 'package:grocify/features/home/presentation/views/widgets/custom_bottom_navigation_bar.dart';
import 'package:grocify/features/home/presentation/views/widgets/main_layout_body.dart';

class MainLayout extends StatefulWidget {
  const MainLayout({super.key});

  @override
  State<MainLayout> createState() => _MainLayoutState();

  static const String routeName = 'main_layout';
}

class _MainLayoutState extends State<MainLayout> {
  int currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    final userId = context.read<AuthController>().userId;
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => getIt<FavCubit>(
            param1: userId,
          )..loadFav(),
        ),
        BlocProvider(
          create: (context) => getIt<CartItemCubit>(
            param1: userId,
          ),
        ),
      ],
      child: AddToCartAnimation(
        cartKey: gkCart,
        height: 20,
        width: 20,
        opacity: 0.85,
        dragAnimation: const DragToCartAnimationOptions(
          rotation: false,
          duration: Duration(milliseconds: 600),
        ),
        jumpAnimation: const JumpAnimationOptions(
          duration: Duration(milliseconds: 300),
        ),
        createAddToCartAnimation: (animation) {
          runAddToCartAnimation = animation;
        },
        child: Scaffold(
          extendBody: true,
          extendBodyBehindAppBar: true,
          bottomNavigationBar: CustomBottomNavigationBar(
            onItemTapped: (index) {
              NavigationService.handleTabTap(
                index: index,
                currentIndex: currentIndex,
                onTabChanged: (newIndex) {
                  setState(() {
                    currentIndex = newIndex;
                  });
                },
              );
            },
          ),
          body: MainLayoutBody(
            currentViewIndex: currentIndex,
          ),
        ),
      ),
    );
  }
}

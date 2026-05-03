import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:grocify/core/services/get_it_service.dart';
import 'package:grocify/core/services/navigation_service.dart';
import 'package:grocify/features/cart/presentation/manager/cart_cubit/cart_cubit.dart';
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
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => getIt<FavCubit>()..loadFav(),
        ),
        BlocProvider(
          create: (context) => getIt<CartCubit>(),
        ),
      ],
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
    );
  }
}

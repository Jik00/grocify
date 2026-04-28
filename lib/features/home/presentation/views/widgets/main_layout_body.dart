import 'package:flutter/material.dart';
import 'package:grocify/core/helper_functions/ongenerate_routes.dart';
import 'package:grocify/core/services/navigation_service.dart';
import 'package:grocify/features/home/presentation/views/home_view.dart';

class MainLayoutBody extends StatefulWidget {
  const MainLayoutBody({super.key, required this.currentViewIndex});

  final int currentViewIndex;

  @override
  State<MainLayoutBody> createState() => _MainLayoutBodyState();
}

class _MainLayoutBodyState extends State<MainLayoutBody> {

  @override
  Widget build(BuildContext context) {
    return IndexedStack(
      index: widget.currentViewIndex,
      children: [
        
        HeroControllerScope(
          controller: MaterialApp.createMaterialHeroController(),
          child: _buildNavigator(0, HomeView.routeName),
        ),
        // _buildNavigator(1, HomeView.routeName),
        // _buildNavigator(2, HomeView.routeName),
        // _buildNavigator(3, HomeView.routeName),
      ],
    );
  }

  Widget _buildNavigator(int index, String initialRoute) {
    return Navigator(
      key: tabNavigatorKeys[index], // global keys from nav service
      initialRoute: initialRoute,
      onGenerateRoute: onGenerateRoutes,
    );
  }
}

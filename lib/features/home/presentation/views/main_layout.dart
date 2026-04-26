import 'package:flutter/material.dart';
import 'package:grocify/core/services/navigation_service.dart';
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
    return Scaffold(
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
    );
  }
}

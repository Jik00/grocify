import 'package:flutter/material.dart';

final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

final List<GlobalKey<NavigatorState>> tabNavigatorKeys = [
  GlobalKey<NavigatorState>(), // HomeView
  GlobalKey<NavigatorState>(), // CartView
  GlobalKey<NavigatorState>(), // For FavView
  GlobalKey<NavigatorState>(), // For ProfileView
];

class NavigationService {


  // nav bar navigation Logic
  static void handleTabTap({
    required int index,
    required int currentIndex,
    required Function(int) onTabChanged,
  }) {
    if (index == currentIndex) {
      popToRootOfTab(index);
    } else {
      onTabChanged(index);
    }
  }

  static void popToRootOfTab(int index) {
    tabNavigatorKeys[index].currentState?.popUntil((route) => route.isFirst);
  }

  // Navigate to a route that REPLACES the current screen (removes bottom nav)
  static void navigateToGlobal(String routeName, {dynamic arguments}) {
    navigatorKey.currentState?.pushNamedAndRemoveUntil(
      routeName,
      (route) => false,
      arguments: arguments,
    );
  }

  // Navigate to a route and add to stack (removes bottom nav)
  static void pushGlobal(String routeName, {dynamic arguments}) {
    navigatorKey.currentState?.pushNamed(
      routeName,
      arguments: arguments,
    );
  }

  // Pop the current route
  static void popGlobal() {
    if (navigatorKey.currentState?.canPop() ?? false) {
      navigatorKey.currentState?.pop();
    }
  }

  // Navigate to a route that keeps bottom nav (using context)
  static void navigateWithinTab(BuildContext context, String routeName,
      {dynamic arguments}) {
    Navigator.pushNamed(
      context,
      routeName,
      arguments: arguments,
    );
  }
}

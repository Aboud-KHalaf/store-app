import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:provider/provider.dart';
import 'package:store_app/helpers/app_lists_and_maps.dart';
import 'package:store_app/providers/cart_provider.dart';

class RootScreen extends StatefulWidget {
  static const String routeName = '/r';
  const RootScreen({super.key});

  @override
  State<RootScreen> createState() => _RootScreenState();
}

class _RootScreenState extends State<RootScreen> {
  late PageController _controller;
  int currentScreen = 0;

  @override
  void initState() {
    _controller = PageController(
      initialPage: currentScreen,
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final int length =
        Provider.of<CartProvider>(context).getCartItems.values.length;
    return Scaffold(
      body: PageView(
        onPageChanged: (index) => setState(() => currentScreen = index),
        controller: _controller,
        children: AppListsAndMaps.screens,
      ),
      bottomNavigationBar: NavigationBar(
        height: 75,
        elevation: 0,
        selectedIndex: currentScreen,
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        destinations: [
          const NavigationDestination(
            selectedIcon: Icon(IconlyBold.home),
            icon: Icon(IconlyLight.home),
            label: 'Home',
          ),
          const NavigationDestination(
            selectedIcon: Icon(IconlyBold.search),
            icon: Icon(IconlyLight.search),
            label: 'Search',
          ),
          NavigationDestination(
            selectedIcon: const Icon(IconlyBold.bag2),
            icon: Badge(
              label: Text(length.toString()),
              child: const Icon(IconlyLight.bag2),
            ),
            label: 'Cart',
          ),
          const NavigationDestination(
            selectedIcon: Icon(IconlyBold.profile),
            icon: Icon(IconlyLight.profile),
            label: 'Profile',
          ),
        ],
        onDestinationSelected: (index) {
          setState(() {
            currentScreen = index;
          });
          _controller.jumpToPage(index);
        },
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';
import 'package:store_app/providers/auth_provider.dart';
import 'package:store_app/providers/cart_provider.dart';
import 'package:store_app/providers/leatest_arrivel_provider.dart';
import 'package:store_app/providers/product_provider.dart';
import 'package:store_app/providers/theme_provider.dart';
import 'package:store_app/providers/user_provider.dart';
import 'package:store_app/providers/wishList_provider.dart';
import 'package:store_app/screens/auth/forget_password_screen.dart';
import 'package:store_app/screens/auth/signin_screen.dart';
import 'package:store_app/screens/auth/signup_screen.dart';
import 'package:store_app/screens/inner/all_orders_screen.dart';
import 'package:store_app/screens/inner/product_details_screen.dart';
import 'package:store_app/screens/inner/viewed_recently.dart';
import 'package:store_app/screens/inner/wish_list_screen.dart';
import 'package:store_app/screens/main/cart_screen.dart';
import 'package:store_app/screens/main/home_screen.dart';
import 'package:store_app/screens/main/profile_screen.dart';
import 'package:store_app/screens/main/search_screen.dart';

class AppListsAndMaps {
  static List<SingleChildWidget> providers = [
    ChangeNotifierProvider(
      create: (_) => ThemeProvider(),
    ),
    ChangeNotifierProvider(
      create: (_) => ProductProvider()..getProductsFuture(),
    ),
    ChangeNotifierProvider(
      create: (_) => CartProvider(),
    ),
    ChangeNotifierProvider(
      create: (_) => WishListProvider(),
    ),
    ChangeNotifierProvider(
      create: (_) => ViewedRecentProider(),
    ),
    ChangeNotifierProvider(
      create: (_) => MyAuthProvider(),
    ),
    ChangeNotifierProvider(
      create: (_) => UserProvider(),
    ),
  ];

  static List<Widget> screens = const [
    HomeScreen(),
    SearchScreen(),
    CartScreen(),
    ProfileScreen(),
  ];

  ///

  static Map<String, Widget Function(BuildContext)> routes = {
    ProductDetailsScreen.pageRoute: (context) => const ProductDetailsScreen(),
    WishListScreen.pageRoute: (context) => const WishListScreen(),
    ViewedRecently.pageRoute: (context) => const ViewedRecently(),
    SigninScreen.pageRoute: (context) => const SigninScreen(),
    SignupScreen.pageRoute: (context) => const SignupScreen(),
    AllOrdersScreen.pageRoute: (context) => const AllOrdersScreen(),
    ForgetPassword.pageRoute: (context) => const ForgetPassword(),
    SearchScreen.pageRoute: (context) => const SearchScreen(),
  };
}

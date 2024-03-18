import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';
import 'package:store_app/helpers/app_animations.dart';
import 'package:store_app/helpers/app_text.dart';
import 'package:store_app/providers/cart_provider.dart';
import 'package:store_app/providers/product_provider.dart';
import 'package:store_app/providers/user_provider.dart';
import 'package:store_app/providers/wishList_provider.dart';
import 'package:store_app/root_screen.dart';
import 'package:store_app/screens/auth/signin_screen.dart';
import 'package:store_app/widgets/shimmer_text_widget.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  Future<void> _navigateToRoot() async {
    await Future.delayed(const Duration(seconds: 3));
    if (mounted) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) =>
              (user != null) ? const RootScreen() : const SigninScreen(),
        ),
      );
    }
  }

  bool isLoadingProds = false;
  User? user;

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      await fetchFCT();
    });
    _navigateToRoot();
    super.initState();
  }

  Future<void> fetchFCT() async {
    final productsProvider =
        Provider.of<ProductProvider>(context, listen: false);
    final cartProvider = Provider.of<CartProvider>(context, listen: false);
    final wishlistProvider =
        Provider.of<WishListProvider>(context, listen: false);
    final userProvider = Provider.of<UserProvider>(context, listen: false);

    try {
      user = FirebaseAuth.instance.currentUser;
      Future.wait({
        productsProvider.getProductsFuture(),
      });
      Future.wait({
        cartProvider.fetchCart(),
        userProvider.fetchUser(),
        wishlistProvider.fetchWishlist(),
      });
    } catch (error) {
      debugPrint(error.toString());
    } finally {
      setState(() {
        isLoadingProds = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final s = MediaQuery.of(context).size;
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const SizedBox(width: double.infinity),
          Lottie.asset(
            AppAnimations.shopingCartAnimation,
            repeat: false,
            width: s.width * 0.6,
          ),
          const SizedBox(height: 10),
          const ShimmerText(
            fontSize: 35,
            fontWeight: FontWeight.bold,
            text: AppTexts.appName,
          ),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:store_app/helpers/app_images.dart';
import 'package:store_app/providers/product_provider.dart';
import 'package:store_app/root_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  Future<void> _navigateToRoot() async {
    await Future.delayed(const Duration(seconds: 2));
    if (mounted) {
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => const RootScreen()));
    }
  }

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      final productProvider =
          Provider.of<ProductProvider>(context, listen: false);
      await productProvider.getProductsFuture();
    });
    _navigateToRoot();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final s = MediaQuery.of(context).size;
    return Scaffold(
      body: Center(
        child: Image.asset(
          AppImages.imagesBagShoppingBasket,
          width: s.width * 0.5,
        ),
      ),
    );
  }
}

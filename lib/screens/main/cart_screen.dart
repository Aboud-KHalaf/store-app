import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';
import 'package:store_app/components/custom_cart_bottom_sheet.dart';
import 'package:store_app/components/custom_cart_widget.dart';
import 'package:store_app/components/custom_empty_cart_widget.dart';
import 'package:store_app/helpers/app_animations.dart';
import 'package:store_app/helpers/app_images.dart';
import 'package:store_app/helpers/app_methods.dart';
import 'package:store_app/helpers/app_text.dart';
import 'package:store_app/models/cart_model.dart';
import 'package:store_app/providers/cart_provider.dart';
import 'package:store_app/providers/product_provider.dart';
import 'package:store_app/providers/user_provider.dart';
import 'package:store_app/widgets/app_bar_row_widget.dart';
import 'package:uuid/uuid.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

bool isLoading = false;

class _CartScreenState extends State<CartScreen> {
  @override
  Widget build(BuildContext context) {
    final CartProvider cartProvider = Provider.of<CartProvider>(context);
    final UserProvider userProvider =
        Provider.of<UserProvider>(context, listen: false);
    final ProductProvider productProvider =
        Provider.of<ProductProvider>(context, listen: false);
    List<CartModel> cartList = cartProvider.getCartItems.values.toList();

    return cartList.isEmpty
        ? const CustomEmptyCartWidget(
            image: AppImages.imagesBagShoppingBasket,
            title: AppTexts.woops,
            subTitile: AppTexts.emptyCart,
            text: AppTexts.goShoping,
            buttonText: 'Shop now',
          )
        : Scaffold(
            bottomSheet: (isLoading)
                ? Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: LottieBuilder.asset(AppAnimations.loadingAnimation),
                  )
                : CustomCartButtomSheet(
                    checkOutFcn: () async {
                      await placeOrder(
                        cartProvider: cartProvider,
                        productProvider: productProvider,
                        userProvider: userProvider,
                      );
                    },
                  ),
            appBar: AppBar(
              title: AppBarRowWidget(
                text: 'Cart (${cartList.length})',
              ),
              actions: [
                IconButton(
                  onPressed: () {
                    AppMethods.showErrorOrWaringDialog(
                      context: context,
                      subTitle: 'Do you realy want to clear your cart ?',
                      image: AppImages.imagesWarning,
                      fcn: () {
                        cartProvider.clearCartFromFirebase();
                        Navigator.pop(context);
                      },
                      isError: true,
                    );
                  },
                  icon: const Icon(
                    Icons.delete,
                    color: Colors.red,
                  ),
                ),
              ],
            ),
            body: ListView.builder(
              itemCount: cartProvider.getCartItems.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: EdgeInsets.only(
                    bottom: (index == cartProvider.getCartItems.length - 1)
                        ? 55
                        : 0,
                  ),
                  child: CustomCartWidget(
                    cartModel: cartList[index],
                  ),
                );
              },
            ),
          );
  }

  Future<void> placeOrder({
    required CartProvider cartProvider,
    required ProductProvider productProvider,
    required UserProvider userProvider,
  }) async {
    final auth = FirebaseAuth.instance;
    User? user = auth.currentUser;
    if (user == null) {
      return;
    }
    final uid = user.uid;
    try {
      setState(() {
        isLoading = true;
      });
      cartProvider.getCartItems.forEach((key, value) async {
        final getCurrProduct = productProvider.findByProductId(value.productId);
        final orderId = const Uuid().v4();

        await FirebaseFirestore.instance
            .collection("ordersAdvanced")
            .doc(orderId)
            .set({
          'orderId': orderId,
          'userId': uid,
          'productId': value.productId,
          "productTitle": getCurrProduct.productTitle,
          'price': (double.parse(getCurrProduct.productPrice) * value.quantity),
          'totalPrice':
              (cartProvider.getTotal(productProvider: productProvider).$1)
                  .toString(),
          'quantity': value.quantity,
          'imageUrl': getCurrProduct.productImage,
          'userName': userProvider.user!.userName,
          'orderDate': Timestamp.now(),
        });
      });
      await cartProvider.clearCartFromFirebase();
      cartProvider.clearCartMap();
    } catch (e) {
      if (mounted) {
        AppMethods.showErrorOrWaringDialog(
          context: context,
          subTitle: e.toString(),
          image: AppImages.imagesWarning,
          fcn: () {
            Navigator.pop(context);
          },
        );
      }
    } finally {
      setState(() {
        isLoading = false;
      });
    }
  }
}

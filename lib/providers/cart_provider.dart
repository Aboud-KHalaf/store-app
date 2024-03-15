import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:store_app/helpers/app_images.dart';
import 'package:store_app/helpers/app_methods.dart';
import 'package:store_app/models/cart_model.dart';
import 'package:store_app/models/product_model.dart';
import 'package:store_app/providers/product_provider.dart';
import 'package:store_app/services/user_services.dart';
import 'package:uuid/uuid.dart';

class CartProvider with ChangeNotifier {
  final Map<String, CartModel> _cartItems = {};
  Map<String, CartModel> get getCartItems => _cartItems;
  UserService userService = UserService();

  bool isProductInCart({required String productId}) {
    return _cartItems.containsKey(productId);
  }

  void addProductToCart({required String productId}) {
    _cartItems.putIfAbsent(
      productId,
      () => CartModel(
        cartId: const Uuid().v4(),
        productId: productId,
        quantity: 1,
      ),
    );

    notifyListeners();
  }

  void updateQuantity({required String productId, required int quantity}) {
    _cartItems.update(
      productId,
      (item) => CartModel(
        cartId: item.cartId,
        productId: item.productId,
        quantity: quantity,
      ),
    );

    notifyListeners();
  }

  void removeCartItem({required String productId}) {
    _cartItems.remove(productId);
    notifyListeners();
  }

  void clearCartMap() {
    _cartItems.clear();
    notifyListeners();
  }

  (double, int) getTotal({required ProductProvider productProvider}) {
    double total = 0.0;
    int q = 0;

    _cartItems.forEach((key, value) {
      ProductModel productItem =
          productProvider.findByProductId(value.productId);
      total += (double.parse(productItem.productPrice) * (value.quantity));
      q += value.quantity;
    });
    return (total, q);
  }

  // Firebase
  final usersDB = FirebaseFirestore.instance.collection("users");
  final _auth = FirebaseAuth.instance;
  Future<void> addToCartFirebase(
      {required String productId,
      required int qty,
      required BuildContext context}) async {
    final User? user = _auth.currentUser;
    if (user == null) {
      AppMethods.showErrorOrWaringDialog(
          context: context,
          subTitle: 'Log in first',
          image: AppImages.imagesError,
          fcn: () {
            Navigator.pop(context);
          });
      return;
    }

    try {
      userService.addToCart(productId: productId, qty: qty, user: user);
      await fetchCart();
      // ignore: use_build_context_synchronously
      AppMethods.showSnakBar(context, "Item has been added to cart");
    } catch (e) {
      rethrow;
    }
  }

  Future<void> fetchCart() async {
    User? user = _auth.currentUser;
    if (user == null) {
      debugPrint("the function has been called and the user is null");
      _cartItems.clear();
      return;
    }
    try {
      final userDoc = await usersDB.doc(user.uid).get();
      final data = userDoc.data();
      if (data == null || !data.containsKey("userCart")) {
        return;
      }
      final leng = userDoc.get("userCart").length;
      for (int index = 0; index < leng; index++) {
        _cartItems.putIfAbsent(
          userDoc.get('userCart')[index]['productId'],
          () => CartModel(
            cartId: userDoc.get('userCart')[index]['cartId'],
            productId: userDoc.get('userCart')[index]['productId'],
            quantity: userDoc.get('userCart')[index]['quantity'],
          ),
        );
      }
    } catch (e) {
      rethrow;
    }
    notifyListeners();
  }

  Future<void> removeCartItemFromFirebase(
      {required String cartId,
      required String productId,
      required int qty}) async {
    User? user = _auth.currentUser;
    try {
      await usersDB.doc(user!.uid).update({
        "userCart": FieldValue.arrayRemove([
          {
            "cartId": cartId,
            'productId': productId,
            'quantity': qty,
          }
        ])
      });
      _cartItems.remove(productId);
      await fetchCart();
    } catch (e) {
      rethrow;
    }
    notifyListeners();
  }

  Future<void> clearCartFromFirebase() async {
    User? user = _auth.currentUser;
    try {
      await usersDB.doc(user!.uid).update({"userCart": []});
      _cartItems.clear();
    } catch (e) {
      rethrow;
    }
    notifyListeners();
  }
}

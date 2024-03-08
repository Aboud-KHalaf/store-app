import 'package:flutter/material.dart';
import 'package:store_app/models/cart_model.dart';
import 'package:store_app/models/product_model.dart';
import 'package:store_app/providers/product_provider.dart';
import 'package:uuid/uuid.dart';

class CartProvider with ChangeNotifier {
  final Map<String, CartModel> _cartItems = {};
  Map<String, CartModel> get getCartItems => _cartItems;

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
}

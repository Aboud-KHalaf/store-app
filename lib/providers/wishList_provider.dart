import 'package:flutter/material.dart';
import 'package:store_app/models/with_model.dart';
import 'package:uuid/uuid.dart';

class WishListProvider with ChangeNotifier {
  final Map<String, WishModel> _wishListItems = {};
  Map<String, WishModel> get getCartItems => _wishListItems;

  bool isProductInWishList({required String productId}) {
    return _wishListItems.containsKey(productId);
  }

  void addOrRemoveProductToWishList({required String productId}) {
    if (!isProductInWishList(productId: productId)) {
      _wishListItems.putIfAbsent(
        productId,
        () => WishModel(
          wishId: const Uuid().v4(),
          productId: productId,
        ),
      );
    } else {
      _wishListItems.remove(productId);
    }

    notifyListeners();
  }

  void clearWishList() {
    _wishListItems.clear();
    notifyListeners();
  }
}

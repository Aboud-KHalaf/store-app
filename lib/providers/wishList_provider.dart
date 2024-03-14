import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:store_app/helpers/app_images.dart';
import 'package:store_app/helpers/app_methods.dart';
import 'package:store_app/models/with_model.dart';
import 'package:uuid/uuid.dart';

class WishListProvider with ChangeNotifier {
  final Map<String, WishModel> _wishlistItems = {};
  Map<String, WishModel> get getCartItems => _wishlistItems;

  bool isProductInWishList({required String productId}) {
    return _wishlistItems.containsKey(productId);
  }

  void addOrRemoveProductToWishList({required String productId}) {
    if (!isProductInWishList(productId: productId)) {
      _wishlistItems.putIfAbsent(
        productId,
        () => WishModel(
          wishId: const Uuid().v4(),
          productId: productId,
        ),
      );
    } else {
      _wishlistItems.remove(productId);
    }

    notifyListeners();
  }

  void clearWishList() {
    _wishlistItems.clear();
    notifyListeners();
  }

  //firebase
  final usersDB = FirebaseFirestore.instance.collection("users");
  final _auth = FirebaseAuth.instance;
  Future<void> addToWishlistFirebase(
      {required String productId, required BuildContext context}) async {
    final User? user = _auth.currentUser;
    if (user == null) {
      AppMethods.showErrorOrWaringDialog(
          context: context,
          subTitle: 'Log in first',
          image: AppImages.imagesWarning,
          fcn: () {
            Navigator.pop(context);
          });
      return;
    }
    final uid = user.uid;
    final wishlistId = const Uuid().v4();
    try {
      usersDB.doc(uid).update({
        'userWish': FieldValue.arrayUnion([
          {
            "wishlistId": wishlistId,
            'productId': productId,
          }
        ])
      });
      // await fetchWishlist();
      AppMethods.showSnakBar(context, "Item has been added to Wishlist");
    } catch (e) {
      rethrow;
    }
  }

  Future<void> fetchWishlist() async {
    User? user = _auth.currentUser;
    if (user == null) {
      // log("the function has been called and the user is null");
      _wishlistItems.clear();
      return;
    }
    try {
      final userDoc = await usersDB.doc(user.uid).get();
      final data = userDoc.data();
      if (data == null || !data.containsKey("userWish")) {
        return;
      }
      final leng = userDoc.get("userWish").length;
      for (int index = 0; index < leng; index++) {
        _wishlistItems.putIfAbsent(
          userDoc.get('userWish')[index]['productId'],
          () => WishModel(
            wishId: userDoc.get('userWish')[index]['wishlistId'],
            productId: userDoc.get('userWish')[index]['productId'],
          ),
        );
      }
    } catch (e) {
      rethrow;
    }
    notifyListeners();
  }

  Future<void> removeWishlistItemFromFirebase({
    required String wishlistId,
    required String productId,
  }) async {
    User? user = _auth.currentUser;
    try {
      await usersDB.doc(user!.uid).update({
        "userWish": FieldValue.arrayRemove([
          {
            'wishlistId': wishlistId,
            'productId': productId,
          }
        ])
      });
      _wishlistItems.remove(productId);
      // await fetchWishlist();
    } catch (e) {
      rethrow;
    }
    notifyListeners();
  }

  Future<void> clearWishlistFromFirebase() async {
    User? user = _auth.currentUser;
    try {
      await usersDB.doc(user!.uid).update({"userWish": []});
      _wishlistItems.clear();
    } catch (e) {
      rethrow;
    }
    notifyListeners();
  }
}

import 'package:flutter/material.dart';
import 'package:store_app/models/leatest_arrivel_model.dart';
import 'package:uuid/uuid.dart';

class ViewedRecentProider with ChangeNotifier {
  final Map<String, ViewedRecentModel> _viewedRecentList = {};
  List<ViewedRecentModel> get getViewdRecentList =>
      _viewedRecentList.values.toList();

  bool isProductInLeatestArrivel({required String productId}) {
    return _viewedRecentList.containsKey(productId);
  }

  void addProductToViewedRecent({required String productId}) {
    _viewedRecentList.putIfAbsent(
      productId,
      () => ViewedRecentModel(
        vId: const Uuid().v4(),
        productId: productId,
      ),
    );
    notifyListeners();
  }

  void clearViewdRecent() {
    _viewedRecentList.clear();
    notifyListeners();
  }
}

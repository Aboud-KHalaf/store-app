import 'package:flutter/material.dart';
import 'package:store_app/models/product_model.dart';

class ProductProvider with ChangeNotifier {
  final List<ProductModel> _products = ProductModel.localProds;
  List<ProductModel> get getProductList => _products;

  ProductModel? findByProductId(String prodtId) {
    if (_products.where((element) => element.productId == prodtId).isEmpty) {
      return null;
    }
    return _products.firstWhere((element) => element.productId == prodtId);
  }

  List<ProductModel> findByCategory({required String ctgName}) {
    List<ProductModel> ctgList = _products
        .where((element) => element.productCategory
            .toLowerCase()
            .contains(ctgName.toLowerCase()))
        .toList();
    return ctgList;
  }
}

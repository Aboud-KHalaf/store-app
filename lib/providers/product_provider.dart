import 'package:flutter/material.dart';
import 'package:store_app/models/product_model.dart';
import 'package:store_app/services/product_services.dart';

class ProductProvider with ChangeNotifier {
  List<ProductModel> _products = [];
  List<ProductModel> get getProductList => _products;
  final ProductsService _productsService = ProductsService();

  Future<void> getProductsFuture() async {
    _products = await _productsService.getFutureProducts();
    notifyListeners();
  }

  ProductModel findByProductId(String prodtId) {
    return _products.firstWhere((element) => element.productId == prodtId);
  }

  List<ProductModel> findByCategory({required String ctgName}) {
    List<ProductModel> ctgList = _products
        .where((element) =>
            (element.productCategory.toLowerCase()) == (ctgName.toLowerCase()))
        .toList();
    return ctgList;
  }

  List<ProductModel> searchQuery(
      {required String searchTxt, required List<ProductModel> searchProduct}) {
    List<ProductModel> searchList = searchProduct
        .where((element) => (element.productTitle.toLowerCase())
            .contains(searchTxt.toLowerCase()))
        .toList();
    return searchList;
  }
}

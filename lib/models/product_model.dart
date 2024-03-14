import 'package:cloud_firestore/cloud_firestore.dart';

class ProductModel {
  final String productId,
      productTitle,
      productPrice,
      productCategory,
      productDescription,
      productImage,
      productQuantity;
  Timestamp timestamp = Timestamp.now();

  ProductModel({
    required this.productId,
    required this.productTitle,
    required this.productPrice,
    required this.productCategory,
    required this.productDescription,
    required this.productImage,
    required this.productQuantity,
  });

  factory ProductModel.fromSnapshot(
      DocumentSnapshot<Map<String, dynamic>> snapshot) {
    return ProductModel(
      productId: snapshot.id,
      productTitle: snapshot.get('productTitle'),
      productDescription: snapshot.get('productDescription'),
      productCategory: snapshot.get('productCategory'),
      productImage: snapshot.get('productImage'),
      productPrice: snapshot.get('productPrice'),
      productQuantity: snapshot.get(
        'productQuantity',
      ),
    );
  }
}

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:store_app/models/product_model.dart';

class ProductsService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final String _productsCollection = 'products';

  Future<List<ProductModel>> getFutureProducts() async {
    final snapshot = await _firestore
        .collection(_productsCollection)
        //.orderBy('createdAt', descending: false)
        .get();

    return snapshot.docs.map((doc) => ProductModel.fromSnapshot(doc)).toList();
  }
}

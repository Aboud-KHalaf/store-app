import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:store_app/helpers/app_collections.dart';
import 'package:store_app/models/user_model.dart';

class UserService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<UserModel?> getUserById(String userId) async {
    try {
      final docRef =
          _firestore.collection(AppCollections.useresColl).doc(userId);
      final docSnapshot = await docRef.get();
      if (docSnapshot.exists) {
        return UserModel.fromFirestore(doc: docSnapshot);
      } else {
        return null;
      }
    } catch (e) {
      if (kDebugMode) {
        print('Error fetching user data: $e');
      }
      return null;
    }
  }

  Future<void> addUser(UserModel user) async {
    try {
      final docRef =
          _firestore.collection(AppCollections.useresColl).doc(user.userId);
      await docRef.set(user.toMap(userModel: user));
    } catch (e) {
      if (kDebugMode) {
        print('Error adding user data: $e');
      }
    }
  }
}

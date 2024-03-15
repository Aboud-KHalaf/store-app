import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:store_app/models/user_model.dart';
import 'package:store_app/services/storage_services.dart';
import 'package:store_app/services/user_services.dart';

class UserProvider with ChangeNotifier {
  UserModel? _user;
  final UserService _userService = UserService();

  Future<void> setUserInfo(
      {required String fullName,
      required String email,
      required String userImageUrl}) async {
    try {
      await _userService.addUser(
        UserModel(
          userName: fullName,
          createdAt: Timestamp.now(),
          userId: FirebaseAuth.instance.currentUser!.uid,
          userImage: userImageUrl,
          userEmail: email,
          userCart: [],
          userWish: [],
        ),
      );

      notifyListeners();
    } catch (e) {
      if (kDebugMode) {
        print('Error adding user data: $e');
      }
    }
  }

  UserModel? get user => _user;

  Future<void> fetchUser() async {
    final userId = FirebaseAuth.instance.currentUser!.uid;
    try {
      final user = await _userService.getUserById(userId);
      _user = user;
      notifyListeners();
    } catch (e) {
      if (kDebugMode) {
        print('Error fetching user data: $e');
      }
    }
  }

  StorageServices storageServices = StorageServices();

  Future<String> uploadImage(
      {required String imageFilePath, required String email}) async {
    String res = await storageServices.uploadImage(
      imageFilePath: imageFilePath,
      email: email,
    );
    return res;
  }
}

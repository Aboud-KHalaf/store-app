import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:store_app/helpers/app_firestore_columns.dart';

class UserModel {
  final String userId, userImage, userEmail, userName;
  final Timestamp createdAt;
  final List userCart, userWish;

  UserModel({
    required this.userName,
    required this.createdAt,
    required this.userId,
    required this.userImage,
    required this.userEmail,
    required this.userCart,
    required this.userWish,
  });

  factory UserModel.fromFirestore({required DocumentSnapshot doc}) {
    final data = doc.data() as Map<String, dynamic>;
    return UserModel(
      userName: data[AppFireStoreColumns.usersUserName] ?? '',
      userId: data[AppFireStoreColumns.usersUserId] ?? '',
      createdAt: data[AppFireStoreColumns.usersCreatedAt] ?? Timestamp.now(),
      userImage: data[AppFireStoreColumns.usersUserImage] ?? '',
      userEmail: data[AppFireStoreColumns.usersUserEmail] ?? 'no email',
      userCart: data[AppFireStoreColumns.usersUserCart] ?? [],
      userWish: data[AppFireStoreColumns.usersUserWish] ?? [],
    );
  }

  Map<String, dynamic> toMap({required UserModel userModel}) {
    return {
      AppFireStoreColumns.usersUserEmail: userModel.userEmail,
      AppFireStoreColumns.usersUserId: userModel.userId,
      AppFireStoreColumns.usersUserName: userModel.userName,
      AppFireStoreColumns.usersUserImage: userModel.userImage,
      AppFireStoreColumns.usersCreatedAt: userModel.createdAt,
      AppFireStoreColumns.usersUserCart: userModel.userCart,
      AppFireStoreColumns.usersUserWish: userModel.userWish,
    };
  }
}

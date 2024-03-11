import 'package:flutter/foundation.dart';
import 'package:store_app/models/user_model.dart';
import 'package:store_app/services/user_services.dart';

class UserProvider with ChangeNotifier {
  UserModel? _user;
  final UserService _userService = UserService();

  Future<void> setUserInfo({required UserModel userInfo}) async {
    try {
      await _userService.addUser(userInfo);

      notifyListeners();
    } catch (e) {
      if (kDebugMode) {
        print('Error adding user data: $e');
      }
    }
  }

  UserModel? get user => _user;

  Future<void> fetchUser(String userId) async {
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
}

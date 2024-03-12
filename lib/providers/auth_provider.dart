import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:store_app/services/auth_services.dart';

class MyAuthProvider extends ChangeNotifier {
  User? _user;
  final AuthService _authService = AuthService();

  User? get user => _user;

  bool checkIfUserLogedIn() {
    if (FirebaseAuth.instance.currentUser == null) {
      return false;
    }
    return true;
  }

  MyAuthProvider() {
    _authService.currentUserStream.listen((user) {
      _user = user;
      notifyListeners();
    });
  }

  Future<({bool isSuccess, String errMess})> signUp(
      {required String email, required String password}) async {
    final credential = await _authService.signUp(email, password);
    late bool res;
    late String errMessage;
    credential.fold((l) {
      errMessage = l;
      res = false;
    }, (r) {
      errMessage = "";
      res = true;
    });
    return (isSuccess: res, errMess: errMessage);
  }

  Future<Either<String, UserCredential>> signIn(
      String email, String password) async {
    final credential = await _authService.signIn(email, password);
    return credential;
  }

  Future<void> signOut() async {
    await _authService.signOut();
  }

  final AuthService _googleSignInProvider = AuthService();

  // ... existing code for user and sign-in/out methods ...

  Future<Either<String, UserCredential>> signInWithGoogle() async {
    final credential = await _googleSignInProvider.signInWithGoogle();
    return credential;
  }
}

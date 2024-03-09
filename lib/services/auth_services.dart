import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final GoogleSignIn _googleSignIn = GoogleSignIn();

  // Sign Up with email and password
  Future<Either<String, UserCredential>> signUp(
      String email, String password) async {
    try {
      final credential = await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      return right(credential);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        return left('The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        return left('The account already exists for that email.');
      }
    } catch (e) {
      return left(e.toString());
    }
    return left("An error has occurred. Please check your internet connection");
  }

  // Sign In with email and password
  Future<Either<String, UserCredential>> signIn(
      String email, String password) async {
    try {
      final credential = await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      return right(credential);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        return left('No user found for that email.');
      } else if (e.code == 'wrong-password') {
        return left('Wrong password provided for that user.');
      }
    } catch (e) {
      return left(e.toString());
    }
    return left("An error has occurred. Please check your internet connection");
  }

  // Sign Out
  Future<void> signOut() async {
    await _auth.signOut();
  }

  // Check if user is logged in (optional - using Stream)
  Stream<User?> get currentUserStream => _auth.authStateChanges();

  Future<Either<String, UserCredential>> signInWithGoogle() async {
    // Trigger the Google sign-in flow
    final GoogleSignInAccount? googleUser = await _googleSignIn.signIn();

    if (googleUser != null) {
      // Get Google authentication credentials
      final GoogleSignInAuthentication googleAuth =
          await googleUser.authentication;

      // Create a Firebase credential from Google credentials
      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );

      // Sign in with Firebase using the credential
      return right(
          await FirebaseAuth.instance.signInWithCredential(credential));
    } else {
      return left('User did not sign in with Google');
    }
  }
}

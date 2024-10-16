import 'package:firebase_auth/firebase_auth.dart';

class AuthServices {
  static final FirebaseAuth _auth = FirebaseAuth.instance;

  static Future<User?> signInAnonymous() async {
    try {
      UserCredential result = await _auth.signInAnonymously();

      User? firebaseUser = result.user;

      return firebaseUser;
    } catch (e) {
      print('Error signing in anonymous: $e');
      return null;
    }
  }

  static Future<User?> signUp(String email, String password) async {
    try {
      UserCredential result = await _auth.createUserWithEmailAndPassword(
          email: email, password: password);

      User firebaseUser = result.user!;
      return firebaseUser;
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  static Future<User?> signIn(String email, String password) async {
    try {
      UserCredential result = await _auth.signInWithEmailAndPassword(
          email: email, password: password);

      User user = result.user!;

      return user;
    } catch (e) {
      print(e.toString());
    }
    return null;
  }

  static Future<void> signOut() async {
    try {
      await _auth.signOut();
      print('User signed out successfully');
    } catch (e) {
      print('Error signing out: $e');
    }
  }

  static Stream<User?> get firebaseUserStream => _auth.authStateChanges();
}

import 'package:firebase_auth/firebase_auth.dart';

class AuthService {
  FirebaseAuth _auth = FirebaseAuth.instance;

  Future<User?> registerWithEmailAndPassword(
      String email, String password) async {
    try {
      UserCredential credential = await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
      return credential.user;
    } catch (e) {
      print("Some error occured");
    }

    return null;
  }

  Future<User?> signInWithEmailAndPassword(
      String email, String password) async {
    try {
      UserCredential credential = await _auth.signInWithEmailAndPassword(
          email: email, password: password);
      return credential.user;
    } catch (e) {
      print("Some error occured");
    }

    return null;
  }

  Future<User?> resetPasswordWithEmail(String email) async {
    try {
      await FirebaseAuth.instance.sendPasswordResetEmail(email: email);
    } catch (e) {
      print("Some error occured");
    }
  }
}

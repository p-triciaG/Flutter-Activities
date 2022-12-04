import 'package:activity/provider/firestore_database.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../models/UserModel.dart';

class FirebaseAuthenticationService {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  Stream<User?> get user {
    return _firebaseAuth.authStateChanges();
  }

  Future<User?> signInAnonimo() async {
    UserCredential userCredential = await _firebaseAuth.signInAnonymously();
    User? user = userCredential.user;

    return user;
  }

  Future<User?> signInWithEmailAndPassword(String email, String senha) async {
    UserCredential userCredential = await _firebaseAuth
        .signInWithEmailAndPassword(email: email, password: senha);
    User? user = userCredential.user;

    return user;
  }

  Future<User?> createUserWithEmailAndPassword(
      String email, String password) async {
    UserCredential userCredential = await _firebaseAuth
        .createUserWithEmailAndPassword(email: email, password: password);
    User? user = userCredential.user;

    return user;
  }

  Future<void> signOut() async {
    return await _firebaseAuth.signOut();
  }
}
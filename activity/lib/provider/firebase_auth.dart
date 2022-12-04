import 'package:activity/provider/firestore_database.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../models/UserModel.dart';

class FirebaseAuthenticationService {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  Stream<User?> get user {
    return _firebaseAuth.authStateChanges();
  }

  // UserModel? _userFromFirebaseUser(User? user, { UserModel? create = null }) async {
  //   UserModel? userData;
  //   if (create != null) {
  //     String id = await FirestoreDatabase.helper.setUser(create);
  //     userData = UserModel.fromMap(create.toMap());
  //     userData.id = id;
  //   } else if (user != null) {
  //     userData = await FirestoreDatabase.helper.getUser(user.uid);
  //   }
  //   return userData;
  // }

  Future<User?> signInAnonimo() async {
    UserCredential userCredential = await _firebaseAuth.signInAnonymously();
    User? user = userCredential.user;

    return user;
  }

  Future<User?> signInWithEmailAndPassword(UserModel userm) async {
    UserCredential userCredential = await _firebaseAuth
        .signInWithEmailAndPassword(email: userm.email, password: userm.senha);
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
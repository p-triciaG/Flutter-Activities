import 'dart:async';
import 'package:activity/models/UserModel.dart';
import 'package:activity/models/location.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class FirestoreDatabase {

  static FirestoreDatabase helper = FirestoreDatabase._createInstance();

  FirestoreDatabase._createInstance();

  final CollectionReference locationCollection =
      FirebaseFirestore.instance.collection("location");

  final CollectionReference userCollection =
      FirebaseFirestore.instance.collection("user");

  Future<int> insertLocale(Location location) async {
    DocumentReference ref = await locationCollection
        .add(location.toMap());

    return 42;
  }

  Future<int> deleteLocale(noteId) async {
    await locationCollection.doc(noteId).delete();
    return 42;
  }

  List<Location> _locationListFromSnapshot(QuerySnapshot snapshot) {
    List<Location> locationCollection = [];
    for (var doc in snapshot.docs) {
      Location location = Location.fromMap(doc.data());
      locationCollection.add(location);
    }
    return locationCollection;
  }

  Future<List<Location>> getLocales() async {
    QuerySnapshot snapshot =
        await locationCollection.get();

    return _locationListFromSnapshot(snapshot);
  }

  Future<UserModel> getUser(String uid) async {
    DocumentSnapshot doc = await userCollection.doc(uid).get();

    return UserModel.fromMap(doc);
  }

  Future<int> setUser(String id, UserModel user) async {
    await userCollection.doc(id).set(user.toMap());

    return 0;
  }

  Stream get stream {
    return locationCollection
        .snapshots()
        .map(_locationListFromSnapshot);
  }
}
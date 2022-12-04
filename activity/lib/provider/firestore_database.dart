import 'dart:async';
import 'package:activity/models/location.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class FirestoreDatabase {

  static FirestoreDatabase helper = FirestoreDatabase._createInstance();

  FirestoreDatabase._createInstance();

  final CollectionReference locationCollection =
      FirebaseFirestore.instance.collection("location");

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

  Stream get stream {
    return locationCollection
        .snapshots()
        .map(_locationListFromSnapshot);
  }
}
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';

class FirestoreDB {
  static FirebaseFirestore? firestore;
  static CollectionReference? users;
  static CollectionReference? product;
  /* Call only once at the main function */
  static Future initialize() async {
    if (firestore != null) return;
    FirebaseApp firebaseApp = Firebase.app();
    firestore = FirebaseFirestore.instanceFor(app: firebaseApp);
    users = firestore!.collection('Users');
    product = firestore!.collection('Product');
  }
}

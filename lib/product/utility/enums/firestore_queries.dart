import 'package:cloud_firestore/cloud_firestore.dart';

enum FirebaseQueries {
  users,
  userDetail;

  CollectionReference<Map<String, dynamic>> get reference =>
      FirebaseFirestore.instance.collection(name);
}

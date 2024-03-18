// ignore: file_names
// ignore: file_names
import 'package:cloud_firestore/cloud_firestore.dart';

abstract class UserRepository {
  Future<void> addUserToFirebase(String email, String password, String text);

  Stream<DocumentSnapshot> getUserFirebase();
}

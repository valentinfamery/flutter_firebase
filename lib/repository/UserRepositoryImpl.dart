import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_firebase/models/user_firestore.dart';
import 'package:flutter_firebase/repository/UserRepository.dart';

class UserRepositoryImpl implements UserRepository {
  FirebaseAuth firebaseAuth;
  FirebaseFirestore firebaseFirestore;

  UserRepositoryImpl(this.firebaseAuth, this.firebaseFirestore);

  CollectionReference users = FirebaseFirestore.instance.collection('users');

  @override
  Future<void> addUserToFirebase(
      String fullName, String email, String password) async {
    await firebaseAuth.createUserWithEmailAndPassword(
        email: email, password: password);

    await users.add({
      'id': firebaseAuth.currentUser?.uid,
      'fullName': fullName, // John Doe
      'email': email,
    });
  }
}

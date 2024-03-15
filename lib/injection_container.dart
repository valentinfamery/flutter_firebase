import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_firebase/firebase_options.dart';
import 'package:flutter_firebase/repository/UserRepository.dart';
import 'package:flutter_firebase/repository/UserRepositoryImpl.dart';
import 'package:get_it/get_it.dart';

final sl = GetIt.instance;

Future<void> initializeDependencies() async {
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  final firebaseAuth = FirebaseAuth.instance;
  final firebaseFirestore = FirebaseFirestore.instance;
  sl.registerSingleton<FirebaseAuth>(firebaseAuth);

  sl.registerSingleton<FirebaseFirestore>(firebaseFirestore);

  sl.registerSingleton<UserRepository>(
      UserRepositoryImpl(firebaseAuth, firebaseFirestore));
}

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_firebase/injection_container.dart';
import 'package:flutter_firebase/repository/UserRepository.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreen();
}

class _ProfileScreen extends State<ProfileScreen> {
  final firebaseAuth = sl<FirebaseAuth>();
  final userRepository = sl<UserRepository>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        StreamBuilder<DocumentSnapshot>(
          stream: userRepository.getUserFirebase(),
          builder:
              (BuildContext context, AsyncSnapshot<DocumentSnapshot> snapshot) {
            if (snapshot.hasError) {
              return const Text('Something went wrong');
            }

            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Text("Loading");
            }

            return Column(
              children: [
                Text(snapshot.data!['fullName']),
                Text(snapshot.data!['email']),
              ],
            );
          },
        ),
        const Text('Profile Screen'),
        TextButton(
            onPressed: () {
              firebaseAuth.signOut();
            },
            child: const Text('Logout'))
      ],
    ));
  }

  // ···
}

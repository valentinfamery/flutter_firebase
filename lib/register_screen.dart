import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_firebase/injection_container.dart';
import 'package:flutter_firebase/models/user_firestore.dart';
import 'package:flutter_firebase/repository/UserRepository.dart';
import 'package:go_router/go_router.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreen();
}

class _RegisterScreen extends State<RegisterScreen> {
  String? email;
  String? fullName;
  String? password;

  final emailController = TextEditingController();
  final fullNameController = TextEditingController();
  final passwordController = TextEditingController();

  final firebaseAuth = sl<FirebaseAuth>();
  final firebaseFirestore = sl<FirebaseFirestore>();

  final userRepository = sl<UserRepository>();

  // Call the user's CollectionReference to add a new user

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text('Login Screen'),
          TextField(
            controller: fullNameController,
            decoration: const InputDecoration(
              border: OutlineInputBorder(),
              hintText: 'Full Name',
            ),
          ),
          TextField(
            controller: emailController,
            decoration: const InputDecoration(
              border: OutlineInputBorder(),
              hintText: 'Email',
            ),
          ),
          TextField(
            controller: passwordController,
            decoration: const InputDecoration(
              border: OutlineInputBorder(),
              hintText: 'Password',
            ),
          ),
          TextButton(
            onPressed: () async {
              await userRepository.addUserToFirebase(fullNameController.text,
                  emailController.text, passwordController.text);

              context.go('/profile_screen');
            },
            child: const Text('Register'),
          )
        ],
      ),
    );
  }

  // ···
}

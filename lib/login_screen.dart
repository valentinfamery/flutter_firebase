
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_firebase/injection_container.dart';
import 'package:go_router/go_router.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreen();
}

class _LoginScreen extends State<LoginScreen> {
  String? email;
  String? password;

  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  final firebaseAuth =  sl<FirebaseAuth>();

  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text('Login Screen'),
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
            onPressed: () {
              firebaseAuth.signInWithEmailAndPassword(
                  email: emailController.text,
                  password: passwordController.text);

              

              GoRouter.of(context).go('/profile_screen');
            },
            child: const Text('Login'),
          ),
          TextButton(
            onPressed: () {
              
              context.go('/register_screen');
            },
            child: const Text('Register'),
          )
        ],
      ),
    );
  }

  // ···
}

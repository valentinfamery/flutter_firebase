import 'package:flutter/material.dart';
import 'package:flutter_firebase/firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async {
  runApp(const MainApp());

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Scaffold(
        body: Center(
          child: Text('Hello World!'),
        ),
      ),
    );
  }
}

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_firebase/injection_container.dart';
import 'package:flutter_firebase/routes.dart';
import 'package:go_router/go_router.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await initializeDependencies();

  // Listen for Auth changes and .refresh the GoRouter [router]
  GoRouter router = Routes().router;
  GoRouter.optionURLReflectsImperativeAPIs = true;

  FirebaseAuth firebaseAuth = sl<FirebaseAuth>();

  firebaseAuth.authStateChanges().listen((User? user) {
    router.refresh();
  });

  //final client = StreamChatClient(
//:'6azt4kgs3gtd',
  //logLevel: Level.INFO,
  //);

  //await client.connectUser(
  //User(id: firebaseAuth.currentUser!.uid),
  //'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VyX2lkIjoiTzk3OHNxcHZOcFVnMkNscVVqTUhYU2JBclNCMiJ9.lKTT9GYvXVuK4wWjoQxZGW5YeGQj48POVnqsLyWN_dU',
  //);

  runApp(MainApp(router: router));
}

/// The route configuration.

class MainApp extends StatelessWidget {
  final GoRouter router;
  const MainApp({super.key, required this.router});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      routerConfig: router,
    );
  }
}

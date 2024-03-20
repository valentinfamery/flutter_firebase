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

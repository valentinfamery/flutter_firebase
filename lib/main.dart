import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_firebase/firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_firebase/routes.dart';
import 'package:go_router/go_router.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  // Listen for Auth changes and .refresh the GoRouter [router]
  GoRouter router = Routes().router;
  FirebaseAuth.instance.authStateChanges().listen((User? user) {
    router.refresh();
  });
  
  runApp(MainApp(router : router));

  
}

/// The route configuration.


class MainApp extends StatelessWidget {
  final GoRouter router;
  const MainApp({super.key,required this.router});

  @override
  Widget build(BuildContext context) {
    
    

    return MaterialApp.router(
      routerConfig: router,
    );

  }
}

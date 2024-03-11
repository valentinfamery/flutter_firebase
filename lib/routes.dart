import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_firebase/login_screen.dart';
import 'package:flutter_firebase/profile_screen.dart';
import 'package:flutter_firebase/register_screen.dart';
import 'package:go_router/go_router.dart';

class Routes {
  final GoRouter router = GoRouter(
    routes: <RouteBase>[
      GoRoute(
          path: '/login_screen',
          builder: (BuildContext context, GoRouterState state) {
            return const LoginScreen();
          }),
      GoRoute(
          path: '/register_screen',
          builder: (BuildContext context, GoRouterState state) {
            return const RegisterScreen();
          }),
      GoRoute(
          path: '/profile_screen',
          builder: (BuildContext context, GoRouterState state) {
            return const ProfileScreen();
          }),
    ],
    // redirect to the login page if the user is not logged in
    redirect: (BuildContext context, GoRouterState state) async {
      final bool loggedIn = FirebaseAuth.instance.currentUser != null;
      final bool loggingIn = state.matchedLocation == '/login_screen';
      if (!loggedIn) return '/login_screen';
      if (loggingIn) return '/profile_screen';
      // no need to redirect at all
      return null;
    },
  );
}

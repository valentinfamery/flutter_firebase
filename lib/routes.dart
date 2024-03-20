import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_firebase/injection_container.dart';
import 'package:flutter_firebase/login_screen.dart';
import 'package:flutter_firebase/messages_screen.dart';
import 'package:flutter_firebase/profile_screen.dart';
import 'package:flutter_firebase/register_screen.dart';
import 'package:go_router/go_router.dart';
import 'package:stream_chat/src/client/client.dart';
import 'package:stream_chat_flutter/stream_chat_flutter.dart';
import 'package:stream_chat_persistence/stream_chat_persistence.dart';

class Routes {
  final GoRouter router = GoRouter(
    initialLocation: '/login_screen',
    routes: <RouteBase>[
      GoRoute(
        path: '/login_screen',
        builder: (BuildContext context, GoRouterState state) {
          return const LoginScreen();
        },
        redirect: (context, state) async {
          final firebaseAuth = sl<FirebaseAuth>();

          final bool loggedIn = firebaseAuth.currentUser != null;

          if (loggedIn) {
            return '/profile_screen';
          }
          return null;
        },
      ),
      GoRoute(
          path: '/register_screen',
          builder: (BuildContext context, GoRouterState state) {
            return const RegisterScreen();
          }),
      GoRoute(
        path: '/messages_screen',
        builder: (BuildContext context, GoRouterState state) {
          final chatPersistentClient = StreamChatPersistenceClient(
            logLevel: Level.INFO,
            connectionMode: ConnectionMode.background,
          );

          final client = StreamChatClient(
            '6azt4kgs3gtd',
            logLevel: Level.INFO,
          )..chatPersistenceClient = chatPersistentClient;

          return MessagesScreen(streamChatClient: client);
        },
        redirect: (context, state) async {
          final firebaseAuth = sl<FirebaseAuth>();

          final bool loggedIn = firebaseAuth.currentUser != null;

          if (!loggedIn) {
            return '/login_screen';
          }
          return null;
        },
      ),
      GoRoute(
        path: '/profile_screen',
        builder: (BuildContext context, GoRouterState state) {
          return const ProfileScreen();
        },
      ),
    ],
    // redirect to the login page if the user is not logged in
  );
}

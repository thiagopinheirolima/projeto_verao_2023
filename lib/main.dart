import 'dart:async';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:url_strategy/url_strategy.dart';

import 'firebase_options.dart';
import 'pages.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  setPathUrlStrategy();
  runApp(const MainPage());
}

class MainPage extends StatelessWidget {
  const MainPage({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Casa Verão 2023',
      theme: ThemeData(
        primarySwatch: Colors.teal,
      ),
      routerConfig: GoRouter(
        routes: [
          GoRoute(
            name: 'home',
            path: '/',
            builder: (context, state) => const HomePage(),
            redirect: _redirect,
          ),
          GoRoute(
            name: 'login',
            path: '/login',
            builder: (context, state) => const LoginPage(),
            redirect: _redirect,
          ),
        ],
      ),
      // initialRoute:
      //     FirebaseAuth.instance.currentUser == null ? '/login' : '/home',
      // routes: {
      //   '/login': (context) => const LoginPage(),
      //   '/home': (context) => const HomePage()
      // },
    );
  }

  String _redirect(context, state) {
    return FirebaseAuth.instance.currentUser == null ? '/login' : '/';
  }
}

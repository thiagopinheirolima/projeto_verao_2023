import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'pages.dart';

final GoRouter routes = GoRouter(
  routes: [
    GoRoute(
        name: 'home',
        path: '/',
        builder: (context, state) => const HomePage(),
        redirect: _redirect,
        routes: [
          GoRoute(
            name: 'users',
            path: 'users',
            builder: (context, state) => const UsersPage(),
          ),
        ]),
    GoRoute(
      name: 'login',
      path: '/login',
      builder: (context, state) => const LoginPage(),
      redirect: _redirect,
    ),
  ],
);

String _redirect(BuildContext context, GoRouterState state) {
  return FirebaseAuth.instance.currentUser == null ? '/login' : state.location;
}

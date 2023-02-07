import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_signin_button/flutter_signin_button.dart';
import 'package:go_router/go_router.dart';
import 'package:google_sign_in/google_sign_in.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          Expanded(
            flex: 4,
            child: Stack(
              fit: StackFit.expand,
              alignment: AlignmentDirectional.bottomCenter,
              children: [
                const Image(
                  fit: BoxFit.cover,
                  image: AssetImage('assets/images/login.jpg'),
                ),
                Positioned(
                  bottom: 8.0,
                  child: SignInButton(
                    Buttons.Google,
                    text: 'Entrar com o Google',
                    onPressed: () async {
                      final user = await _signInWithGoogle();
                      if (user != null) {
                        // ignore: use_build_context_synchronously
                        context.goNamed('home');
                      }
                    },
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            flex: 5,
            child: Flex(
              direction: Axis.vertical,
              children: [
                const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text.rich(
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.black54,
                    ),
                    TextSpan(
                      children: [
                        TextSpan(
                          text: "ATENÇÃO: ",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        TextSpan(
                          text:
                              "Caso não tenha um gmail, convidamos você a conhecer essa ferramenta inovadora que foi lançada recentemente, por volta de 2004. ",
                        ),
                        TextSpan(
                          text: "\nWelcome to the future",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: Image.asset(
                    'assets/images/logo.png',
                    fit: BoxFit.contain,
                  ),
                ),
                const Text(
                  '© Copyright 2023 - Abestados Produções S.A.',
                  style: TextStyle(
                    color: Colors.black87,
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }

  Future<User?> _signInWithGoogle() async {
    UserCredential userCredential;

    if (kIsWeb) {
      GoogleAuthProvider googleProvider = GoogleAuthProvider();
      googleProvider
          .addScope('https://www.googleapis.com/auth/userinfo.profile');
      await FirebaseAuth.instance.setPersistence(Persistence.LOCAL);
      userCredential =
          await FirebaseAuth.instance.signInWithPopup(googleProvider);
    } else {
      final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
      final GoogleSignInAuthentication? googleAuth =
          await googleUser?.authentication;

      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth?.accessToken,
        idToken: googleAuth?.idToken,
      );

      userCredential =
          await FirebaseAuth.instance.signInWithCredential(credential);
    }

    final user = userCredential.user;
    if (user != null) {
      await _storeUser(user);
    }

    return user;
  }

  Future<void> _storeUser(User user) async {
    await FirebaseFirestore.instance
        .collection('users')
        .doc(user.uid)
        .set({'name': user.displayName, 'photo': user.photoURL});
  }
}

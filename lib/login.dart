import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_signin_button/flutter_signin_button.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
            gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            Color(0xCCDE28FF),
            Color(0xC44A1DFF),
          ],
        )),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Center(
                child: SizedBox(
                  height: 100,
                  width: 100,
                  child: Placeholder(
                    color: Colors.amberAccent,
                  ),
                ),
              ),
              const SizedBox(
                height: 16,
              ),
              const Text(
                'Casa Verão 2023',
                style: TextStyle(
                  fontSize: 30,
                  color: Colors.amberAccent,
                ),
              ),
              const SizedBox(
                height: 36,
              ),
              SignInButton(
                Buttons.Google,
                text: 'Entrar com o Google',
                onPressed: _signInWithGoogle,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<UserCredential> _signInWithGoogle() async {
    GoogleAuthProvider googleProvider = GoogleAuthProvider();
    googleProvider.addScope('https://www.googleapis.com/auth/userinfo.profile');
    return await FirebaseAuth.instance.signInWithPopup(googleProvider);
  }
}

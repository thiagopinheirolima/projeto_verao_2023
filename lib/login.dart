import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_signin_button/flutter_signin_button.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          Expanded(
            flex: 2,
            child: Stack(
              fit: StackFit.expand,
              alignment: AlignmentDirectional.bottomCenter,
              children: [
                const Image(
                  fit: BoxFit.cover,
                  image: AssetImage('assets/images/login_house.jpg'),
                ),
                Positioned(
                  bottom: 8.0,
                  child: SignInButton(
                    Buttons.Google,
                    text: 'Entrar com o Google',
                    onPressed: _signInWithGoogle,
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            flex: 2,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text.rich(
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
                Image.asset('assets/images/logo.png'),
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

  Future<UserCredential> _signInWithGoogle() async {
    GoogleAuthProvider googleProvider = GoogleAuthProvider();
    googleProvider.addScope('https://www.googleapis.com/auth/userinfo.profile');
    return await FirebaseAuth.instance.signInWithPopup(googleProvider);
  }
}

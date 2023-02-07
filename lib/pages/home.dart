import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'shared/menu.dart';

const avatarImageURL =
    'https://cdn.pixabay.com/photo/2016/08/08/09/17/avatar-1577909_1280.png';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final userPhoto =
        FirebaseAuth.instance.currentUser?.photoURL ?? avatarImageURL;
    final userName =
        FirebaseAuth.instance.currentUser?.displayName ?? 'Usuário';
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Todos Juntos'),
      ),
      drawer: Menu(userPhoto: userPhoto, userName: userName),
      body: Column(
        children: [
          Flexible(
            flex: 2,
            child: Stack(
              fit: StackFit.expand,
              children: [
                Image.asset(
                  'assets/images/imagem1.webp',
                  fit: BoxFit.cover,
                ),
                const Center(
                  child: Text(
                    'HOME',
                    textScaleFactor: 4,
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                ),
                Positioned(
                  bottom: 0,
                  right: 0,
                  left: 0,
                  child: Container(
                    height: 32,
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(32),
                        topRight: Radius.circular(32),
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
          Flexible(
            flex: 6,
            child: Container(
              color: Colors.white,
              child: GridView.count(
                crossAxisCount: 3,
                padding: const EdgeInsets.all(16),
                childAspectRatio: 0.7,
                mainAxisSpacing: 16,
                crossAxisSpacing: 16,
                children: List.generate(
                  6,
                  (index) => Container(
                    color: Colors.amber,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:go_router/go_router.dart';

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
      backgroundColor: Colors.white,
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
                  'assets/images/home.webp',
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
                childAspectRatio: 0.66,
                mainAxisSpacing: 48,
                crossAxisSpacing: 16,
                children: [
                  HomeItem(
                    name: 'PARTICIPANTES',
                    icon: Icons.people,
                    onTap: () => context.goNamed('users'),
                  ),
                  HomeItem(
                    name: 'CATEGORIAS',
                    icon: Icons.category,
                    onTap: () {},
                  ),
                  HomeItem(
                    name: 'RANKING',
                    icon: Icons.star,
                    onTap: () {},
                  ),
                  HomeItem(
                    name: 'A CASA',
                    icon: Icons.house,
                    onTap: () {},
                  ),
                  HomeItem(
                    name: 'FAQ',
                    icon: Icons.question_mark,
                    onTap: () {},
                  ),
                  HomeItem(
                    name: 'PROGRAMAÇÃO',
                    icon: Icons.calendar_month,
                    onTap: () {},
                  )
                ],
              ),
            ),
          ),
          Expanded(
            flex: 3,
            child: Padding(
              padding: const EdgeInsets.all(24.0),
              child: Image.asset(
                'assets/images/logo.png',
                fit: BoxFit.contain,
              ),
            ),
          )
        ],
      ),
    );
  }
}

class HomeItem extends StatelessWidget {
  const HomeItem({
    super.key,
    required this.onTap,
    required this.name,
    required this.icon,
  });

  final Function() onTap;
  final String name;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.vertical(
            top: Radius.circular(20),
          ),
          color: Colors.teal.shade200,
        ),
        child: Flex(
          direction: Axis.vertical,
          children: [
            Expanded(
              flex: 2,
              child: Center(
                child: Text(
                  name,
                  style: TextStyle(
                    color: Colors.cyan.shade800,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            Expanded(
              flex: 2,
              child: Container(
                constraints: const BoxConstraints.expand(),
                decoration: BoxDecoration(
                  color: Colors.cyan.shade800,
                  borderRadius: const BorderRadius.vertical(
                    top: Radius.elliptical(600, 300),
                  ),
                ),
                child: Center(
                  child: Icon(
                    icon,
                    size: 50,
                    color: Colors.white,
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

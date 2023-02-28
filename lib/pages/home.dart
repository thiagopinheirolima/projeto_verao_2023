import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:go_router/go_router.dart';
import 'package:projeto_verao_2023/colors.dart';

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
            flex: 5,
            child: Stack(
              clipBehavior: Clip.none,
              fit: StackFit.expand,
              children: [
                Positioned(
                  top: 0,
                  bottom: -25,
                  right: 0,
                  left: 0,
                  child: Image.asset(
                    'assets/images/home.webp',
                    fit: BoxFit.cover,
                  ),
                ),
                const Center(
                  child: Text(
                    'HOME',
                    style: TextStyle(
                      fontSize: 100,
                      fontFamily: 'BebasNeue',
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Flexible(
            flex: 11,
            child: Container(
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.vertical(
                  top: Radius.circular(25),
                ),
                color: Colors.white,
              ),
              child: GridView.count(
                crossAxisCount: 3,
                padding: const EdgeInsets.all(16),
                childAspectRatio: 0.75,
                mainAxisSpacing: 16,
                crossAxisSpacing: 8,
                children: [
                  HomeItem(
                    name: 'PARTICIPANTES',
                    icon: 'assets/images/icons/participantes.png',
                    onTap: () => context.goNamed('users'),
                  ),
                  HomeItem(
                    name: 'CATEGORIAS',
                    icon: 'assets/images/icons/votos.png',
                    onTap: () {},
                  ),
                  HomeItem(
                    name: 'RANKING',
                    icon: 'assets/images/icons/ranking.png',
                    onTap: () {},
                  ),
                  HomeItem(
                    name: 'A CASA',
                    icon: 'assets/images/icons/acasa.png',
                    onTap: () {},
                  ),
                  HomeItem(
                    name: 'FAQ',
                    icon: 'assets/images/icons/faq.png',
                    onTap: () {},
                  ),
                  HomeItem(
                    name: 'PROGRAMAÇÃO',
                    icon: 'assets/images/icons/programacao.png',
                    onTap: () => context.goNamed('schedule'),
                  )
                ],
              ),
            ),
          ),
          Expanded(
            flex: 4,
            child: Padding(
              padding: const EdgeInsets.symmetric(
                vertical: 16,
              ),
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
  final String icon;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.vertical(
            top: Radius.circular(20),
          ),
          color: lightGreenColor,
        ),
        child: Flex(
          direction: Axis.vertical,
          children: [
            Expanded(
              flex: 2,
              child: Center(
                child: Text(
                  name,
                  style: const TextStyle(
                    color: darkGreenColor,
                    fontFamily: 'AmaticSC',
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            Expanded(
              flex: 3,
              child: Container(
                constraints: const BoxConstraints.expand(),
                decoration: const BoxDecoration(
                  color: darkGreenColor,
                  borderRadius: BorderRadius.vertical(
                    top: Radius.elliptical(600, 300),
                  ),
                ),
                child: Center(
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Image.asset(icon),
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

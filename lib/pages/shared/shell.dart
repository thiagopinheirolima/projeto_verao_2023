import 'package:flutter/material.dart';

class Shell extends StatelessWidget {
  final String title;
  final Widget child;

  const Shell({
    required this.title,
    required this.child,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ShellHeader(title: title),
        ShellBody(child: child),
      ],
    );
  }
}

class ShellBody extends StatelessWidget {
  final int flex;
  final Widget child;

  const ShellBody({
    super.key,
    this.flex = 3,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return Flexible(
      flex: flex,
      child: Container(
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.vertical(
            top: Radius.circular(25),
          ),
          color: Colors.white,
        ),
        child: child,
      ),
    );
  }
}

class ShellHeader extends StatelessWidget {
  final int flex;
  final String title;

  const ShellHeader({
    required this.title,
    this.flex = 1,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Flexible(
      flex: flex,
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
          Center(
            child: Text(
              title,
              style: const TextStyle(
                fontSize: 75,
                fontFamily: 'BebasNeue',
                color: Colors.white,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

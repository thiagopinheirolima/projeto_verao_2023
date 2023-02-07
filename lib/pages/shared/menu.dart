import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class MenuItem {
  String name;
  Function onClick;

  MenuItem(this.name, this.onClick);
}

final List<MenuItem> menuItems = [
  MenuItem('Participantes', (BuildContext context) {
    context.pushNamed('users');
  }),
  MenuItem('Logout', (BuildContext context) async {
    await FirebaseAuth.instance.signOut();
    // ignore: use_build_context_synchronously
    context.goNamed('login');
  }),
];

class Menu extends StatelessWidget {
  const Menu({
    super.key,
    required this.userPhoto,
    required this.userName,
  });

  final String userPhoto;
  final String userName;

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          DrawerHeader(
            decoration: const BoxDecoration(
              color: Colors.teal,
            ),
            child: Flex(
              direction: Axis.vertical,
              children: [
                Expanded(
                  child: Container(
                    decoration: BoxDecoration(
                        border: Border.all(
                          color: Colors.white,
                          width: 2,
                        ),
                        borderRadius: BorderRadius.circular(
                          1000,
                        )),
                    child: ClipOval(
                      child: Image.network(
                        userPhoto,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    userName,
                    style: const TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                )
              ],
            ),
          ),
          for (var item in menuItems)
            ListTile(
              title: Text(item.name),
              onTap: () => item.onClick(context),
            ),
        ],
      ),
    );
  }
}

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  HomePage({Key? key}) : super(key: key);
  final avatarImageURL =
      'https://cdn.pixabay.com/photo/2016/08/08/09/17/avatar-1577909_1280.png';

  @override
  Widget build(BuildContext context) {
    final userPhoto =
        FirebaseAuth.instance.currentUser?.photoURL ?? avatarImageURL;
    final userName =
        FirebaseAuth.instance.currentUser?.displayName ?? 'Usuário';
    return Scaffold(
        appBar: AppBar(title: const Center(child: Text('Todos Juntos'))),
        drawer: Drawer(
          child: ListView(
            padding: EdgeInsets.zero,
            children: [
              DrawerHeader(
                child: Flex(
                  direction: Axis.vertical,
                  children: [
                    Expanded(
                      child: ClipOval(
                        child: Image.network(
                          userPhoto,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        userName,
                        style: const TextStyle(
                          color: Colors.black87,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    )
                  ],
                ),
              ),
              // ListTile(
              //   title: const Text('Item 1'),
              //   onTap: () {},
              // ),
              ListTile(
                title: const Text('Logout'),
                onTap: FirebaseAuth.instance.signOut,
              ),
            ],
          ),
        ),
        body: FutureBuilder(
          future: FirebaseFirestore.instance.collection('users').get(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return GridView.builder(
                itemCount: snapshot.data?.size,
                padding: const EdgeInsets.all(8),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  childAspectRatio: 2,
                  crossAxisCount: 2,
                  mainAxisSpacing: 8,
                  crossAxisSpacing: 8,
                ),
                itemBuilder: (context, index) {
                  final user = snapshot.data?.docs[index].data();
                  return Container(
                    padding: const EdgeInsets.all(4.0),
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: Colors.black87,
                        width: 1,
                      ),
                      borderRadius: const BorderRadius.only(
                        bottomLeft: Radius.circular(40),
                        topLeft: Radius.circular(40),
                        topRight: Radius.circular(20),
                        bottomRight: Radius.circular(20),
                      ),
                    ),
                    child: Flex(
                      direction: Axis.horizontal,
                      children: [
                        Flexible(
                          fit: FlexFit.loose,
                          child: ClipOval(
                            child: Image.network(
                              user?['photo'],
                            ),
                          ),
                        ),
                        Flexible(
                          fit: FlexFit.tight,
                          child: Center(
                            child: Text(
                              user?['name'],
                              textAlign: TextAlign.center,
                            ),
                          ),
                        )
                      ],
                    ),
                  );
                },
              );
            } else {
              return const Center(
                child: Text(
                  'Carregando',
                  textScaleFactor: 2,
                ),
              );
            }
          },
        ));
  }
}

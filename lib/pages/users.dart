import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:projeto_verao_2023/pages/shared/shell.dart';

class UsersPage extends StatelessWidget {
  final title = 'Participantes';

  const UsersPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(title),
      ),
      body: Shell(
        title: title,
        child: const _Users(),
      ),
    );
  }
}

class _Users extends StatelessWidget {
  const _Users();

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
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
                  borderRadius: const BorderRadius.all(Radius.circular(5)),
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
    );
  }
}

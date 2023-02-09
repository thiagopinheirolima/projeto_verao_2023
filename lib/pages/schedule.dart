import 'package:flutter/material.dart';
import 'dart:html' as html;
import '../colors.dart';

class SchedulePage extends StatelessWidget {
  const SchedulePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Programação'),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Flexible(
            flex: 1,
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
                    'PROGRAMAÇÃO',
                    textScaleFactor: 3,
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Flexible(
            flex: 3,
            child: Container(
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.vertical(
                  top: Radius.circular(25),
                ),
                color: Colors.white,
              ),
              child: GridView.count(
                crossAxisCount: 2,
                padding: const EdgeInsets.all(16),
                childAspectRatio: 1,
                mainAxisSpacing: 16,
                crossAxisSpacing: 16,
                children: const [
                  ScheduleItem(),
                  ScheduleItem(),
                  ScheduleItem(),
                  ScheduleItem(),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class ScheduleItem extends StatelessWidget {
  const ScheduleItem({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(25)),
        color: primaryColor,
      ),
      child: Padding(
        padding: const EdgeInsets.all(8),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'CHURRASCO',
              style: TextStyle(
                color: highlightColor,
                fontSize: 22,
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Icon(
                    Icons.calendar_month,
                    color: highlightColor,
                    size: 50,
                  ),
                ),
                Text(
                  '08/07\n19:00h',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                  ),
                ),
              ],
            ),
            ElevatedButton(
              style: ButtonStyle(
                shape: MaterialStateProperty.all(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(18.0),
                  ),
                ),
              ),
              child: const Padding(
                padding: EdgeInsets.all(8.0),
                child: Text(
                  'AJUDAR A ORGANIZAR',
                  textAlign: TextAlign.center,
                ),
              ),
              onPressed: () {
                html.window.open(
                    'https://api.whatsapp.com/send?phone=+351915549968&text=Oi, eu gostaria de ajudar!',
                    '');
              },
            ),
          ],
        ),
      ),
    );
  }
}

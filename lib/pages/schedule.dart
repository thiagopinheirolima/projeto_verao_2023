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
                    style: TextStyle(
                      fontFamily: 'BebasNeue',
                      fontSize: 75,
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
                  ScheduleItem(
                    title: 'Bingo',
                    date: '07 de Julho',
                    time: 'Sexta - 12h',
                    phone: '915549968',
                  ),
                  ScheduleItem(
                    title: 'Noite de Jogos',
                    date: '07 de Julho',
                    time: 'sexta - 21h',
                    phone: '915549968',
                  ),
                  ScheduleItem(
                    title: 'Festa Junina',
                    date: '08 de Julho',
                    time: 'sábado - 19h',
                    phone: '915549968',
                  ),
                  ScheduleItem(
                    title: 'Churrasco',
                    date: '09 de Julho',
                    time: 'domingo - 12h',
                    phone: '915549968',
                  ),
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
    required this.title,
    required this.date,
    required this.time,
    required this.phone,
    super.key,
  });

  final String title;
  final String date;
  final String time;
  final String phone;

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
            Text(
              title,
              style: const TextStyle(
                fontFamily: 'BebasNeue',
                color: highlightColor,
                fontSize: 22,
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Image.asset(
                    'assets/images/icons/calendar.png',
                    width: 40,
                    height: 40,
                  ),
                ),
                Text(
                  '$date\n$time',
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    fontFamily: 'BebasNeue',
                    color: Colors.white,
                    fontSize: 18,
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 8,
            ),
            ElevatedButton(
              style: ButtonStyle(
                backgroundColor:
                    MaterialStateColor.resolveWith((states) => lightGreenColor),
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
                  style: TextStyle(
                    fontFamily: 'BebasNeue',
                    fontSize: 15.5,
                  ),
                ),
              ),
              onPressed: () {
                html.window.open(
                    'https://api.whatsapp.com/send?phone=+351$phone&text=Oi, eu gostaria de ajudar a organizar o(a) $title!',
                    '');
              },
            ),
          ],
        ),
      ),
    );
  }
}

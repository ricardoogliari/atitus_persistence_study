import 'package:atitus_persistence_study/pages/add_card.dart';
import 'package:atitus_persistence_study/pages/cards.dart';
import 'package:atitus_persistence_study/pages/login.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      initialRoute: '/', // Sets the initial route
      routes: {
        '/': (context) => Login(),
        '/cards': (context) => Cards(),
        '/add': (context) => AddCard(),
      },
    );
  }
}

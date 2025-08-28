import 'package:atitus_persistence_study/nosql_persistence/nosql_manager.dart';
import 'package:flutter/material.dart';

class Cards extends StatefulWidget {
  const Cards({super.key});

  @override
  State<Cards> createState() => _CardsState();
}

class _CardsState extends State<Cards> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Cartões'),
        actions: [
          IconButton(onPressed: () {}, icon: Icon(Icons.add)),
          IconButton(
            onPressed: () {
              logoff();
              Navigator.pushReplacementNamed(context, '/');
            },
            icon: Icon(Icons.logout),
          ),
        ],
      ),
      body: Center(child: Text('Logado')),
    );
  }
}

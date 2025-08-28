import 'package:atitus_persistence_study/model/credit_card.dart';
import 'package:atitus_persistence_study/nosql_persistence/nosql_manager.dart';
import 'package:atitus_persistence_study/sql_persistence/sql_manager.dart';
import 'package:flutter/material.dart';

class Cards extends StatefulWidget {
  const Cards({super.key});

  @override
  State<Cards> createState() => _CardsState();
}

class _CardsState extends State<Cards> {
  List<CreditCard>? cards = null;

  @override
  Widget build(BuildContext context) {
    if (cards == null) {
      listCards().then((value) {
        setState(() {
          cards = value;
        });
      });
    }
    return Scaffold(
      appBar: AppBar(
        title: Text('Cartões'),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.pushNamed(context, '/add');
            },
            icon: Icon(Icons.add),
          ),
          IconButton(
            onPressed: () {
              logoff();
              Navigator.pushReplacementNamed(context, '/');
            },
            icon: Icon(Icons.logout),
          ),
        ],
      ),
      body: Center(
        child:
            cards == null
                ? CircularProgressIndicator()
                : cards!.isEmpty
                ? Text('Nenhum cartão adicionado')
                : Text('Você possui ${cards!.length} cartões'),
      ),
    );
  }
}

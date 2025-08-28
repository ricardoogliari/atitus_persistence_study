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
  List<CreditCard>? _cards;

  @override
  Widget build(BuildContext context) {
    if (_cards == null) {
      _loadCards();
    }
    return Scaffold(
      appBar: AppBar(
        title: Text('Cartões'),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.pushNamed(
                context,
                '/add',
              ).then((value) => _loadCards());
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
            _cards == null
                ? _loading()
                : _cards!.isEmpty
                ? _withoutCards()
                : _showCards(),
      ),
    );
  }

  void _loadCards() {
    listCards().then((value) {
      setState(() {
        _cards = value;
      });
    });
  }

  Widget _withoutCards() => Text('Nenhum cartão adicionado');

  Widget _loading() => CircularProgressIndicator();

  Widget _showCards() => ListView.separated(
    itemBuilder: (context, index) => _buildItem(card: _cards![index]),
    separatorBuilder: (context, index) => Divider(),
    itemCount: _cards!.length,
  );

  Widget _buildItem({required CreditCard card}) =>
      ListTile(title: Text(card.number), subtitle: Text(card.flag));
}

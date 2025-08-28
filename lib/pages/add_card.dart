import 'package:atitus_persistence_study/model/credit_card.dart';
import 'package:atitus_persistence_study/sql_persistence/sql_manager.dart';
import 'package:flutter/material.dart';

class AddCard extends StatelessWidget {
  AddCard({super.key});

  final TextEditingController _numberController = TextEditingController();
  final TextEditingController _flagController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Add a new credit card")),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Form(
          child: Column(
            children: [
              TextFormField(
                decoration: InputDecoration(labelText: 'Number'),
                controller: _numberController,
              ),
              TextFormField(
                decoration: InputDecoration(labelText: 'Flag'),
                controller: _flagController,
                obscureText: true,
              ),
              ElevatedButton(
                onPressed: () {
                  insertCard(
                    CreditCard(
                      number: _numberController.text,
                      flag: _flagController.text,
                    ),
                  );
                  Navigator.pop(context);
                },
                child: Text('Insert'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

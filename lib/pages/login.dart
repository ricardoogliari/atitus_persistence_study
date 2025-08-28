import 'package:atitus_persistence_study/nosql_persistence/nosql_manager.dart';
import 'package:flutter/material.dart';

class Login extends StatelessWidget {
  Login({super.key});

  final TextEditingController _userController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    loggedStatus().then((value) {
      if (value) {
        Navigator.pushReplacementNamed(context, '/cards');
      }
    });

    return Scaffold(
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Form(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextFormField(
                decoration: InputDecoration(labelText: 'User'),
                controller: _userController,
              ),
              TextFormField(
                decoration: InputDecoration(labelText: 'Password'),
                controller: _passwordController,
                obscureText: true,
              ),
              SizedBox(height: 16),
              ElevatedButton(
                onPressed: () {
                  login();
                  Navigator.pushReplacementNamed(context, '/cards');
                },
                child: Text('Login'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

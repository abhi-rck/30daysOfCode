import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Text(
          "Login Page",
          style: TextStyle(
            fontSize: 20.0,
            color: Colors.deepPurple,
          ),
        ),
      ),
    );
  }
}

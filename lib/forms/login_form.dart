import 'package:flutter/material.dart';
import 'package:forestr/tools/api_interface.dart';

// Define a Custom Form Widget
class LoginForm extends StatefulWidget {
  @override
  _LoginFormState createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final usernameController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  void dispose() {
    // Clean up the controller when the Widget is disposed
    usernameController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  void _onPress() {
    print("Login button pressed");
    ApiInterface().logIn(usernameController.text, passwordController.text).then((value) => {});
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: <Widget>[
          TextField(
            controller: usernameController,
            decoration: InputDecoration(
                labelText: 'Username'
            ),
          ),
          TextField(
            controller: passwordController,
            decoration: InputDecoration(
                labelText: 'Password'
            ),
          ),
          FlatButton(
            child: Text("Log in"),
            onPressed: _onPress
          )
        ],
      ),
    );
  }
}
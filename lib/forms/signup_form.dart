import 'package:flutter/material.dart';
import 'package:forestr/tools/api_interface.dart';

// Define a Custom Form Widget
class SignupForm extends StatefulWidget {
  @override
  _SignupFormState createState() => _SignupFormState();
}

class _SignupFormState extends State<SignupForm> {
  final usernameController = TextEditingController();
  final passwordController = TextEditingController();
  final passwordRepeatController = TextEditingController();
  final emailController = TextEditingController();

  String usernameState = '';
  String passwordState = '';
  String passwordRepeatState = '';
  String emailState = '';

  String usernameWarning = '';
  String passwordWarning = '';
  String passwordRepeatWarning = '';
  String emailWarning = '';

  void validateEmail() {
    if (emailController.text.length >= 5) {
      setState(() {
        emailState = 'true';
        emailWarning = '';
      });
    }
    else {
      setState(() {
        emailState = 'false';
        emailWarning = 'Email address is too short';
      });
    }
  }

  void validateUsername() {
    if (usernameController.text.length >= 5) {
      setState(() {
        usernameState = 'true';
        usernameWarning = '';
      });
    }
    else {
      setState(() {
        usernameState = 'false';
        usernameWarning = 'Username is too short';
      });
    }
  }

  void validatePassword() {
    if (passwordController.text.length >= 5) {
      setState(() {
        passwordState = 'true';
        passwordWarning = '';
      });
    }
    else {
      setState(() {
        passwordState = 'false';
        passwordWarning = 'Password is too short';
      });
    }
  }

  void validateRepeatPassword() {
    if (passwordRepeatController.text == passwordController.text) {
      setState(() {
        passwordRepeatState = 'true';
        passwordRepeatWarning = '';
      });
    }
    else {
      setState(() {
        passwordRepeatState = 'false';
        passwordRepeatWarning = 'Password does not match';
      });
    }
  }


  @override
  void initState() {
    super.initState();
    usernameController.addListener(validateUsername);
    passwordController.addListener(validatePassword);
    passwordRepeatController.addListener(validateRepeatPassword);
    emailController.addListener(validateEmail);
  }

  @override
  void dispose() {
    // Clean up the controller when the Widget is disposed
    usernameController.dispose();
    passwordController.dispose();
    passwordRepeatController.dispose();
    emailController.dispose();
    super.dispose();
  }

  void _onPress() {
    print("Create account button pressed");
    if (passwordController.text == passwordRepeatController.text) {
      ApiInterface().signUp(usernameController.text, passwordController.text, emailController.text).then((value) => {});
    }
  }

  Widget usernameInput() {
    if (usernameState == true.toString()) {
      return TextField(
        controller: usernameController,
        decoration: InputDecoration(
          hintText: 'Username',
          suffixIcon: Icon(Icons.done),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(25.0)
          ),
          helperText: usernameWarning
        ),
      );
    }
    else if (usernameState == false.toString()){
      return TextField(
        controller: usernameController,
        decoration: InputDecoration(
          labelText: 'Username',
          suffixIcon: Icon(Icons.clear),
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(25.0)
          ),
          helperText: usernameWarning
        ),
      );
    }
    else {
      return TextField(
        controller: usernameController,
        decoration: InputDecoration(
          labelText: 'Username',
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(25.0)
          ),
          helperText: usernameWarning
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: <Widget>[
            usernameInput(),
            SizedBox(
                height: 20
            ),
            TextField(
              controller: emailController,
              decoration: InputDecoration(
                labelText: 'Email',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(25.0)
                ),
                helperText: emailWarning
              )
            ),
            SizedBox(
              height: 20
            ),
            TextField(
              controller: passwordController,
              decoration: InputDecoration(
                labelText: 'Password',
                suffixIcon: Icon(Icons.done),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(25.0)
                  ),
                helperText: passwordWarning
              ),
            ),
            SizedBox(
                height: 20
            ),
            TextField(
              controller: passwordRepeatController,
              decoration: InputDecoration(
                labelText: 'Confirm your password',
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(25.0)
                  ),
                helperText: passwordRepeatWarning
              ),
            ),
            SizedBox(
                height: 20
            ),
            RaisedButton(
                child: Text("Create Account"),
                onPressed: _onPress
            )
          ],
        ),
      ),
    );
  }
}
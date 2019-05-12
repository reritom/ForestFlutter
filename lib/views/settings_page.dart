import 'package:flutter/material.dart';

class SettingsPage extends StatefulWidget {
  @override
  _SettingsPageState createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Settings"),
      ),
      drawer: Drawer(
          child: ListView(
            padding: EdgeInsets.zero,
            children: <Widget>[
              DrawerHeader(
                child: Text('Drawer Header'),
                decoration: BoxDecoration(
                  color: Colors.blue,
                ),
              ),
              ListTile(
                title: Text('Dashboard'),
                onTap: () {
                  // Update the state of the app
                  // ...
                  Navigator.of(context).pushNamed('/');
                },
              ),
              ListTile(
                title: Text('Surveys'),
                onTap: () {
                  // Update the state of the app
                  // ...
                },
              ),
            ],
          )
      ),
    );
  }
}
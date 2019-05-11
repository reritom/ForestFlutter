import 'package:flutter/material.dart';

class SurveyPage extends StatefulWidget {
  @override
  _SurveyPageState createState() => _SurveyPageState();
}

class _SurveyPageState extends State<SurveyPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Surveys"),
      ),
      body: Center(
        child: Text("Page2"),
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
      floatingActionButton: FloatingActionButton(
          onPressed: (){},
          child: Icon(Icons.refresh)
      ),
    );
  }
}
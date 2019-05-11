import 'package:flutter/material.dart';

import 'views/survey_page.dart';

void main() => runApp(myApp());

MaterialApp myApp() {
  return MaterialApp(
    title: "Forestr",
    home: HomePage(),
    routes: <String, WidgetBuilder> {
      '/surveys': (BuildContext context) => SurveyPage()
    }
  );
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Forestr"),
      ),
      body: Center(
        child: Text("Hello world"),
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
              },
            ),
            ListTile(
              title: Text('Surveys'),
              onTap: () {
                // Update the state of the app
                // ...
                Navigator.of(context).pushNamed('/surveys');
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
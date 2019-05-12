import 'package:flutter/material.dart';

import 'views/survey_page.dart';
import 'views/settings_page.dart';
import 'views/common/nav_drawer.dart';
import 'interface.dart';

void main() => runApp(myApp());

MaterialApp myApp() {
  return MaterialApp(
    title: "Forestr",
    home: HomePage(),
    routes: <String, WidgetBuilder> {
      '/surveys': (BuildContext context) => SurveyPage(),
      '/settings': (BuildContext context) => SettingsPage()
    }
  );
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool loggedIn = false;

  @override
  void initState() {
    super.initState();
    var interface = Interface();
    interface.checkLoginStatus().then((value) {
      setState(() {
        loggedIn = value;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Forestr"),
        backgroundColor: Color(0xFF2C3539),
      ),
      body: Center(
        child: Text("Hello world}"),
      ),
      drawer: getDrawer(context),
    );
  }
}
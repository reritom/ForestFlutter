import 'package:flutter/material.dart';
//import 'dashboard.dart';

import 'views/survey_page.dart';
import 'views/settings_page.dart';
import 'package:forestr/views/dashboard.dart';

void main() => runApp(myApp());

MaterialApp myApp() {
  return MaterialApp(
    title: "Forestr",
    home: DashboardPage(),
    routes: <String, WidgetBuilder> {
      '/surveys': (BuildContext context) => SurveyPage(),
      '/settings': (BuildContext context) => SettingsPage()
    }
  );
}


/*
void main() => runApp(myApp());

MaterialApp myApp() {
  return MaterialApp(
      title: "Forestr",
      home: MenuDashboardPage()
  );
}
*/
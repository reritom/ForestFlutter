import 'package:flutter/material.dart';

Drawer getDrawer(BuildContext context) {
  return Drawer(
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
            Navigator.of(context).pushNamed('/surveys');
          },
        ),
        ListTile(
          title: Text('Settings'),
          onTap: () {
            // Update the state of the app
            // ...
            Navigator.of(context).pushNamed('/settings');
          },
        ),
      ],
    )
  );
}

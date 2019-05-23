import 'package:flutter/material.dart';

import 'package:forestr/views/common/nav_drawer.dart';
import 'package:forestr/forms/login_form.dart';
import 'package:forestr/forms/signup_form.dart';
import 'package:forestr/tools/api_interface.dart';

class DashboardPage extends StatefulWidget {
  @override
  _DashboardPageState createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  bool loggedIn = false;

  @override
  void initState() {
    super.initState();
    ApiInterface().checkLoginStatus().then((value) {
      setState(() {
        loggedIn = value;
      });
    });

    print("Dashboard registering login callback");
    ApiInterface().onLogin(() {
      setState(() {
        loggedIn = true;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return getScaffold(context, loggedIn);
  }
}

Widget getScaffold(BuildContext context, bool loggedIn) {
  if (loggedIn) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Forestr"),
        backgroundColor: Color(0xFF2C3539),
      ),
      body: Center(
        child: Text("Dashboard"),
      ),
      drawer: getDrawer(context),
    );
  } else {
    return getAuthView();
  }
}

Widget getAuthView() {
  return DefaultTabController(
      length: 2,
      child: Scaffold(
          appBar: PreferredSize(
            preferredSize: Size.fromHeight(50.0),
            child: AppBar(
              backgroundColor: Color(0xFF2C3539),
              bottom: TabBar(
                tabs: [
                  Tab(child: Text("Log in")),
                  Tab(child: Text("Sign up"))
                ],
              )
            ),
          ),
          body: TabBarView(
            children: [
              LoginForm(),
              SignupForm()
            ],
          )));
}

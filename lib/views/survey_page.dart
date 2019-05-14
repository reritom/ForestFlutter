import 'package:flutter/material.dart';
import '../tools/bom.dart';
import '../models/survey.dart';

class SurveyPage extends StatefulWidget {
  @override
  _SurveyPageState createState() => _SurveyPageState();
}

class _SurveyPageState extends State<SurveyPage> {
  String _state = 'viewing';
  void _stateUpdate(value) {
    setState(() {
      _state = value;
    });
  }

  List<Survey> surveys = [];

  @override
  void initState() {
    super.initState();
    Bom().getSurveys().then((value){
      setState(() {
        surveys = value;
      });
    }).catchError((error) => print(error));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Surveys"),
      ),
      body: ListView.builder(
          itemCount: surveys.length,
          itemBuilder: (BuildContext context, index) => ListTile(title: Text(surveys[index].id),)),
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
      floatingActionButton: getFAB(_state, _stateUpdate)
    );
  }
}

FloatingActionButton getFAB(_state, _stateUpdate) {
  if (_state  == 'viewing') {
    return FloatingActionButton(
      onPressed: () {
        _stateUpdate('adding');
      },
      child: Icon(Icons.add),
      backgroundColor: Colors.greenAccent,
    );
  } else {
      return FloatingActionButton(
        onPressed: () {
          _stateUpdate('viewing');
        },
        child: Icon(Icons.save),
        backgroundColor: Colors.redAccent,
      );
  }
}
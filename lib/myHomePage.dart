import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class myHomePage extends StatefulWidget {
  @override
  _myHomePageState createState() => _myHomePageState();
}

class _myHomePageState extends State<myHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home Page'),
        backgroundColor: Colors.red,
        elevation: defaultTargetPlatform == TargetPlatform.android ? 5.0 : 0.0,
      ),
      body: Center(
        child: Text('Please use drawer to select page. This is a demo.'),
        ),
      drawer: new Drawer(
        child: new ListView(
          children: <Widget>[
            new ListTile(
              title: new Text("Add User"),
              trailing: new Icon(Icons.person_add),
            ),
            new ListTile(
              title: new Text("Modify User"),
              trailing: new Icon(Icons.mode_edit),
            ),
            new ListTile(
              title: new Text("Show Users"),
              trailing: new Icon(Icons.person),
            ),
            new Divider(),
            new ListTile(
              title: new Text("Close App"),
              trailing: new Icon(Icons.close),
            ),
          ]
        ),
      ),
    );
  }
}
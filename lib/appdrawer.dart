import 'package:flutter/material.dart';

class AppDrawer extends StatefulWidget {
  @override
  _AppDrawerState createState() => _AppDrawerState();
}

class _AppDrawerState extends State<AppDrawer> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(children: <Widget>[
        ListTile(
          title: new Text("My Profile"),
          trailing: new Icon(Icons.person),
          onTap: () => Navigator.of(context).popAndPushNamed("/profile"),
        ),
        ListTile(
          title: new Text("Social"),
          trailing: new Icon(Icons.people),
          onTap: () => Navigator.of(context).popAndPushNamed("/social"),
        ),
        ListTile(
          title: new Text("Exercise"),
          trailing: new Icon(Icons.fitness_center),
          onTap: () => Navigator.of(context).popAndPushNamed("/exercise"),
        ),
        ListTile(
          title: new Text("Diet"),
          trailing: new Icon(Icons.restaurant),
          onTap: () => Navigator.of(context).popAndPushNamed("/diet"),
        ),
        ListTile(
          title: new Text("Sleep"),
          trailing: new Icon(Icons.bedtime),
          onTap: () => Navigator.of(context).popAndPushNamed("/sleep"),
        ),
        ListTile(
          title: new Text("Mental Health"),
          trailing: new Icon(Icons.sentiment_very_satisfied),
          onTap: () => Navigator.of(context).popAndPushNamed("/mhealth"),
        ),
        Divider(),
        ListTile(
          title: new Text("Close"),
          trailing: new Icon(Icons.close),
          onTap: () => Navigator.of(context).pop(),
        ),
      ]),
    );
  }
}

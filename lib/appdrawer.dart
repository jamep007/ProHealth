import 'package:flutter/material.dart';
import 'package:senior_project_swauhealthapp/Profile/profileChallenge.dart';
import 'package:senior_project_swauhealthapp/Profile/profilepage.dart';

class AppDrawer extends StatefulWidget {
  @override
  _AppDrawerState createState() => _AppDrawerState();
}

int _index = 0;

class _AppDrawerState extends State<AppDrawer> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(children: <Widget>[
        DrawerHeader(
            decoration: BoxDecoration(
                gradient: LinearGradient(
                    colors: <Color>[Colors.lightBlue, Colors.blue])),
            child: Container(
              child: Column(
                children: <Widget>[
                  Material(
                    borderRadius: BorderRadius.all(Radius.circular(50.0)),
                    elevation: 10,
                    child: Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Icon(
                        Icons.person_outline,
                        size: 40,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 4,
                  ),
                  Text(
                    'Username',
                    style: TextStyle(color: Colors.white, fontSize: 20.0),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      FlatButton(
                          //color: Colors.lightBlue,
                          padding: EdgeInsets.only(
                              top: 5, bottom: 5, left: 20, right: 20),
                          child: Row(
                            children: [
                              Icon(
                                Icons.person,
                                color: Colors.white,
                              ),
                              SizedBox(
                                width: 4,
                              ),
                              Text(
                                "My Profile",
                                style: TextStyle(color: Colors.white),
                              ),
                            ],
                          ),
                          onPressed: () {
                            _index = 0;
                            Navigator.of(context).popAndPushNamed("/profile");
                          }),
                      Text(
                        "|",
                        style: TextStyle(color: Colors.white),
                      ),
                      FlatButton(
                          //color: Colors.lightBlue,
                          padding: EdgeInsets.only(
                              top: 5, bottom: 5, left: 20, right: 20),
                          child: Row(
                            children: [
                              Icon(
                                Icons.settings,
                                color: Colors.white,
                              ),
                              SizedBox(
                                width: 4,
                              ),
                              Text(
                                "Settings",
                                style: TextStyle(color: Colors.white),
                              ),
                            ],
                          ),
                          onPressed: () {
                            _index = 0;
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        ProfilePage(passedIndex: 3)));
                          }),
                    ],
                  ),
                ],
              ),
            )),
        ListTile(
          title: _index == 1
              ? Text(
                  "Social",
                  style: TextStyle(color: Colors.blue),
                )
              : Text("Social"),
          trailing: _index == 1
              ? Icon(
                  Icons.people,
                  color: Colors.blue,
                )
              : Icon(Icons.people),
          onTap: () {
            _index = 1;
            Navigator.of(context).popAndPushNamed("/social");
          },
        ),
        ListTile(
          title: _index == 2
              ? Text(
                  "Exercise",
                  style: TextStyle(color: Colors.blue),
                )
              : Text("Exercise"),
          trailing: _index == 2
              ? Icon(
                  Icons.fitness_center,
                  color: Colors.blue,
                )
              : Icon(Icons.fitness_center),
          onTap: () {
            _index = 2;
            Navigator.of(context).popAndPushNamed("/exercise");
          },
        ),
        ListTile(
          title: _index == 3
              ? Text(
                  "Nutrition",
                  style: TextStyle(color: Colors.blue),
                )
              : Text("Nutrition"),
          trailing: _index == 3
              ? Icon(
                  Icons.restaurant,
                  color: Colors.blue,
                )
              : Icon(Icons.restaurant),
          onTap: () {
            _index = 3;
            Navigator.of(context).popAndPushNamed("/diet");
          },
        ),
        ListTile(
          title: _index == 4
              ? Text(
                  "Sleep",
                  style: TextStyle(color: Colors.blue),
                )
              : Text("Sleep"),
          trailing: _index == 4
              ? Icon(
                  Icons.bedtime,
                  color: Colors.blue,
                )
              : Icon(Icons.bedtime),
          onTap: () {
            _index = 4;
            Navigator.of(context).popAndPushNamed("/sleep");
          },
        ),
        ListTile(
          title: _index == 5
              ? Text(
                  "Mental Health",
                  style: TextStyle(color: Colors.blue),
                )
              : Text("Mental Health"),
          trailing: _index == 5
              ? Icon(
                  Icons.sentiment_very_satisfied,
                  color: Colors.blue,
                )
              : Icon(Icons.sentiment_very_satisfied),
          onTap: () {
            _index = 5;
            Navigator.of(context).popAndPushNamed("/mhealth");
          },
        ),
        Divider(),
        ListTile(
          title: new Text("Close"),
          trailing: new Icon(Icons.close),
          onTap: () => Navigator.of(context).pop(),
        ),
        ListTile(
          title: new Text("Log Out"),
          trailing: new Icon(Icons.logout),
          onTap: () => Navigator.of(context).pushNamedAndRemoveUntil(
              "/login", (Route<dynamic> route) => false),
        ),
      ]),
    );
  }
}

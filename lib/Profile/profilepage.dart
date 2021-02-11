import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:senior_project_swauhealthapp/appdrawer.dart';
import 'package:senior_project_swauhealthapp/Profile/profileHome.dart';
import 'package:senior_project_swauhealthapp/Profile/profileHistory.dart';
import 'package:senior_project_swauhealthapp/Profile/profileChallenge.dart';
import 'package:senior_project_swauhealthapp/Profile/profileSettings.dart';

class ProfilePage extends StatefulWidget {
  final int passedIndex;
  ProfilePage({Key key, @required this.passedIndex}) : super(key: key);
  @override
  _ProfilePageState createState() => _ProfilePageState(passedIndex);
}

class _ProfilePageState extends State<ProfilePage> {
  int _currentIndex;
  _ProfilePageState(this._currentIndex);

  final List<Widget> _profileTabs = [
    ProfileHome(),
    ProfileHistory(),
    ProfileChallenge(),
    ProfileSettings(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text("Profile Page"),
          flexibleSpace: Container(
            decoration: BoxDecoration(
                gradient: LinearGradient(
                    begin: Alignment.centerLeft,
                    end: Alignment.centerRight,
                    colors: <Color>[Colors.lightBlue, Colors.blue])),
          )),
      drawer: AppDrawer(),
      body: _profileTabs[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        onTap: (int index) => setState(() => _currentIndex = index),
        currentIndex: _currentIndex,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            title: Text(
              "Home",
              textAlign: TextAlign.center,
            ),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.history),
            title: Text(
              "History",
              textAlign: TextAlign.center,
            ),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.self_improvement),
            title: Text(
              "Challenges",
              textAlign: TextAlign.center,
            ),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            title: Text(
              "Settings",
              textAlign: TextAlign.center,
            ),
          ),
        ],
        unselectedItemColor: Colors.grey[800],
        fixedColor: Colors.blue,
      ),
    );
  }
}

import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:senior_project_swauhealthapp/appdrawer.dart';
import 'package:senior_project_swauhealthapp/Diet/diet_planning.dart';
import 'package:senior_project_swauhealthapp/Diet/diet_tracking.dart';

class DietPage extends StatefulWidget {
  @override
  _DietPageState createState() => _DietPageState();
}

class _DietPageState extends State<DietPage> {
  int _currentIndex = 0;

  final List<Widget> _pageBodyWidgets = [
    DietPlanning(),
    DietTracking(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text("Nutrition"),
          flexibleSpace: Container(
            decoration: BoxDecoration(
                gradient: LinearGradient(
                    begin: Alignment.centerLeft,
                    end: Alignment.centerRight,
                    colors: <Color>[Colors.lightBlue, Colors.blue])),
          )),
      body: _pageBodyWidgets[_currentIndex],
      drawer: AppDrawer(),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        onTap: (int index) => setState(() => _currentIndex = index),
        currentIndex: _currentIndex,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.next_plan_rounded),
            title: Text(
              "Planning",
              textAlign: TextAlign.center,
            ),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.update_rounded),
            title: Text(
              "Tracking",
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

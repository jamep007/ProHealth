import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:senior_project_swauhealthapp/appdrawer.dart';

class MHealthPage extends StatefulWidget {
  @override
  _MHealthPageState createState() => _MHealthPageState();
}

class _MHealthPageState extends State<MHealthPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text("Mental Health Page"),
          flexibleSpace: Container(
            decoration: BoxDecoration(
                gradient: LinearGradient(
                    begin: Alignment.centerLeft,
                    end: Alignment.centerRight,
                    colors: <Color>[Colors.lightBlue, Colors.blue])),
          )),
      body: Container(),
      drawer: AppDrawer(), 
    );
  }
}

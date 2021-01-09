import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:senior_project_swauhealthapp/AddUser.dart';
import 'package:senior_project_swauhealthapp/ShowUsers.dart';
import 'package:senior_project_swauhealthapp/ModifyUser.dart';
import 'package:senior_project_swauhealthapp/myHomePage.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter App with MYSQL',
      home: new myHomePage(),
      routes: <String, WidgetBuilder>{
        "/adduser": (BuildContext context) => new AddUser(),
        "/moduser": (BuildContext context) => new ModifyUser(),
        "/showusers": (BuildContext context) => new ShowUsers(),
      },
    );
  }
}

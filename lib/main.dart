import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'package:senior_project_swauhealthapp/myHomePage.dart';
import 'package:senior_project_swauhealthapp/Profile/profilepage.dart';
import 'package:senior_project_swauhealthapp/Social/socialpage.dart';
import 'package:senior_project_swauhealthapp/Exercise/exercisepage.dart';
import 'package:senior_project_swauhealthapp/Diet/dietpage.dart';
import 'package:senior_project_swauhealthapp/Sleep/sleeppage.dart';
import 'package:senior_project_swauhealthapp/MentalHealth/mhealthpage.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter App with MYSQL',
      home: new myHomePage(),
      routes: <String, WidgetBuilder>{
        "/profile": (BuildContext context) => new ProfilePage(),
        "/social": (BuildContext context) => new SocialPage(),
        "/exercise": (BuildContext context) => new ExercisePage(),
        "/diet": (BuildContext context) => new DietPage(),
        "/sleep": (BuildContext context) => new SleepPage(),
        "/mhealth": (BuildContext context) => new MHealthPage(),
      },
    );
  }
}

import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:senior_project_swauhealthapp/appdrawer.dart';
import 'survey.dart';


class MHealthPage extends StatefulWidget {
  @override
  _MHealthPageState createState() => _MHealthPageState();

  
}
bool hasDoneSurvey = false;
class _MHealthPageState extends State<MHealthPage> {
void initState() {
    super.initState();
    if(!hasDoneSurvey){
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      await showDialog(
        context: context,
        builder: (BuildContext context) => userSurvey(context));
    });}
  }

  
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
          drawer: AppDrawer(),
      body: ListView(children: [
        RaisedButton(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
            Text("Press me"),
            Icon(Icons.add),
          ],),
          onPressed: () {
            showDialog(context: context, builder: (BuildContext context) => userSurvey(context));
        })
      ],),
    );
  }
}
import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:senior_project_swauhealthapp/appdrawer.dart';

final List<String> emotions = ['Happy', 'Sad', 'Angry', 'Depressed', 'Anxious'];

final _formKey = GlobalKey<FormState>();
  
  Widget userSurvey(BuildContext context) {
    return SimpleDialog(
      title: Text("Please Tell Us How You Are Feeling",
      style: TextStyle(fontWeight: FontWeight.w700)),
      children: [
        Form(key: _formKey,
        child: Column(
          children: <Widget> [
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Text('How are you currently feeling?',
            style: TextStyle(fontSize: 15.5, fontWeight: FontWeight.w500),),
            ),
            TextFormField(
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter some text';
                }
                return null;
              },
              decoration: InputDecoration(
                border: UnderlineInputBorder(),
                fillColor: Colors.grey,
                focusColor: Colors.grey,
                labelText: 'Great, Good, Fine, Not so good, Not good'
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Text('How would you rate your overall mental health?',
              style: TextStyle(fontSize: 15.5, fontWeight: FontWeight.w500),)
            ),
            TextFormField(
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter some text';
                }
                return null;
              },
              decoration: InputDecoration(
                border: UnderlineInputBorder(),
                fillColor: Colors.grey,
                focusColor: Colors.grey,
                labelText: 'Great, Good, Somewhat good, Average, Poor, Not sure'
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Text('During the past two weeks, how often has your mental health affected your relationships?',
              style: TextStyle(fontSize: 15.5, fontWeight: FontWeight.w500),)
            ),
            TextFormField(
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter some text';
                }
                return null;
              },
              decoration: InputDecoration(
                border: UnderlineInputBorder(),
                fillColor: Colors.grey,
                focusColor: Colors.grey,
                labelText: 'very often, somewhat often, not so often, not at all'
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Text('Have you ever been diagnosed with a mental disorder before?',
              style: TextStyle(fontSize: 15.5, fontWeight: FontWeight.w500),)
            ),
            TextFormField(
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter some text';
                }
                return null;
              },
              decoration: InputDecoration(
                border: UnderlineInputBorder(),
                fillColor: Colors.grey,
                focusColor: Colors.grey,
                labelText: 'Yes, No'
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState.validate()) {
                    ScaffoldMessenger.of(context)
                    .showSnackBar(SnackBar(content: Text('Survey Submitted!')));
                  }
                }, child: Text('Submit'),
              ),
            )
          ]
          )
        )
      ]
        );
  }
  
  


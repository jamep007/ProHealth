import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:senior_project_swauhealthapp/appdrawer.dart';

class ExerciseResources extends StatefulWidget {
  @override
  _ExerciseResourcesState createState() => _ExerciseResourcesState();
}

class _ExerciseResourcesState extends State<ExerciseResources> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text("Resources"),
    );
  }
}

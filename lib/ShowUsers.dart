import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class ShowUsers extends StatefulWidget {
  @override
  _ShowUsersState createState() => _ShowUsersState();
}

class _ShowUsersState extends State<ShowUsers> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: new Text("Show all users page."),
      ),
    );
  }
}

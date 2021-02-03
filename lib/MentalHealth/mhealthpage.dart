import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class MHealthPage extends StatefulWidget {
  @override
  _MHealthPageState createState() => _MHealthPageState();
}

class _MHealthPageState extends State<MHealthPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
        title: Text("Mental Health Page"),
      ),
      body: Container(),
    );
  }
}

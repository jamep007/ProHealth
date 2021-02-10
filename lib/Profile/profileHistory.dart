import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class ProfileHistory extends StatefulWidget {
  @override
  _ProfileHistoryState createState() => _ProfileHistoryState();
}

class _ProfileHistoryState extends State<ProfileHistory> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text("Profile History"),
    );
  }
}

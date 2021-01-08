import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class ModifyUser extends StatefulWidget {
  @override
  _ModifyUserState createState() => _ModifyUserState();
}

class _ModifyUserState extends State<ModifyUser> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: new Text("Modify user page."),
      ),
    );
  }
}
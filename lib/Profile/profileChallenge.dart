import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class ProfileChallenge extends StatefulWidget {
  @override
  _ProfileChallengeState createState() => _ProfileChallengeState();
}

class _ProfileChallengeState extends State<ProfileChallenge> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text("Profile Challenges"),
    );
  }
}

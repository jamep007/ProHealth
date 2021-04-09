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
    return ListView(
      children: ListTile.divideTiles(
        context: context,
        tiles: [
          ListTile(
              leading: Icon(Icons.directions_run, size: 30.0),
              title: Text('Cardio Challenge'),
              subtitle: Text('Test your Cardio exercise abilities!'),
              trailing: Icon(Icons.arrow_right)),
          ListTile(
              leading: Icon(Icons.restaurant, size: 30.0),
              title: Text('Diet Challenge'),
              subtitle: Text('Try changing and improving your nutrition!'),
              trailing: Icon(Icons.arrow_right)),
          ListTile(
              leading: Icon(Icons.bedtime, size: 30.0),
              title: Text('Sleep Challenge'),
              subtitle: Text('Try changing and adjusting your sleep schedule!'),
              trailing: Icon(Icons.arrow_right)
              ),
          ListTile(
              leading: Icon(Icons.healing, size: 30.0),
              title: Text('Mental Health Challenge'),
              subtitle:
                  Text('Improve your mental health in the best way possible!'),
              trailing: Icon(Icons.arrow_right)),
          ListTile(
              leading: Icon(Icons.fitness_center, size: 30.0),
              title: Text('Weight Lifting Challenge'),
              subtitle: Text('Test your lifting abilities!'),
              trailing: Icon(Icons.arrow_right)),
          ListTile(
              leading: Icon(Icons.self_improvement, size: 30.0),
              title: Text('Meditation Challenge'),
              subtitle: Text('Try this challenge to relax your mind and body!'),
              trailing: Icon(Icons.arrow_right))
        ],
      ).toList(),
    );
  }
}

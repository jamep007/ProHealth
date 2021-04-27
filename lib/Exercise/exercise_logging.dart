import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:senior_project_swauhealthapp/appdrawer.dart';
import 'package:senior_project_swauhealthapp/Exercise/exercise_model.dart';

class ExerciseLogging extends StatefulWidget {
  @override
  _ExerciseLoggingState createState() => _ExerciseLoggingState();
}

WorkoutPlan tempWorkout;
List<Exercise> loggedExercises = [];

class _ExerciseLoggingState extends State<ExerciseLogging> {
  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: _getExercises,
      child: ListView.builder(
        itemCount: loggedExercises.length + 1,
        itemBuilder: (context, int index) {
          if (index == 0) {
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                "Logged Exercises",
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
              ),
            );
          } else {
            return Padding(
                padding: const EdgeInsets.all(8.0),
                child: Card(
                  elevation: 4,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(18)),
                  child: FlatButton(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(18)),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: ListTile(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(18)),
                        title: Text(
                          loggedExercises[index + 1].name,
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.w500),
                        ),
                        subtitle: Padding(
                          padding: const EdgeInsets.only(top: 8.0),
                          child: Text(
                            loggedExercises[index + 1].description +
                                loggedExercises[index + 1].intensity,
                            style: TextStyle(fontWeight: FontWeight.w400),
                          ),
                        ),
                        trailing: Text(
                          loggedExercises[index + 1].date,
                          style: TextStyle(fontSize: 16),
                        ),
                      ),
                    ),
                    onPressed: () {
                      setState(() {
                        tempWorkout = workouts[index - 1];
                      });
                    },
                  ),
                ));
          }
        },
      ),
    );
  }

  Future<void> _getExercises() async {
    setState(() {});
  }
}

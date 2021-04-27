import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:senior_project_swauhealthapp/Exercise/exercise_model.dart';
import 'package:senior_project_swauhealthapp/appdrawer.dart';

class ExercisePlanning extends StatefulWidget {
  @override
  _ExercisePlanningState createState() => _ExercisePlanningState();
}

class _ExercisePlanningState extends State<ExercisePlanning> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: workouts.length + 1,
      itemBuilder: (context, int index) {
        if (index == 0) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              "View Workout Plans",
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
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ListTile(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(18)),
                    title: Text(
                      workouts[index - 1].workoutName,
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
                    ),
                    subtitle: Padding(
                      padding: const EdgeInsets.only(top: 8.0),
                      child: Text(
                        workouts[index - 1].workoutDescription,
                        style: TextStyle(fontWeight: FontWeight.w400),
                      ),
                    ),
                    trailing: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          height: 30,
                          width: 60,
                          child: FlatButton(
                            child: Icon(Icons.more_horiz_rounded),
                            onPressed: () {},
                          ),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Text(
                          "Days: 3",
                          style: TextStyle(fontSize: 16),
                        ),
                      ],
                    ),
                  ),
                )),
          );
        }
      },
    );
  }
}

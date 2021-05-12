import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:senior_project_swauhealthapp/Exercise/exercise_model.dart';
import 'package:senior_project_swauhealthapp/appdrawer.dart';
import 'package:senior_project_swauhealthapp/Exercise/exercise_planning.dart';
import 'package:senior_project_swauhealthapp/Exercise/exercise_logging.dart';
import 'package:senior_project_swauhealthapp/Exercise/exercise_resources.dart';

class ExercisePage extends StatefulWidget {
  @override
  _ExercisePageState createState() => _ExercisePageState();
}

bool submitted = false;
final _formKey = GlobalKey<FormState>();
final _logFormKey = GlobalKey<FormState>();
WorkoutPlan newWorkoutPlan = WorkoutPlan.empty();

class _ExercisePageState extends State<ExercisePage> {
  int _currentIndex = 0;

  final List<Widget> _pageBodyWidgets = [
    ExercisePlanning(),
    ExerciseLogging(),
    ExerciseResources(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text("Exercise"),
          flexibleSpace: Container(
            decoration: BoxDecoration(
                gradient: LinearGradient(
                    begin: Alignment.centerLeft,
                    end: Alignment.centerRight,
                    colors: <Color>[Colors.lightBlue, Colors.blue])),
          )),
      drawer: AppDrawer(),
      body: GestureDetector(
          onTap: () {
            FocusScope.of(context).requestFocus(new FocusNode());
            if (submitted) submitted = !submitted;
          },
          child: _pageBodyWidgets[_currentIndex]),
      floatingActionButton: _currentIndex == 0
          ? FloatingActionButton(
              onPressed: () {
                setState(() {
                  showDialog(
                      context: context,
                      builder: (_) {
                        return addWorkoutDialog(context);
                      });
                });
              },
              child: Icon(
                Icons.addchart_rounded,
                color: Colors.white,
              ),
              backgroundColor: Colors.lightBlue,
            )
          : _currentIndex == 1
              ? FloatingActionButton(
                  onPressed: () {
                    showDialog(
                        context: context,
                        builder: (_) {
                          return logExerciseDialog(context);
                        }).then((_) => setState(() {}));
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.directions_walk_rounded, color: Colors.white),
                      Icon(
                        Icons.add,
                        color: Colors.white,
                        size: 15,
                      )
                    ],
                  ),
                  backgroundColor: Colors.lightBlue,
                )
              : null,
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        onTap: (int index) => setState(() => _currentIndex = index),
        currentIndex: _currentIndex,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.next_plan_rounded),
            title: Text(
              "Planning",
              textAlign: TextAlign.center,
            ),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.update_rounded),
            title: Text(
              "Logging",
              textAlign: TextAlign.center,
            ),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.open_in_browser_rounded),
            title: Text(
              "Resources",
              textAlign: TextAlign.center,
            ),
          ),
        ],
        unselectedItemColor: Colors.grey[800],
        fixedColor: Colors.blue,
      ),
    );
  }
}

List<Widget> dayFormWidgets(List<DayForm> list) {
  print(list.length);
  List<Widget> widgetList;
  for (int i = 0; i < list.length; i++) {
    widgetList.add(Column(
      children: [
        //Potentially will be a dropdownbutton that lists all exercises available from an external database.
        TextFormField(
          controller: list[i].NameController,
          decoration: InputDecoration(
            hintText: "What exercise do you want to add?",
            labelText: "Exercise Name*",
            contentPadding: const EdgeInsets.all(8.0),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(18.0),
            ),
          ),
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'Please enter the name.';
            }
            return null;
          },
        ),
        TextFormField(
          controller: list[i].DescriptionController,
          maxLines: 5,
          decoration: InputDecoration(
            hintText:
                "What additional information would you like to include about this exercise?",
            labelText: "Additional Info*",
            contentPadding: const EdgeInsets.all(8.0),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(18.0),
            ),
          ),
        ),
        //This will become a dropdownbutton
        TextFormField(
          controller: list[i].TypeController,
          decoration: InputDecoration(
            hintText: "What type of exercise?",
            labelText: "Exercise Type*",
            contentPadding: const EdgeInsets.all(8.0),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(18.0),
            ),
          ),
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'Please enter the type.';
            }
            return null;
          },
        ),
        //Also will be a dropdownbutton
        TextFormField(
          controller: list[i].IntensityController,
          decoration: InputDecoration(
            hintText: "What is the intensity?",
            labelText: "Intensity*",
            contentPadding: const EdgeInsets.all(8.0),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(18.0),
            ),
          ),
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'Please enter the intensity.';
            }
            return null;
          },
        ),
        //Will be a time picker
        TextFormField(
          controller: list[i].TimeController,
          decoration: InputDecoration(
            hintText: "How long will the exercise be? In minutes.",
            labelText: "Time*",
            contentPadding: const EdgeInsets.all(8.0),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(18.0),
            ),
          ),
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'Please enter the time.';
            }
            return null;
          },
        ),
        TextFormField(
          controller: list[i].WeightController,
          decoration: InputDecoration(
            hintText: "Enter weight if applicable",
            labelText: "Weight(lbs)",
            contentPadding: const EdgeInsets.all(8.0),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(18.0),
            ),
          ),
        ),
        TextFormField(
          controller: list[i].SetsController,
          decoration: InputDecoration(
            hintText: "Enter how many sets if applicable",
            labelText: "Sets",
            contentPadding: const EdgeInsets.all(8.0),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(18.0),
            ),
          ),
        ),
        TextFormField(
          controller: list[i].RepsController,
          decoration: InputDecoration(
            hintText: "Enter the reps if applicable.",
            labelText: "Reps",
            contentPadding: const EdgeInsets.all(8.0),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(18.0),
            ),
          ),
        ),
      ],
    ));
  }
}

Widget logExerciseDialog(BuildContext context) {
  TextEditingController exerciseName = TextEditingController();
  TextEditingController exerciseDescription = TextEditingController();
  TextEditingController exerciseDate = TextEditingController();
  TextEditingController exerciseIntensity = TextEditingController();
  TextEditingController exerciseTime = TextEditingController();
  TextEditingController exerciseWeight = TextEditingController();
  TextEditingController exerciseSets = TextEditingController();
  TextEditingController exerciseReps = TextEditingController();
  return SimpleDialog(
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(18))),
      title: Text("Log New Exercise"),
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 18.0, bottom: 8),
          child: Text(
            "* : required to continue.",
            textAlign: TextAlign.start,
            style: TextStyle(color: Colors.red, fontSize: 13),
          ),
        ),
        Form(
          key: _logFormKey,
          child: Column(
            children: [
              Padding(
                  padding: EdgeInsets.all(8),
                  child: SizedBox(
                    height: 300,
                    width: 300,
                    child: ListView(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                            width: 200,
                            child: TextFormField(
                              controller: exerciseName,
                              decoration: InputDecoration(
                                hintText: "What is the exercise called?",
                                labelText: "Exercise Name*",
                                contentPadding: const EdgeInsets.all(8.0),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(18.0),
                                ),
                              ),
                              onSaved: (String value) {
                                exerciseName.text = value;
                              },
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Please enter the name.';
                                }
                                return null;
                              },
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                            width: 200,
                            child: TextFormField(
                              controller: exerciseDescription,
                              maxLines: 5,
                              decoration: InputDecoration(
                                hintText: "Describe the exercise.",
                                labelText: "Description",
                                contentPadding: const EdgeInsets.all(8.0),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(18.0),
                                ),
                              ),
                              onSaved: (String value) {
                                exerciseDescription.text = value;
                              },
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                            width: 200,
                            child: TextFormField(
                              controller: exerciseDate,
                              decoration: InputDecoration(
                                hintText:
                                    "What date did you perform this exercise?",
                                labelText: "Date*",
                                contentPadding: const EdgeInsets.all(8.0),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(18.0),
                                ),
                              ),
                              onSaved: (String value) {
                                exerciseDate.text = value;
                              },
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Please enter the date.';
                                }
                                return null;
                              },
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                            width: 200,
                            child: TextFormField(
                              controller: exerciseIntensity,
                              decoration: InputDecoration(
                                hintText:
                                    "What is the intensity of the exercise?",
                                labelText: "Intensity*",
                                contentPadding: const EdgeInsets.all(8.0),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(18.0),
                                ),
                              ),
                              onSaved: (String value) {
                                exerciseIntensity.text = value;
                              },
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Please enter the intensity.';
                                }
                                return null;
                              },
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                            width: 200,
                            child: TextFormField(
                              controller: exerciseTime,
                              keyboardType: TextInputType.number,
                              decoration: InputDecoration(
                                hintText:
                                    "How long is the exercise? In minutes.",
                                labelText: "Time Spent*",
                                contentPadding: const EdgeInsets.all(8.0),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(18.0),
                                ),
                              ),
                              onSaved: (String value) {
                                exerciseTime.text = value;
                              },
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Please enter the time spent.';
                                }
                                return null;
                              },
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                            width: 200,
                            child: TextFormField(
                              controller: exerciseWeight,
                              keyboardType: TextInputType.number,
                              decoration: InputDecoration(
                                hintText: "What weight did you use?",
                                labelText: "Weight",
                                contentPadding: const EdgeInsets.all(8.0),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(18.0),
                                ),
                              ),
                              onSaved: (String value) {
                                exerciseWeight.text = value;
                              },
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                width: 125,
                                child: TextFormField(
                                  controller: exerciseSets,
                                  keyboardType: TextInputType.number,
                                  decoration: InputDecoration(
                                    hintText:
                                        "How many sets was in the exercise?",
                                    labelText: "# of Sets",
                                    contentPadding: const EdgeInsets.all(8.0),
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(18.0),
                                    ),
                                  ),
                                  onSaved: (String value) {
                                    exerciseSets.text = value;
                                  },
                                ),
                              ),
                              Container(
                                width: 125,
                                child: TextFormField(
                                  controller: exerciseReps,
                                  keyboardType: TextInputType.number,
                                  decoration: InputDecoration(
                                    hintText:
                                        "How many repititions was in each set?",
                                    labelText: "# of Reps",
                                    contentPadding: const EdgeInsets.all(8.0),
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(18.0),
                                    ),
                                  ),
                                  onSaved: (String value) {
                                    exerciseReps.text = value;
                                  },
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  )),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: RaisedButton(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(18.0),
                  ),
                  onPressed: () {
                    if (_logFormKey.currentState.validate()) {
                      _logFormKey.currentState.save();
                      Exercise newLoggedExercise = Exercise(
                          exerciseName.text,
                          exerciseDescription.text,
                          exerciseDate.text,
                          exerciseIntensity.text,
                          exerciseTime.text,
                          int.parse(exerciseWeight.text),
                          int.parse(exerciseSets.text),
                          int.parse(exerciseReps.text));
                      Navigator.pop(context);
                      loggedExercises.add(newLoggedExercise);
                      print(loggedExercises.length);
                    }
                  },
                  color: Colors.lightBlue,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Add Log",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                            fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Icon(
                        Icons.arrow_right_alt_rounded,
                        color: Colors.white,
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        )
      ]);
}

Widget addWorkoutDialog(BuildContext context) {
  TextEditingController workoutNameController = TextEditingController();
  TextEditingController workoutDescriptionController = TextEditingController();
  TextEditingController workoutDaysController = TextEditingController();
  int daysTemp = 0;
  print(newWorkoutPlan.listOfDayForms.length);
  if (submitted) {
    return SimpleDialog(
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(18.0))),
      title: Text("Add Exercises"),
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 18.0, bottom: 8),
          child: Text(
            "* : required to continue.",
            textAlign: TextAlign.start,
            style: TextStyle(color: Colors.red, fontSize: 13),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(12.0),
          child: Container(
            height: 300,
            width: 300,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: [
                Container(),
                ...dayFormWidgets(newWorkoutPlan.listOfDayForms)
              ],
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(12.0),
          child: RaisedButton(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "NEXT",
                  style: TextStyle(color: Colors.white),
                ),
                SizedBox(
                  width: 5,
                ),
                Icon(
                  Icons.arrow_forward_rounded,
                  color: Colors.white,
                )
              ],
            ),
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(18)),
            color: Colors.lightBlue,
            onPressed: () {
              if (_formKey.currentState.validate()) {}
            },
          ),
        ),
      ],
    );
  } else {
    return SimpleDialog(
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(18.0))),
        title: Text("Create Workout Plan"),
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 18.0, bottom: 8),
            child: Text(
              "* : required to continue.",
              textAlign: TextAlign.start,
              style: TextStyle(color: Colors.red, fontSize: 13),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Container(
              width: 300,
              height: 300,
              child: Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            width: 180,
                            child: TextFormField(
                              controller: workoutNameController,
                              onSaved: (String value) {
                                newWorkoutPlan.workoutName = value;
                              },
                              decoration: InputDecoration(
                                hintText: "Name the workout plan.",
                                labelText: "Workout Name*",
                                contentPadding: const EdgeInsets.all(8.0),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(18.0),
                                ),
                              ),
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Please enter the name.';
                                }
                                return null;
                              },
                            ),
                          ),
                          Container(
                            width: 100,
                            child: TextFormField(
                              controller: workoutDaysController,
                              keyboardType: TextInputType.number,
                              onSaved: (String value) {
                                workoutDaysController.text = value;
                              },
                              decoration: InputDecoration(
                                hintText: "How many days?",
                                labelText: "# of Days*",
                                contentPadding: const EdgeInsets.all(8.0),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(18.0),
                                ),
                              ),
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Enter the days.';
                                }
                                return null;
                              },
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      TextFormField(
                        controller: workoutDescriptionController,
                        maxLines: 5,
                        decoration: InputDecoration(
                          hintText:
                              "What additional information would you like to share about the workout plan?",
                          labelText: "Description*",
                          contentPadding: const EdgeInsets.all(8.0),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(18.0),
                          ),
                        ),
                        onSaved: (String value) {
                          newWorkoutPlan.workoutDescription = value;
                        },
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter workout plan description.';
                          }
                          return null;
                        },
                      ),
                      Expanded(
                        child: Container(),
                      ),
                      RaisedButton(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "NEXT",
                              style: TextStyle(color: Colors.white),
                            ),
                            SizedBox(
                              width: 5,
                            ),
                            Icon(
                              Icons.arrow_forward_rounded,
                              color: Colors.white,
                            )
                          ],
                        ),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(18)),
                        color: Colors.lightBlue,
                        onPressed: () {
                          if (_formKey.currentState.validate()) {
                            _formKey.currentState.save();
                            daysTemp = int.parse(workoutDaysController.text);
                            print(daysTemp);
                            for (int i = 0; i < daysTemp; i++) {
                              newWorkoutPlan.listOfDayForms
                                  .add(DayForm.empty());
                            }
                            print("newWorkoutPlan: " +
                                newWorkoutPlan.listOfDayForms.length
                                    .toString());
                            submitted = true;
                            Navigator.of(context).pop(context);
                            showDialog(
                                context: context,
                                builder: (_) {
                                  return addWorkoutDialog(context);
                                });
                          }
                        },
                      ),
                    ],
                  )),
            ),
          ),
        ]);
  }
}

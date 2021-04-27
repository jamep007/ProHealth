import 'dart:async';
import 'dart:convert';
import 'dart:ffi';
import 'package:intl/intl.dart';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:senior_project_swauhealthapp/appdrawer.dart';

class Exercise {
  String name, description, date, intensity, time;
  int weight, sets, repititions;
  Exercise(String name, String description, String date, String intensity,
      String time, int weight, int sets, int repititions) {
    this.name = name;
    this.description = description;
    this.date = date;
    this.intensity = intensity;
    this.time = time;
    this.weight = weight;
    this.sets = sets;
    this.repititions = repititions;
  }
  Exercise.empty() {
    this.name = "";
    this.description = "";
    this.date = "";
    this.intensity = "";
    this.time = "";
    this.weight = 0;
    this.sets = 0;
    this.repititions = 0;
  }
}

class DayForm {
  List<Exercise> listOfExercises;
  TextEditingController NameController = TextEditingController();
  TextEditingController DescriptionController = TextEditingController();
  TextEditingController TypeController = TextEditingController();
  TextEditingController IntensityController = TextEditingController();
  TextEditingController TimeController = TextEditingController();
  TextEditingController WeightController = TextEditingController();
  TextEditingController SetsController = TextEditingController();
  TextEditingController RepsController = TextEditingController();
  void addExerciseToList() {
    listOfExercises.add(Exercise(
        NameController.text,
        DescriptionController.text,
        TypeController.text,
        IntensityController.text,
        TimeController.text,
        int.parse(WeightController.text),
        int.parse(SetsController.text),
        int.parse(RepsController.text)));
  }

  void removeExerciseFromList(int index) {
    listOfExercises.removeAt(index);
  }

  DayForm(List<Exercise> list) {
    listOfExercises = list;
    NameController = TextEditingController();
    DescriptionController = TextEditingController();
    TypeController = TextEditingController();
    IntensityController = TextEditingController();
    TimeController = TextEditingController();
    WeightController = TextEditingController();
    SetsController = TextEditingController();
    RepsController = TextEditingController();
  }

  DayForm.empty() {
    listOfExercises = [];
    NameController = TextEditingController();
    DescriptionController = TextEditingController();
    TypeController = TextEditingController();
    IntensityController = TextEditingController();
    TimeController = TextEditingController();
    WeightController = TextEditingController();
    SetsController = TextEditingController();
    RepsController = TextEditingController();
  }
}

class WorkoutPlan {
  List<DayForm> listOfDayForms;
  String workoutName;
  String workoutDescription;
  void addDayFormToList() {
    listOfDayForms.add(DayForm.empty());
  }

  WorkoutPlan.empty() {
    listOfDayForms = [];
    workoutName = "";
    workoutDescription = "";
  }

  WorkoutPlan(List<DayForm> list, String name, String description) {
    this.listOfDayForms = list;
    this.workoutName = name;
    this.workoutDescription = description;
  }
}

List<Exercise> localExercises = [
  Exercise("Bicep Curls", "Bicep curls description", "Arms", "Medium", "10", 20,
      3, 10),
  Exercise("Pushups", "Pushups description", "Upper Body", "Medium", "10", null,
      3, 10),
  Exercise(
      "Squats", "Squats description", "Lower Body", "High", "10", 100, 3, 15),
];

List<DayForm> localDayForms = [
  DayForm(localExercises),
  DayForm(localExercises),
  DayForm(localExercises),
];

List<WorkoutPlan> workouts = [
  WorkoutPlan(null, "Workout 1",
      "This is a brief description for workout one. Blah blah blah."),
  WorkoutPlan(null, "Workout 2",
      "This is a brief description for workout two. Blah blah blah."),
  WorkoutPlan(null, "Workout 3",
      "This is a brief description for workout three. Blah blah blah."),
];

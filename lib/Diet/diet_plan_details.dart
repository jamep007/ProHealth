import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:senior_project_swauhealthapp/Diet/add_food.dart';
import 'package:senior_project_swauhealthapp/appdrawer.dart';
import 'package:senior_project_swauhealthapp/Diet/diet_model.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

DietPlan dietPlan;

class DietDetailsPage extends StatefulWidget {
  final DietPlan plan;
  DietDetailsPage({Key key, @required this.plan}) : super(key: key);
  @override
  _DietDetailsPageState createState() => _DietDetailsPageState();
}

class _DietDetailsPageState extends State<DietDetailsPage> {
  DietPlan dietPlan;
  //_DietDetailsPageState({Key key, @required this.dietPlan}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Diet Plan Details"),
      ),
      body: ListView(
        children: [
          Center(child: Text(dietPlan.name)),
          SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Card(
                elevation: 4,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      Text("Number Of Days:"),
                      Text(dietPlan.dietPlan.length.toString()),
                    ],
                  ),
                ),
              ),
              Card(
                elevation: 4,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      Text("Daily Calorie Goal:"),
                      Text(dietPlan.dailyCalorieGoal.toString()),
                    ],
                  ),
                ),
              ),
            ],
          ),
          SizedBox(
            height: 10,
          ),
          Row(
            children: [Text("Description:"), Text(dietPlan.description)],
          ),
          ...displayAllMeals(dietPlan),
        ],
      ),
    );
  }
}

List<Widget> displayAllMeals(DietPlan plan) {
  List<Widget> mealWidgets = [];
  for (int i = 0; i < plan.dietPlan.length; i++) {
    mealWidgets.add(Card(
      elevation: 4,
      child: Column(
        children: [
          Text(
            "Day " + i.toString(),
          ),
          Text("Breakfast Foods"),
          Column(
            children: displayFoods(dietPlan.dietPlan[i].listOfBreakfastFoods),
          ),
          SizedBox(
            height: 5,
          ),
          Text("Lunch Foods"),
          Column(
            children: displayFoods(dietPlan.dietPlan[i].listOfLunchFoods),
          ),
          SizedBox(
            height: 5,
          ),
          Text("Dinner Foods"),
          Column(
            children: displayFoods(dietPlan.dietPlan[i].listOfDinnerFoods),
          ),
          SizedBox(
            height: 5,
          ),
          Text("Snack Foods"),
          Column(
            children: displayFoods(dietPlan.dietPlan[i].listOfSnackFoods),
          ),
          SizedBox(
            height: 5,
          ),
        ],
      ),
    ));
  }
}

List<Widget> displayFoods(List<Branded> list) {
  List<Widget> tempFoodWidgets = [];
  for (int i = 0; i < list.length; i++) {
    tempFoodWidgets.add(ListTile(
      title: Text(list[i].foodName),
      subtitle: Text(list[i].servingQty.toString() + " " + list[i].servingUnit),
      trailing: Text("Calories: " + list[i].nfCalories.toString()),
    ));
  }
  return tempFoodWidgets;
}

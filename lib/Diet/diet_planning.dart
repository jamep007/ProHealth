import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:senior_project_swauhealthapp/appdrawer.dart';
import 'package:senior_project_swauhealthapp/Diet/diet_model.dart';

class DietPlanning extends StatefulWidget {
  @override
  _DietPlanningState createState() => _DietPlanningState();
}

class _DietPlanningState extends State<DietPlanning> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: allDietPlans.length == 0
          ? Center(
              child: Text(
                "You have no Diet Plans. Create one!",
                style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    color: Colors.grey[500]),
              ),
            )
          : ListView.builder(
              itemCount: allDietPlans.length + 1,
              itemBuilder: (BuildContext context, int index) {
                if (index == 0) {
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      "View Diet Plans",
                      textAlign: TextAlign.center,
                      style:
                          TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
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
                              allDietPlans[index - 1].name,
                              style: TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.w500),
                            ),
                            subtitle: Padding(
                              padding: const EdgeInsets.only(top: 8.0),
                              child: Text(
                                allDietPlans[index - 1].description,
                                style: TextStyle(fontWeight: FontWeight.w400),
                              ),
                            ),
                            trailing: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                FlatButton(
                                  child: Icon(Icons.more_horiz_rounded),
                                  onPressed: () {},
                                ),
                                SizedBox(
                                  height: 5,
                                ),
                                Text(
                                  "Calories:\n" +
                                      allDietPlans[index - 1]
                                          .dailyCalorieGoal
                                          .toString(),
                                  style: TextStyle(fontSize: 16),
                                ),
                              ],
                            ),
                          ),
                        )),
                  );
                }
              }),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.restaurant_rounded,
              color: Colors.white,
            ),
            Icon(
              Icons.add_rounded,
              color: Colors.white,
              size: 20,
            ),
          ],
        ),
        backgroundColor: Colors.lightBlue,
      ),
    );
  }
}

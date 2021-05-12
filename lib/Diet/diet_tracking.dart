import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';
import 'package:senior_project_swauhealthapp/appdrawer.dart';
import 'package:senior_project_swauhealthapp/Diet/diet_model.dart';
import 'package:senior_project_swauhealthapp/Diet/add_food.dart';

class DietTracking extends StatefulWidget {
  @override
  _DietTrackingState createState() => _DietTrackingState();
}

class _DietTrackingState extends State<DietTracking> {
  String currentDay = DateFormat('EEE').format(DateTime.now());

  List<String> getPreviousWeek() {
    List<String> previousWeek;
    switch (currentDay) {
      case "Mon":
        {
          previousWeek = [
            "Sun",
            "Sat",
            "Fri",
            "Thu",
            "Wed",
            "Tue",
            "Mon",
          ];
          // statements;
        }
        break;

      case "Tue":
        {
          previousWeek = [
            "Mon",
            "Sun",
            "Sat",
            "Fri",
            "Thu",
            "Wed",
            "Tue",
          ];
        }
        break;
      case "Wed":
        {
          previousWeek = [
            "Tue",
            "Mon",
            "Sun",
            "Sat",
            "Fri",
            "Thu",
            "Wed",
          ];
        }
        break;
      case "Thu":
        {
          previousWeek = [
            "Wed",
            "Tue",
            "Mon",
            "Sun",
            "Sat",
            "Fri",
            "Thu",
          ];
        }
        break;
      case "Fri":
        {
          previousWeek = [
            "Thu",
            "Wed",
            "Tue",
            "Mon",
            "Sun",
            "Sat",
            "Fri",
          ];
        }
        break;
      case "Sat":
        {
          previousWeek = [
            "Fri",
            "Thu",
            "Wed",
            "Tue",
            "Mon",
            "Sun",
            "Sat",
          ];
        }
        break;
      case "Sun":
        {
          previousWeek = [
            "Sat",
            "Fri",
            "Thu",
            "Wed",
            "Tue",
            "Mon",
            "Sun",
          ];
        }
        break;

      default:
        {
          previousWeek = [];
        }
        break;
    }
    return previousWeek;
  }

  List<String> previousWeek;

  int calories = 0, goal = 2000, netCal;
  double _progressRatio;
  List<Branded> listOfBreakfastFoods = [],
      listOfLunchFoods = [],
      listOfDinnerFoods = [],
      listOfSnackFoods = [];

  double getRatio(calories, goal) {
    double progress;
    if (calories == 0) {
      progress = .01;
    } else if (calories < goal) {
      progress = calories / goal;
    } else if (calories == goal) {
      progress = 1;
    } else if (calories > goal) {
      progress = ((goal - (calories - goal)) / goal);
    }
    return progress;
  }

  @override
  Widget build(BuildContext context) {
    _progressRatio = getRatio(calories, goal);
    previousWeek = getPreviousWeek();
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ListView(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    previousWeek[6],
                    style: TextStyle(fontWeight: FontWeight.w500),
                  ),
                  SizedBox(
                    height: 6,
                  ),
                  CircularProgressIndicator(
                      strokeWidth: 6,
                      backgroundColor:
                          (calories > goal) ? Colors.red : Colors.grey[300],
                      value: _progressRatio,
                      valueColor:
                          new AlwaysStoppedAnimation<Color>(Colors.purple)),
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    previousWeek[5],
                    style: TextStyle(fontWeight: FontWeight.w500),
                  ),
                  SizedBox(
                    height: 6,
                  ),
                  CircularProgressIndicator(
                      strokeWidth: 6,
                      backgroundColor:
                          (calories > goal) ? Colors.red : Colors.grey[300],
                      value: _progressRatio,
                      valueColor:
                          new AlwaysStoppedAnimation<Color>(Colors.purple)),
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    previousWeek[4],
                    style: TextStyle(fontWeight: FontWeight.w500),
                  ),
                  SizedBox(
                    height: 6,
                  ),
                  CircularProgressIndicator(
                      strokeWidth: 6,
                      backgroundColor:
                          (calories > goal) ? Colors.red : Colors.grey[300],
                      value: _progressRatio,
                      valueColor:
                          new AlwaysStoppedAnimation<Color>(Colors.purple)),
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    previousWeek[3],
                    style: TextStyle(fontWeight: FontWeight.w500),
                  ),
                  SizedBox(
                    height: 6,
                  ),
                  CircularProgressIndicator(
                      strokeWidth: 6,
                      backgroundColor:
                          (calories > goal) ? Colors.red : Colors.grey[300],
                      value: _progressRatio,
                      valueColor:
                          new AlwaysStoppedAnimation<Color>(Colors.purple)),
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    previousWeek[2],
                    style: TextStyle(fontWeight: FontWeight.w500),
                  ),
                  SizedBox(
                    height: 6,
                  ),
                  CircularProgressIndicator(
                      strokeWidth: 6,
                      backgroundColor:
                          (calories > goal) ? Colors.red : Colors.grey[300],
                      value: _progressRatio,
                      valueColor:
                          new AlwaysStoppedAnimation<Color>(Colors.purple)),
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    previousWeek[1],
                    style: TextStyle(fontWeight: FontWeight.w500),
                  ),
                  SizedBox(
                    height: 6,
                  ),
                  CircularProgressIndicator(
                      strokeWidth: 6,
                      backgroundColor:
                          (calories > goal) ? Colors.red : Colors.grey[300],
                      value: _progressRatio,
                      valueColor:
                          new AlwaysStoppedAnimation<Color>(Colors.purple)),
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    previousWeek[0],
                    style: TextStyle(fontWeight: FontWeight.w500),
                  ),
                  SizedBox(
                    height: 6,
                  ),
                  CircularProgressIndicator(
                      strokeWidth: 6,
                      backgroundColor:
                          (calories > goal) ? Colors.red : Colors.grey[300],
                      value: _progressRatio,
                      valueColor:
                          new AlwaysStoppedAnimation<Color>(Colors.purple)),
                ],
              ),
              (calories < goal)
                  ? Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          "Under by",
                          style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.w900,
                            color: Colors.green,
                          ),
                        ),
                        Container(
                          decoration: BoxDecoration(color: Colors.green),
                          child: Padding(
                            padding: const EdgeInsets.all(4.0),
                            child: Text(
                              ((goal - calories)).toString(),
                              style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.w900,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        )
                      ],
                    )
                  : Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          "Over by",
                          style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.w900,
                            color: Colors.red,
                          ),
                        ),
                        Container(
                          decoration: BoxDecoration(color: Colors.red),
                          child: Padding(
                            padding: const EdgeInsets.all(4.0),
                            child: Text(
                              (calories - goal).toString(),
                              style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.w900,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
            ],
          ),
          SizedBox(
            height: 10,
          ),
          Divider(
            thickness: 1,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Center(
                    child: Text(
                  "Today's Calories",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                )),
                SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      calories.toString(),
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
                    ),
                    Text(
                      " / " + goal.toString(),
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
                    ),
                    (calories < goal)
                        ? Row(
                            children: [
                              SizedBox(
                                width: 10,
                              ),
                              Text(
                                "Under by " + (goal - calories).toString(),
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w900,
                                  color: Colors.green,
                                ),
                              ),
                            ],
                          )
                        : Row(
                            children: [
                              SizedBox(
                                width: 10,
                              ),
                              Text(
                                "Over by " + (calories - goal).toString(),
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w900,
                                  color: Colors.red,
                                ),
                              ),
                            ],
                          ),
                  ],
                ),
                SizedBox(
                  height: 6,
                ),
                Container(
                  width: 300,
                  height: 50,
                  child: ClipRRect(
                    borderRadius: BorderRadius.all(Radius.circular(18)),
                    child: LinearProgressIndicator(
                        backgroundColor:
                            (calories > goal) ? Colors.red : Colors.grey[300],
                        value: _progressRatio,
                        valueColor:
                            new AlwaysStoppedAnimation<Color>(Colors.purple)),
                  ),
                ),
              ],
            ),
          ),
          Divider(
            thickness: 2,
          ),
          Padding(
            padding: const EdgeInsets.only(top: 4.0),
            child: Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(18.0),
              ),
              elevation: 4,
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Breakfast",
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        FlatButton(
                          color: Colors.white,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(18.0),
                          ),
                          onPressed: () {},
                          child: Icon(Icons.more_horiz_rounded),
                        ),
                      ],
                    ),
                    Text(
                      "Suggested: " +
                          (goal * .2).toInt().toString() +
                          " Calories",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                        color: Colors.grey,
                      ),
                    ),
                    (listOfBreakfastFoods.length == 0)
                        ? Container(
                            height: 50,
                          )
                        : Column(
                            children: foodList(context, listOfBreakfastFoods),
                          ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        FlatButton(
                            onPressed: () {
                              _getFoodFromSecondScreen(context)
                                  .then((Branded result) {
                                setState(() {
                                  if (result.foodName != null)
                                    listOfBreakfastFoods.add(result);
                                  calories += result.nfCalories;
                                });
                              });
                            },
                            color: Colors.lightBlue,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(18.0),
                            ),
                            child: Text("ADD BREAKFAST",
                                style: TextStyle(color: Colors.white))),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 4.0),
            child: Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(18.0),
              ),
              elevation: 4,
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Lunch",
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        FlatButton(
                          color: Colors.white,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(18.0),
                          ),
                          onPressed: () {
                            Navigator.of(context).pushNamed("/addfood");
                          },
                          child: Icon(Icons.more_horiz_rounded),
                        ),
                      ],
                    ),
                    Text(
                      "Suggested: " +
                          (goal * .25).toInt().toString() +
                          " Calories",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                        color: Colors.grey,
                      ),
                    ),
                    (listOfBreakfastFoods.length == 0)
                        ? Container(
                            height: 50,
                          )
                        : Column(
                            children: foodList(context, listOfLunchFoods),
                          ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        FlatButton(
                            onPressed: () {
                              _getFoodFromSecondScreen(context)
                                  .then((Branded result) {
                                setState(() {
                                  if (result.foodName != null)
                                    listOfLunchFoods.add(result);
                                  calories += result.nfCalories;
                                });
                              });
                            },
                            color: Colors.lightBlue,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(18.0),
                            ),
                            child: Text("ADD LUNCH",
                                style: TextStyle(color: Colors.white))),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 4.0),
            child: Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(18.0),
              ),
              elevation: 4,
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Dinner",
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        FlatButton(
                          color: Colors.white,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(18.0),
                          ),
                          onPressed: () {},
                          child: Icon(Icons.more_horiz_rounded),
                        ),
                      ],
                    ),
                    Text(
                      "Suggested: " +
                          (goal * .35).toInt().toString() +
                          " Calories",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                        color: Colors.grey,
                      ),
                    ),
                    (listOfBreakfastFoods.length == 0)
                        ? Container(
                            height: 50,
                          )
                        : Column(
                            children: foodList(context, listOfDinnerFoods),
                          ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        FlatButton(
                            onPressed: () {
                              _getFoodFromSecondScreen(context)
                                  .then((Branded result) {
                                setState(() {
                                  if (result.foodName != null)
                                    listOfDinnerFoods.add(result);
                                  calories += result.nfCalories;
                                });
                              });
                            },
                            color: Colors.lightBlue,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(18.0),
                            ),
                            child: Text("ADD DINNER",
                                style: TextStyle(color: Colors.white))),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 4.0),
            child: Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(18.0),
              ),
              elevation: 4,
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Snacks",
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        FlatButton(
                          color: Colors.white,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(18.0),
                          ),
                          onPressed: () {},
                          child: Icon(Icons.more_horiz_rounded),
                        ),
                      ],
                    ),
                    Text(
                      "Suggested: " +
                          (goal * .2).toInt().toString() +
                          " Calories",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                        color: Colors.grey,
                      ),
                    ),
                    (listOfBreakfastFoods.length == 0)
                        ? Container(
                            height: 50,
                          )
                        : Column(
                            children: foodList(context, listOfSnackFoods),
                          ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        FlatButton(
                            onPressed: () {
                              _getFoodFromSecondScreen(context)
                                  .then((Branded result) {
                                setState(() {
                                  if (result.foodName != null)
                                    listOfSnackFoods.add(result);
                                  calories += result.nfCalories;
                                });
                              });
                            },
                            color: Colors.lightBlue,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(18.0),
                            ),
                            child: Text("ADD SNACKS",
                                style: TextStyle(color: Colors.white))),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Future<Branded> _getFoodFromSecondScreen(BuildContext context) async {
    final dataFromSecondPage = await Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => AddFoodPage()),
    ) as Branded;
    Branded data = Branded(
        foodName: dataFromSecondPage.foodName,
        servingUnit: dataFromSecondPage.servingUnit,
        servingQty: dataFromSecondPage.servingQty,
        nfCalories: dataFromSecondPage.nfCalories);
    return data;
  }

  List<Widget> foodList(BuildContext context, List<Branded> list) {
    List<Widget> listOfWidgets = [];
    for (int i = 0; i < list.length; i++) {
      listOfWidgets.add(ListTile(
        title: Text(list[i].foodName),
        subtitle:
            Text(list[i].servingQty.toString() + " " + list[i].servingUnit),
        trailing: Text("Calories: " + list[i].nfCalories.toString()),
      ));
    }
    return listOfWidgets;
  }
}

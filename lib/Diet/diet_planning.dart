import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:senior_project_swauhealthapp/Diet/add_food.dart';
import 'package:senior_project_swauhealthapp/Diet/diet_plan_details.dart';
import 'package:senior_project_swauhealthapp/appdrawer.dart';
import 'package:senior_project_swauhealthapp/Diet/diet_model.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class DietPlanning extends StatefulWidget {
  @override
  _DietPlanningState createState() => _DietPlanningState();
}

final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
final dietFormKey = GlobalKey<FormState>();
List<DietPlan> allDietPlans = [];

class _DietPlanningState extends State<DietPlanning> {
  RefreshController _refreshController =
      RefreshController(initialRefresh: false);
  void _onRefresh() async {
    // monitor network fetch
    await Future.delayed(Duration(milliseconds: 1000));
    // if failed,use refreshFailed()
    setState(() {});
    print(allDietPlans.length);
    _refreshController.refreshCompleted();
  }

  void _onLoading() async {
    // monitor network fetch
    await Future.delayed(Duration(milliseconds: 1000));
    // if failed,use loadFailed(),if no data return,use LoadNodata()
    setState(() {});
    print(allDietPlans.length);
    _refreshController.loadComplete();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      body: allDietPlans.length == 0
          ? SmartRefresher(
              enablePullDown: true,
              onRefresh: _onRefresh,
              onLoading: _onLoading,
              controller: _refreshController,
              child: Center(
                child: Text(
                  "You have no Diet Plans. Create one!",
                  style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      color: Colors.grey[500]),
                ),
              ),
            )
          : SmartRefresher(
              enablePullDown: true,
              onRefresh: _onRefresh,
              onLoading: _onLoading,
              controller: _refreshController,
              child: ListView.builder(
                  itemCount: allDietPlans.length + 1,
                  itemBuilder: (BuildContext context, int index) {
                    if (index == 0) {
                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          "View Diet Plans",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontSize: 26, fontWeight: FontWeight.bold),
                        ),
                      );
                    } else {
                      return FlatButton(
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) =>
                                    DietDetailsPage(plan: dietPlan),
                              ));
                        },
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Card(
                              elevation: 4,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(18)),
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: SizedBox(
                                  height: 100,
                                  child: ListTile(
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(18)),
                                    title: Text(
                                      allDietPlans[index - 1].name,
                                      style: TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.w500),
                                    ),
                                    subtitle: Padding(
                                      padding: const EdgeInsets.only(top: 8.0),
                                      child: Text(
                                        allDietPlans[index - 1].description,
                                        style: TextStyle(
                                            fontWeight: FontWeight.w400),
                                      ),
                                    ),
                                    trailing: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        Container(
                                          width: 50,
                                          height: 30,
                                          child: FlatButton(
                                            child: Icon(
                                              Icons.more_horiz_rounded,
                                              size: 20,
                                            ),
                                            onPressed: () {},
                                          ),
                                        ),
                                        SizedBox(
                                          height: 5,
                                        ),
                                        Text(
                                          "Calories:",
                                          textAlign: TextAlign.center,
                                          style: TextStyle(fontSize: 14),
                                        ),
                                        SizedBox(
                                          height: 12,
                                        ),
                                        Text(
                                          allDietPlans[index - 1]
                                              .dailyCalorieGoal
                                              .toString(),
                                          textAlign: TextAlign.center,
                                          style: TextStyle(fontSize: 14),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              )),
                        ),
                      );
                    }
                  }),
            ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showDialog(
              context: context,
              builder: (_) {
                return createDietPlan(context);
              });
        },
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

DietPlan newPlan = DietPlan();

Widget createDietPlan(BuildContext context) {
  TextEditingController dietNameController = TextEditingController();
  TextEditingController dietDescriptionController = TextEditingController();
  TextEditingController dietDaysController = TextEditingController();
  TextEditingController dietCaloriesController = TextEditingController();

  int numberOfDays;

  return StatefulBuilder(builder: (context, setState) {
    return SimpleDialog(
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(18.0))),
      title: Text("Add Diet Plan"),
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
            child: Form(
              key: dietFormKey,
              child: ListView(
                shrinkWrap: true,
                children: [
                  TextFormField(
                    controller: dietNameController,
                    decoration: InputDecoration(
                      hintText: "What do you want to call this diet plan?",
                      labelText: "Diet Name*",
                      contentPadding: const EdgeInsets.all(8.0),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(18.0),
                      ),
                    ),
                    onSaved: (String value) {
                      newPlan.name = value;
                    },
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter diet plan name.';
                      }
                      return null;
                    },
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  TextFormField(
                    controller: dietDescriptionController,
                    maxLines: 5,
                    decoration: InputDecoration(
                      hintText:
                          "What additional information would you like to share about the diet plan?",
                      labelText: "Description",
                      contentPadding: const EdgeInsets.all(8.0),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(18.0),
                      ),
                    ),
                    onSaved: (String value) {
                      newPlan.description = value;
                    },
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        width: 150,
                        child: TextFormField(
                          keyboardType: TextInputType.number,
                          controller: dietCaloriesController,
                          decoration: InputDecoration(
                            hintText: "How many target calories per day?",
                            labelText: "Daily Calorie Goal*",
                            contentPadding: const EdgeInsets.all(8.0),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(18.0),
                            ),
                          ),
                          onSaved: (String value) {
                            newPlan.dailyCalorieGoal = int.parse(value);
                          },
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter workout plan description.';
                            }
                            return null;
                          },
                        ),
                      ),
                      Container(
                        width: 100,
                        child: TextFormField(
                          keyboardType: TextInputType.number,
                          controller: dietDaysController,
                          decoration: InputDecoration(
                            hintText: "How many days in this plan?",
                            labelText: "# of Days*",
                            contentPadding: const EdgeInsets.all(8.0),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(18.0),
                            ),
                          ),
                          onChanged: (String value) {
                            numberOfDays = int.parse(value);
                          },
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter the number of days in this plan.';
                            }
                            return null;
                          },
                        ),
                      ),
                    ],
                  ),
                ],
              ),
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
              if (dietFormKey.currentState.validate()) {
                dietFormKey.currentState.save();
                // submit form to the database first
                showNewDialog(scaffoldKey.currentContext, 0,
                    addDietDays(scaffoldKey.currentContext, numberOfDays));
              }
            },
          ),
        ),
      ],
    );
  });
}

void showNewDialog(BuildContext context, int selection, List<Widget> list) {
  Navigator.pop(context, true);
  showDialog(
      context: context,
      builder: (_) {
        return list[selection];
      });
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

List<Widget> addDietDays(BuildContext context, int numberOfDays) {
  List<Widget> dietDays = [];
  List<Branded> tempBreakfast = [];
  List<Branded> tempLunch = [];
  List<Branded> tempDinner = [];
  List<Branded> tempSnacks = [];

  Food tempFood;

  for (int i = 0; i < numberOfDays; i++) {
    dietDays.add(StatefulBuilder(
      builder: (BuildContext context, StateSetter setState) {
        return SimpleDialog(
            title: Text("Day " + (i + 1).toString()),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(18.0))),
            children: [
              Padding(
                padding: const EdgeInsets.all(12.0),
                child: Container(
                  height: 300,
                  width: 300,
                  child: Form(
                    child: ListView(
                      shrinkWrap: true,
                      children: [
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
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
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
                                          borderRadius:
                                              BorderRadius.circular(18.0),
                                        ),
                                        onPressed: () {},
                                        child: Icon(Icons.more_horiz_rounded),
                                      ),
                                    ],
                                  ),
                                  (tempBreakfast.length == 0)
                                      ? Container(
                                          height: 20,
                                        )
                                      : Column(
                                          children: displayFoods(tempBreakfast),
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
                                                  tempBreakfast.add(result);
                                              });
                                            });
                                          },
                                          color: Colors.lightBlue,
                                          shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(18.0),
                                          ),
                                          child: Text("ADD BREAKFAST",
                                              style: TextStyle(
                                                  color: Colors.white))),
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
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
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
                                          borderRadius:
                                              BorderRadius.circular(18.0),
                                        ),
                                        onPressed: () {
                                          _getFoodFromSecondScreen(context)
                                              .then((Branded result) {
                                            setState(() {
                                              if (result.foodName != null)
                                                tempBreakfast.add(result);
                                            });
                                          });
                                        },
                                        child: Icon(Icons.more_horiz_rounded),
                                      ),
                                    ],
                                  ),
                                  (tempLunch.length == 0)
                                      ? Container(
                                          height: 20,
                                        )
                                      : Column(
                                          children: displayFoods(tempLunch),
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
                                                  tempLunch.add(result);
                                              });
                                            });
                                          },
                                          color: Colors.lightBlue,
                                          shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(18.0),
                                          ),
                                          child: Text("ADD LUNCH",
                                              style: TextStyle(
                                                  color: Colors.white))),
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
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
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
                                          borderRadius:
                                              BorderRadius.circular(18.0),
                                        ),
                                        onPressed: () {},
                                        child: Icon(Icons.more_horiz_rounded),
                                      ),
                                    ],
                                  ),
                                  (tempDinner.length == 0)
                                      ? Container(
                                          height: 20,
                                        )
                                      : Column(
                                          children: displayFoods(tempDinner),
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
                                                  tempDinner.add(result);
                                              });
                                            });
                                          },
                                          color: Colors.lightBlue,
                                          shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(18.0),
                                          ),
                                          child: Text("ADD DINNER",
                                              style: TextStyle(
                                                  color: Colors.white))),
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
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
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
                                          borderRadius:
                                              BorderRadius.circular(18.0),
                                        ),
                                        onPressed: () {},
                                        child: Icon(Icons.more_horiz_rounded),
                                      ),
                                    ],
                                  ),
                                  (tempSnacks.length == 0)
                                      ? Container(
                                          height: 20,
                                        )
                                      : Column(
                                          children: displayFoods(tempSnacks),
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
                                                  tempSnacks.add(result);
                                              });
                                            });
                                          },
                                          color: Colors.lightBlue,
                                          shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(18.0),
                                          ),
                                          child: Text("ADD SNACKS",
                                              style: TextStyle(
                                                  color: Colors.white))),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              (i == (numberOfDays - 1))
                  ? //Is this the last widget?
                  Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: RaisedButton(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "FINISH",
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
                          setState(() {
                            newPlan.dietPlan.add(DietDay.full(tempBreakfast,
                                tempLunch, tempDinner, tempSnacks));
                            tempBreakfast = [];
                            tempLunch = [];
                            tempDinner = [];
                            tempSnacks = [];
                            allDietPlans.add(newPlan);
                          });
                          Navigator.pop(context, true);
                          //Submit everything to the database here
                        },
                      ),
                    )
                  : Padding(
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
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(18)),
                        color: Colors.lightBlue,
                        onPressed: () {
                          setState(() {
                            newPlan.dietPlan.add(DietDay.full(tempBreakfast,
                                tempLunch, tempDinner, tempSnacks));
                            tempBreakfast = [];
                            tempLunch = [];
                            tempDinner = [];
                            tempSnacks = [];
                          });

                          //Submit form to the database
                          showNewDialog(context, i + 1, dietDays);
                        },
                      ),
                    ),
            ]);
      },
    ));
  }
  return dietDays;
}

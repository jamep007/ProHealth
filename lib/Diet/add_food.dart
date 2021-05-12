import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:senior_project_swauhealthapp/appdrawer.dart';
import 'package:senior_project_swauhealthapp/Diet/diet_model.dart';
import 'package:flappy_search_bar/flappy_search_bar.dart';

class AddFoodPage extends StatefulWidget {
  @override
  _AddFoodPageState createState() => _AddFoodPageState();
}

class _AddFoodPageState extends State<AddFoodPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text("Add Food"),
          automaticallyImplyLeading: false,
          flexibleSpace: Container(
            decoration: BoxDecoration(
                gradient: LinearGradient(
                    begin: Alignment.centerLeft,
                    end: Alignment.centerRight,
                    colors: <Color>[Colors.lightBlue, Colors.blue])),
          )),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: SearchBar<Branded>(
            onSearch: search,
            onItemFound: (Branded branded, int index) {
              return FlatButton(
                onPressed: () {
                  Navigator.pop(
                      context,
                      Branded(
                          foodName: branded.foodName,
                          image: branded.image,
                          servingUnit: branded.servingUnit,
                          nixBrandId: branded.nixBrandId,
                          brandNameItemName: branded.brandNameItemName,
                          servingQty: branded.servingQty,
                          nfCalories: branded.nfCalories,
                          brandName: branded.brandName,
                          brandType: branded.brandType,
                          nixItemId: branded.nixItemId));
                },
                child: ListTile(
                  title: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Flexible(
                        child: Text(
                          branded.foodName != null ? branded.foodName : "Null",
                          style: TextStyle(fontSize: 16),
                        ),
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      Text(
                        branded.nfCalories != null
                            ? "Calories: " + branded.nfCalories.toString()
                            : "Null",
                        style: TextStyle(fontSize: 14),
                      ),
                    ],
                  ),
                  subtitle: Text(branded.servingQty != null
                      ? branded.servingUnit != null
                          ? branded.servingQty.toStringAsFixed(2) +
                              " " +
                              branded.servingUnit
                          : "Null"
                      : "Null"),
                ),
              );
            },
            // Just a concept for now vvv
            suggestions: [
              Branded(
                  foodName: "Eggs",
                  servingUnit: "medium egg",
                  servingQty: 1,
                  nfCalories: 63),
              Branded(
                  foodName: "Mashed Potatoes",
                  servingUnit: "cup(s)",
                  servingQty: 1,
                  nfCalories: 237),
              Branded(
                  foodName: "Medium Cheese Pizza",
                  servingUnit: "slice(s)",
                  servingQty: 1,
                  nfCalories: 200)
            ],
          ),
        ),
      ),
    );
  }

  Future<List<Branded>> search(String search) async {
    List<Branded> foundFoods = await fetchFoodQuery(search);
    return List.generate(foundFoods.length, (int index) {
      return foundFoods[index];
    });
  }

  Future fetchFoodQuery(String request) async {
    var appID = "10e348c6";
    var appKey = "9cdae15f44e5994b25a1f8047acc9202";

    var url =
        "https://trackapi.nutritionix.com/v2/search/instant?query=$request";
    var response = await http
        .get(Uri.parse(url), headers: {"x-app-id": appID, "x-app-key": appKey});
    var foundFoods = Food();
    if (response.statusCode == 200) {
      var foundFoodsJson = json.decode(response.body);
      foundFoods = Food.fromJson(foundFoodsJson);
      for (int i = 0; i < foundFoods.branded.length; i++) {
        print("foodName: " + foundFoods.branded[i].foodName);
        print("servingQty: " + foundFoods.branded[i].servingQty.toString());
        print("servingUnit: " + foundFoods.branded[i].servingUnit);
        print("nfCalories: " + foundFoods.branded[i].nfCalories.toString());
      }
      return foundFoods.branded;
    } else {
      print(response.statusCode);
    }
  }
}

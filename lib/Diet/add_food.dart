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
  List<Food> foundFoods;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text("Add Food"),
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
          child: SearchBar<Food>(
            onSearch: search,
            onItemFound: (Food food, int index) {
              return ListTile(
                title: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(food.name),
                    Text("Calories: " + food.calories.toString()),
                  ],
                ),
                subtitle: Text(food.description),
              );
            },
            // Just a concept for now vvv
            suggestions: [
              Food.full("Eggs", "Scrambled, 2", 200),
              Food.full("Potatoes", "Fried, diced. 1 cup", 300),
              Food.full("Pizza", "Medium Slice, 1", 200),
            ],
          ),
        ),
      ),
    );
  }

  Future<List<Food>> search(String search) async {
    await Future.delayed(Duration(seconds: 2));
    return List.generate(search.length, (int index) {
      return Food();
    });
  }
}

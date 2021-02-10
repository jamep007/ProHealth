import 'dart:async';
import 'dart:convert';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

Future<int> userSignUp(String name, String username, String password,
    String confirm, String phone, String email) async {
  int responseCode;
  if (password != confirm) {
    //Passwords do not match
    responseCode = 1;
    return responseCode;
  } else {
    //Passwords match
    var rand = new Random().nextInt(9999999999);
    String _userId = rand.toString();

    final response = await http.post("https://website-to-add-user.php", body: {
      "name": name,
      "user_id": _userId,
      "username": username,
      "password": password,
      "phone": phone,
      "email": email,
    });
    if (response.statusCode == 200) {
      responseCode = 2; //Passwords match & successfully submitted
    } else {
      print(response.statusCode);
      responseCode = 3; //Passwords match but did NOT successfully submit
      throw Exception('Failed');
    }
    return responseCode;
  }
}

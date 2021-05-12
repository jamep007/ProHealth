import 'dart:async';
import 'dart:convert';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:senior_project_swauhealthapp/Services/storage.dart';

final SecureStorage secureStorage = SecureStorage();

//In progress
Future<int> addNewUser(String name, String username, String password,
    String confirm, String phone, String email) async {
  int responseCode;
  if (password != confirm) {
    //Passwords do not match
    responseCode = 1;
    return responseCode;
  } else {
    //Passwords match
    var rand = new Random().nextInt(99999999);
    String _userId = rand.toString();

    //Send data to sql
    final response = await http
        .post("http://DESKTOP-4KOSN6V/ProHealth%20PHP/insertuser.php", body: {
      "name": name,
      "user_id": _userId,
      "username": username,
      "password": password,
      "phone": phone,
      "email": email,
    });

    var token = jsonDecode(response.body);
    //print(token);

    if (response.statusCode == 200) {
      responseCode = 2; //Passwords match & successfully submitted
    } else {
      print(response.statusCode);
      responseCode = 3; //Passwords match but did NOT successfully submit
      throw Exception('Failed');
    }

    //Store user info for login
    if (responseCode == 3) secureStorage.writeSecureData('token', token);

    return responseCode;
  }
}

//In progress
Future<int> userTryLogin(String username, String password) async {
  int responseCode;
  //Send data to sql
  final response = await http
      .post("http://DESKTOP-4KOSN6V/ProHealth%20PHP/login.php", body: {
    "username": username,
    "password": password,
  });

  //Create token
  var token = jsonDecode(response.body);

  //Check status code
  responseCode = response.statusCode;
  if (response.statusCode == 200) {
    print(response.statusCode);
  } else {
    print(response.statusCode);
    throw Exception('Failed');
  }

  //Store user info for login
  secureStorage.writeSecureData('token', token);

  return responseCode;
}

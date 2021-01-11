import 'dart:async';
import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class ModifyUser extends StatefulWidget {
  @override
  _ModifyUserState createState() => _ModifyUserState();
}

class _ModifyUserState extends State<ModifyUser> {
  TextEditingController name = new TextEditingController();
  TextEditingController userId = new TextEditingController();
  TextEditingController username = new TextEditingController();
  TextEditingController password = new TextEditingController();
  TextEditingController phone = new TextEditingController();
  TextEditingController email = new TextEditingController();

  Future<List> senddata() async {
    final response = await http
        .post("http://DESKTOP-4KOSN6V/CSFinalProject/modifyuser.php", body: {
      "name": name.text,
      "user_id": userId.text,
      "username": username.text,
      "password": password.text,
      "phone": phone.text,
      "email": email.text,
    });
    return Future.delayed(Duration(seconds: 0));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Modify User Page"),
        backgroundColor: Colors.red,
        elevation: defaultTargetPlatform == TargetPlatform.android ? 5.0 : 0.0,
      ),
      body: Container(
        child: Center(
          child: Padding(
            padding: EdgeInsets.all(16.0),
            child: Column(
              children: <Widget>[
                Text(
                  "User_ID",
                  style: TextStyle(fontSize: 18.0),
                ),
                TextField(
                  controller: userId,
                  decoration:
                      InputDecoration(hintText: 'User_ID of user to modify'),
                ),
                SizedBox(height: 16.0),
                Text(
                  "Name",
                  style: TextStyle(fontSize: 18.0),
                ),
                TextField(
                  controller: name,
                  decoration: InputDecoration(hintText: 'Modified name'),
                ),
                SizedBox(height: 16.0),
                Text(
                  "Username",
                  style: TextStyle(fontSize: 18.0),
                ),
                TextField(
                  controller: username,
                  decoration: InputDecoration(hintText: 'Modified username'),
                ),
                SizedBox(height: 16.0),
                Text(
                  "Password",
                  style: TextStyle(fontSize: 18.0),
                ),
                TextField(
                  controller: password,
                  decoration: InputDecoration(hintText: 'Modified password'),
                ),
                SizedBox(height: 16.0),
                Text(
                  "Phone",
                  style: TextStyle(fontSize: 18.0),
                ),
                TextField(
                  controller: phone,
                  decoration:
                      InputDecoration(hintText: 'Modified phone number'),
                ),
                SizedBox(height: 16.0),
                Text(
                  "Email",
                  style: TextStyle(fontSize: 18.0),
                ),
                TextField(
                  controller: email,
                  decoration:
                      InputDecoration(hintText: 'Modified email address'),
                ),
                RaisedButton(
                  child: Text("Update"),
                  onPressed: () {
                    final response = senddata();
                    print(response);
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

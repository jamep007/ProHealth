import 'dart:async';
import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class AddUser extends StatefulWidget {
  @override
  _AddUserState createState() => _AddUserState();
}

class _AddUserState extends State<AddUser> {

  TextEditingController name=new TextEditingController();
  TextEditingController userId=new TextEditingController();
  TextEditingController username=new TextEditingController();
  TextEditingController password=new TextEditingController();
  TextEditingController phone=new TextEditingController();
  TextEditingController email=new TextEditingController();

  Future<List> senddata() async {
    final response = await http.post("http://DESKTOP-4KOSN6V/CSFinalProject/insertuser.php", body: {
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
        title: Text("Register User"),
        backgroundColor: Colors.red,
        elevation: defaultTargetPlatform == TargetPlatform.android ? 5.0 : 0.0,
      ),
      body: Container(
        child: Center(
          child: Padding(
            padding: EdgeInsets.all(16.0),
            child: Column(
              children: <Widget>[
                Text("Name",style: TextStyle(fontSize: 18.0),),
                TextField(
                  controller: name,
                  decoration: InputDecoration(
                      hintText: 'name'
                  ),
                ),
                SizedBox(height: 16.0),
                Text("User_ID",style: TextStyle(fontSize: 18.0),),
                TextField(
                  controller: userId,
                  decoration: InputDecoration(
                      hintText: 'User_ID'
                  ),
                ),
                SizedBox(height: 16.0),
                Text("Username",style: TextStyle(fontSize: 18.0),),
                TextField(
                  controller: username,
                  decoration: InputDecoration(
                      hintText: 'Username'
                  ),
                ),
                SizedBox(height: 16.0),
                Text("Password",style: TextStyle(fontSize: 18.0),),
                TextField(
                  controller: password,
                  decoration: InputDecoration(
                      hintText: 'password'
                  ),
                ),
                SizedBox(height: 16.0),
                Text("Phone",style: TextStyle(fontSize: 18.0),),
                TextField(
                  controller: phone,
                  decoration: InputDecoration(
                      hintText: 'Phone'
                  ),
                ),
                SizedBox(height: 16.0),
                Text("Email",style: TextStyle(fontSize: 18.0),),
                TextField(
                  controller: email,
                  decoration: InputDecoration(
                      hintText: 'Email'
                  ),
                ),


                RaisedButton(
                  child: Text("Register"),
                  onPressed: (){
                    senddata();
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
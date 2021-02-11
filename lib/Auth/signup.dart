import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:senior_project_swauhealthapp/Auth/auth.dart';

class SignUpPage extends StatefulWidget {
  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  var _formKey = GlobalKey<FormState>();

  TextEditingController name = new TextEditingController();
  static final validNameCharacters = RegExp(r'^[a-zA-Z]');

  TextEditingController username = new TextEditingController();
  static final validUsernameCharacters = RegExp(r'^[a-zA-Z0-9]');

  TextEditingController password = new TextEditingController();
  TextEditingController confirm = new TextEditingController();
  static final validPassCharacters = RegExp(r'^[a-zA-Z0-9_\-=@,\.;]+$');

  TextEditingController phone = new TextEditingController();
  static final validPhoneCharacters = RegExp(r'^[0-9]');

  TextEditingController email = new TextEditingController();
  static final validEmailCharacters = RegExp(r'^[a-zA-Z0-9_\@\.]');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text("ProHealth Sign Up"),
          flexibleSpace: Container(
            decoration: BoxDecoration(
                gradient: LinearGradient(
                    begin: Alignment.centerLeft,
                    end: Alignment.centerRight,
                    colors: <Color>[Colors.lightBlue, Colors.blue])),
          )),
      body: OrientationBuilder(
        builder: (context, orientation) {
          return orientation == Orientation.landscape
              ? Center(
                  child: Text("Landscape"),
                )
              : SingleChildScrollView(
                  child: Form(
                    key: _formKey,
                    child: Padding(
                      padding: const EdgeInsets.only(
                          top: 40, left: 20.0, right: 20.0, bottom: 40),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            "Sign Up",
                            style: TextStyle(
                              fontSize: 30,
                              fontWeight: FontWeight.w500,
                            ),
                            textAlign: TextAlign.center,
                          ),
                          SizedBox(
                            height: 40,
                          ),
                          Text(
                            "Fields with '*' are required.",
                            style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w300,
                            ),
                            textAlign: TextAlign.left,
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          TextFormField(
                            controller: name,
                            validator: (String value) {
                              if (value.isEmpty) {
                                return "Please enter your name.";
                              } else if (!validNameCharacters.hasMatch(value)) {
                                return "Remove any non-alphabetic characters!";
                              } else if (value.length > 20) {
                                return "Your name is too long! Max length is 20 characters.";
                              }
                            },
                            decoration: InputDecoration(
                              border: OutlineInputBorder(),
                              labelText: "Full Name *",
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          TextFormField(
                            controller: username,
                            validator: (String value) {
                              if (value.isEmpty) {
                                return "Please enter your Username.";
                              } else if (!validUsernameCharacters
                                  .hasMatch(value)) {
                                return "Remove any special characters!";
                              } else if (value.length > 12) {
                                return "Your Username is too long. Max length is 12 characters.";
                              }
                            },
                            decoration: InputDecoration(
                              border: OutlineInputBorder(),
                              labelText: "Username *",
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Divider(),
                          SizedBox(
                            height: 10,
                          ),
                          TextFormField(
                            controller: password,
                            validator: (String value) {
                              if (value.isEmpty) {
                                return "Please enter your password.";
                              } else if (!validPassCharacters.hasMatch(value)) {
                                return "Your password has unaccepted symbols.";
                              } else if (value.length > 20) {
                                return "Your password is too long! Max length is 100 characters.";
                              }
                            },
                            obscureText: true,
                            decoration: InputDecoration(
                              border: OutlineInputBorder(),
                              labelText: "Password *",
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          TextFormField(
                            controller: confirm,
                            validator: (String value) {
                              if (value.isEmpty) {
                                return "Please enter your password.";
                              } else if (!validPassCharacters.hasMatch(value)) {
                                return "Your password has unaccepted symbols.";
                              } else if (value != password.text) {
                                return "Your passwords do not match.";
                              }
                            },
                            obscureText: true,
                            decoration: InputDecoration(
                              border: OutlineInputBorder(),
                              labelText: "Confirm Password *",
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Divider(),
                          SizedBox(
                            height: 10,
                          ),
                          TextFormField(
                            controller: phone,
                            validator: (String value) {
                              if (!validPhoneCharacters.hasMatch(value) &&
                                  !value.isEmpty) {
                                return "Your phone number must only contain numbers!";
                              }
                            },
                            decoration: InputDecoration(
                              border: OutlineInputBorder(),
                              labelText: "Phone",
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          TextFormField(
                            controller: email,
                            validator: (String value) {
                              if (!validEmailCharacters.hasMatch(value) &&
                                  !value.isEmpty) {
                                return "Your email has unaccepted symbols.";
                              }
                            },
                            decoration: InputDecoration(
                              border: OutlineInputBorder(),
                              labelText: "Email",
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          FlatButton(
                            color: Colors.blue,
                            child: Text(
                              "Sign Up",
                              style:
                                  TextStyle(fontSize: 15, color: Colors.white),
                            ),
                            onPressed: () {
                              setState(() {
                                if (_formKey.currentState.validate()) {
                                  _userSignUp(context);
                                }
                              });
                            },
                          ),
                        ],
                      ),
                    ),
                  ),
                );
        },
      ),
    );
  }

  void _userSignUp(BuildContext context) async {
    final int responseCode = await addNewUser(name.text, username.text,
        password.text, confirm.text, phone.text, email.text);
    print(responseCode);
    switch (responseCode) {
      case 1:
        showDialog(
            context: context,
            builder: (_) => AlertDialog(
                  title: Text("Passwords do NOT match!"),
                  content: Text("Please re-enter the passwords so they match."),
                  actions: [
                    FlatButton(
                      child: Text("Ok"),
                      onPressed: () {},
                    ),
                  ],
                  elevation: 20,
                ),
            barrierDismissible: true);
        break;
      case 2:
        Navigator.of(context).popAndPushNamed("/profile");
        break;
      case 3:
        showDialog(
            context: context,
            builder: (_) => AlertDialog(
                  title: Text("Error"),
                  content: Text(
                      "There was an error submitting the sign up. Please come back later."),
                  actions: [
                    FlatButton(
                      child: Text("Ok"),
                      onPressed: () {},
                    ),
                  ],
                  elevation: 20,
                ),
            barrierDismissible: true);
        break;
      default:
        showDialog(
            context: context,
            builder: (_) => AlertDialog(
                  title: Text("Error"),
                  content: Text(
                      "There is some unknown error. Response code: $responseCode"),
                  actions: [
                    FlatButton(
                      child: Text("Ok"),
                      onPressed: () => exit(0),
                    ),
                  ],
                  elevation: 20,
                ),
            barrierDismissible: false);
        break;
    }
  }
}

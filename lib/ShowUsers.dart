import 'dart:async';
import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:http/http.dart' as http;

class ShowUsers extends StatefulWidget {
  @override
  _ShowUsersState createState() => _ShowUsersState();
}

class _ShowUsersState extends State<ShowUsers> {
  String userId;
  List data = [];

  @override
  void initState() {
    fetchData();
    super.initState();
  }

  void fetchData() async {
    final response = await http
        .get('http://DESKTOP-4KOSN6V/CSFinalProject/retrieveusers.php');

    if (response.statusCode == 200) {
      setState(() {
        data = json.decode(response.body);
      });
    } else {
      print(response.statusCode);
      throw Exception('Failed');
    }
  }

  void requestUserDel() async {
    final response = await http
        .post('http://DESKTOP-4KOSN6V/CSFinalProject/dropuser.php', body: {
      'user_id': userId,
    });
    return Future.delayed(Duration(seconds: 0));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Show All Users Page"),
          backgroundColor: Colors.red,
          elevation:
              defaultTargetPlatform == TargetPlatform.android ? 5.0 : 0.0,
        ),
        body: ListView(scrollDirection: Axis.horizontal, children: <Widget>[
          Container(
            color: Colors.white,
            child: Center(
                child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Padding(
                  padding: EdgeInsets.all(8),
                  child: Text(
                    'Name',
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 16,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(8),
                  child: Text(
                    'User_ID',
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 16,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(8),
                  child: Text(
                    'Username',
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 16,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(8),
                  child: Text(
                    'Password',
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 16,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(8),
                  child: Text(
                    'Phone',
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 16,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(8),
                  child: Text(
                    'Email',
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 16,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            )),
          ),
          Container(
            height: double.infinity,
            width: 2,
            color: Colors.black,
          ),
          ListView.builder(
              scrollDirection: Axis.horizontal,
              shrinkWrap: true,
              itemCount: data.length,
              itemBuilder: (BuildContext context, int index) => Card(
                    child: InkWell(
                        onTap: () {
                          showDialog(
                              context: context,
                              builder: (_) {
                                return AlertDialog(
                                  title: Text('Delete User?'),
                                  actions: [
                                    FlatButton(
                                      onPressed: () => Navigator.pop(
                                          context, false), // passing false
                                      child: Text('No'),
                                    ),
                                    FlatButton(
                                      onPressed: () => Navigator.pop(
                                          context, true), // passing true
                                      child: Text('Yes'),
                                    ),
                                  ],
                                );
                              }).then((exit) {
                            if (exit == null) return;

                            if (exit) {
                              // user pressed Yes button\
                              userId = data[index]['User_ID'];
                              requestUserDel();
                            }
                          });
                        },
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              padding: EdgeInsets.all(8),
                              child: (Text(data[index]['Name'])),
                            ),
                            Container(
                              padding: EdgeInsets.all(8),
                              child: (Text(data[index]['User_ID'])),
                            ),
                            Container(
                              padding: EdgeInsets.all(8),
                              child: (Text(data[index]['Username'])),
                            ),
                            Container(
                              padding: EdgeInsets.all(8),
                              child: (Text(data[index]['Password'])),
                            ),
                            Container(
                              padding: EdgeInsets.all(8),
                              child: (Text(data[index]['Phone'])),
                            ),
                            Container(
                              padding: EdgeInsets.all(8),
                              child: (Text(data[index]['Email'])),
                            ),
                          ],
                        )),
                  ))
        ]));
  }
}

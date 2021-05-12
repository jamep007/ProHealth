import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class ViewPosts extends StatefulWidget {
  @override
  _ViewPostsState createState() => _ViewPostsState();
}

class _ViewPostsState extends State<ViewPosts> {
  // Temporary lists. Actual list comes form database.
  List _users = ['User 1', 'User 2', 'User 3'];
  List _posts = [
    'Post 1 testing testing testing',
    'Post 2 testing testing testing',
    'Post 3 testing testing testing'
  ];
  List _isLinkingExercise = [true, false, true];
  List _isLinkingDiet = [false, true, true];

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: _users.length,
      itemBuilder: (context, i) {
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: Card(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(18)),
            elevation: 4,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ListTile(
                    // Icon temporary or if user does not have profile picture.
                    leading: Icon(
                      Icons.person_outline_rounded,
                      size: 40,
                    ),
                    title: Text(
                      // User posting
                      _users[i],
                      style:
                          TextStyle(fontWeight: FontWeight.w500, fontSize: 16),
                    ),
                    trailing: FlatButton(
                      onPressed: () {
                        // Report user or post, message user
                      },
                      child: Icon(Icons.more_horiz_rounded),
                    ),
                  ),
                  SizedBox(
                    height: 4,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 8.0),
                    child: Text(
                      //Content of post
                      _posts[i],
                      textAlign: TextAlign.left,
                      style: TextStyle(fontSize: 14),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  _isLinkingExercise[i]
                      ? RaisedButton(
                          onPressed: () {
                            // Link to Exercise Plan
                          },
                          child: Padding(
                            padding: const EdgeInsets.all(4.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(
                                  Icons.directions_run,
                                  color: Colors.white,
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                Text(
                                  "View linked Exercise Plan",
                                  style: TextStyle(color: Colors.white),
                                ),
                              ],
                            ),
                          ),
                          color: Colors.red,
                          elevation: 4,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(18)),
                        )
                      : Container(),
                  _isLinkingDiet[i]
                      ? RaisedButton(
                          onPressed: () {
                            // Link to Nutrition Plan
                          },
                          child: Padding(
                            padding: const EdgeInsets.all(4.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(
                                  Icons.restaurant,
                                  color: Colors.white,
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                Text(
                                  "View linked Nutrition Plan",
                                  style: TextStyle(color: Colors.white),
                                ),
                              ],
                            ),
                          ),
                          color: Colors.green,
                          elevation: 4,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(18)),
                        )
                      : Container(),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}

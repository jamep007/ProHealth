import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:senior_project_swauhealthapp/appdrawer.dart';
import 'package:senior_project_swauhealthapp/Social/view_messages.dart';
import 'package:senior_project_swauhealthapp/Social/posts.dart';

class SocialPage extends StatefulWidget {
  final int passedIndex;
  SocialPage({Key key, @required this.passedIndex}) : super(key: key);
  @override
  _SocialPageState createState() => _SocialPageState(passedIndex);
}

class _SocialPageState extends State<SocialPage> {
  int _currentIndex = 1;
  _SocialPageState(this._currentIndex);

  final List<Widget> _pageTabs = [
    ViewMessages(),
    Posts(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text("Social"),
          flexibleSpace: Container(
            decoration: BoxDecoration(
                gradient: LinearGradient(
                    begin: Alignment.centerLeft,
                    end: Alignment.centerRight,
                    colors: <Color>[Colors.lightBlue, Colors.blue])),
          )),
      drawer: AppDrawer(),
      body: _pageTabs[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        onTap: (int index) => setState(() => _currentIndex = index),
        currentIndex: _currentIndex,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.message_rounded),
            title: Text(
              "Messages",
              textAlign: TextAlign.center,
            ),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.article_rounded),
            title: Text(
              "Posts",
              textAlign: TextAlign.center,
            ),
          ),
        ],
        unselectedItemColor: Colors.grey[800],
        fixedColor: Colors.blue,
      ),
      floatingActionButton: _currentIndex == 0
          ? FloatingActionButton(
              onPressed: () {
                // Add a message
              },
              child: Icon(Icons.add_comment, color: Colors.white),
              backgroundColor: Colors.lightBlue,
            )
          : _currentIndex == 1
              ? FloatingActionButton(
                  onPressed: () {
                    // Add a post
                  },
                  child: Icon(Icons.post_add_rounded, color: Colors.white),
                  backgroundColor: Colors.lightBlue,
                )
              : null,
    );
  }
}

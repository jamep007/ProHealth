import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class ViewMessages extends StatefulWidget {
  @override
  _ViewMessagesState createState() => _ViewMessagesState();
}

class _ViewMessagesState extends State<ViewMessages> {
  // Get list from database
  List items = ['User 1', 'User 2', 'User 3', 'User 4'];

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: items.length,
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.only(top: 8, left: 8, right: 8),
          child: Card(
            elevation: 4,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(18)),
            child: FlatButton(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(18)),
              onPressed: () {
                // Open messages sent from this sender
              },
              child: ListTile(
                // if the sender has a profile picture, use that. If not, use this icon
                leading: Container(
                  decoration: BoxDecoration(
                    color: Colors.lightBlue[50],
                    borderRadius: BorderRadius.all(Radius.circular(50.0)),
                  ),
                  child: Icon(
                    Icons.person_outline_rounded,
                    size: 50,
                  ),
                ),
                title: Text('${items[index]}'),
                // Get the text from the latest message from the sender.
                subtitle: Text(
                  "This is a demo message...",
                  style: TextStyle(fontSize: 12),
                ),
                trailing: FlatButton(
                  onPressed: () {
                    // Show popup menu:
                    // - Delete messages
                    // - Report user
                  },
                  child: Icon(Icons.more_horiz_rounded),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}

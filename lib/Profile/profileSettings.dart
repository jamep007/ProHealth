import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class ProfileSettings extends StatefulWidget {
  @override
  _ProfileSettingsState createState() => _ProfileSettingsState();
}

class _ProfileSettingsState extends State<ProfileSettings> {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: ListTile.divideTiles(
        context: context,
        tiles: [
          FlatButton( onPressed: (){},
                      child: ListTile(
                leading: Icon(Icons.account_circle, size: 30.0),
                title: Text('Personal Information'),
                subtitle:
                    Text('Update your name, phone number, and email address.'),
                    trailing: Icon(Icons.arrow_right)),
          ),
          FlatButton( onPressed: (){},
                      child: ListTile(
                leading: Icon(Icons.notifications, size: 30.0),
                title: Text('Notifications'),
                subtitle: Text('Manage your notification settings.'),
                trailing: Icon(Icons.arrow_right)),
          ),
          FlatButton( onPressed: (){},
                      child: ListTile(
              leading: Icon(Icons.lock, size: 30.0),
              title: Text('Privacy Settings'),
              subtitle: Text(
                  'Control what other users can see on your profile and posts.'),
              trailing: Icon(Icons.arrow_right)
            ),
          ),
          FlatButton( onPressed: (){},
                      child: ListTile(
                leading: Icon(Icons.near_me, size: 30.0),
                title: Text('Location Services'),
                subtitle: Text('Manage your location settings.'),
                trailing: Icon(Icons.arrow_right)),
          ),
          FlatButton( onPressed: (){},
                      child: ListTile(
                leading: Icon(Icons.security, size: 30.0),
                title: Text('Security'),
                subtitle: Text('Manage your password and login activity.'),
                trailing: Icon(Icons.arrow_right)),
          ),
          FlatButton( onPressed: (){},
                      child: ListTile(
              leading: Icon(Icons.block, size: 30.0),
              title: Text('Blocked Users'),
              subtitle: Text('Your blocked users'),
              trailing: Icon(Icons.arrow_right)),
          ),
           FlatButton( onPressed: (){},
                      child: ListTile(
              leading: Icon(Icons.accessibility, size: 30.0),
              title: Text('Accessibility'),
              subtitle: Text('Adjust the font size or style, colour adjustment or Speech-to-text.'),
              trailing: Icon(Icons.arrow_right),),
          ),
          FlatButton( onPressed: (){},
                      child: ListTile(
                leading: Icon(Icons.help, size: 30.0),
                title: Text('Help'),
                subtitle: Text('Get assistance.'),
                trailing: Icon(Icons.arrow_right)),
          ),
          FlatButton( onPressed: (){},
                      child: ListTile(
                leading: Icon(Icons.info, size: 30.0),
                title: Text('About'),
                subtitle: Text('About this app.'),
                trailing: Icon(Icons.arrow_right)),
          )
          
        ],
      ).toList(),
    );
  }
}

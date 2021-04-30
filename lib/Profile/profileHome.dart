import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class ProfileHome extends StatefulWidget {
  @override
  _ProfileHomeState createState() => _ProfileHomeState();
}

class _ProfileHomeState extends State<ProfileHome> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Stack(
            overflow: Overflow.visible,
            alignment: Alignment.center,
            children: <Widget>[
              Image(
                width: double.infinity,
                height: MediaQuery.of(context).size.height / 3,
                fit: BoxFit.cover,
                image: NetworkImage(
                    'https://www.solidbackgrounds.com/images/3840x2160/3840x2160-dark-gray-solid-color-background.jpg'),
              ),
              Positioned(
                bottom: -60.0,
                child: CircleAvatar(
                  radius: 75,
                  backgroundColor: Colors.white,
                  backgroundImage: NetworkImage(
                      'https://t3.ftcdn.net/jpg/00/64/67/80/360_F_64678017_zUpiZFjj04cnLri7oADnyMH0XBYyQghG.jpg'),
                ),
              )
            ]),
        SizedBox(
          height: 60,
        ),
        ListTile(
          title: Center(
              child: Text('First Name and Last Name',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600))),
          subtitle:
              Center(child: Text('User Info...')),
        ),
        FlatButton.icon(
            onPressed: () {},
            icon: Icon(Icons.edit, color: Colors.white),
            label: Text('Edit Profile',
                style: TextStyle(
                  color: Colors.white,
                )),
            color: Colors.blue,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(4))),
        ListTile(
            title: Text('About Me'),
            subtitle: Text('User bibliography....'))
      ],
    );
  }
}

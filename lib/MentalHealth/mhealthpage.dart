import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:http/http.dart' as http;
import 'package:senior_project_swauhealthapp/appdrawer.dart';
import 'survey.dart';



class MHealthPage extends StatefulWidget {
  @override
  _MHealthPageState createState() => _MHealthPageState();

  
}
bool hasDoneSurvey = false;
class _MHealthPageState extends State<MHealthPage> {




void initState() {
    super.initState();
    if(!hasDoneSurvey){
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      await showDialog(
        context: context,
        builder: (BuildContext context) => userSurvey(context));
    });}
  }

  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text("Mental Health Page"),
          flexibleSpace: Container(
            decoration: BoxDecoration(
                gradient: LinearGradient(
                    begin: Alignment.centerLeft,
                    end: Alignment.centerRight,
                    colors: <Color>[Colors.lightBlue, Colors.blue])),
          )),
                     drawer: AppDrawer(),
                     floatingActionButton: FloatingActionButton(
                       child: Icon(Icons.add),
                       onPressed: (){showDialog(context: context, builder: (BuildContext context) => userSurvey(context));}
                     ),
                      body: Padding(
                        padding: EdgeInsets.all(10),
                        child: SingleChildScrollView(
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: <Widget>[
                              Text(
                                'Diary',
                                style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold ),
                              ),
                              SizedBox(
                                width: double.infinity,
                            height: 200,
                            
                            child: RaisedButton(
                              color: Colors.grey.shade400,
                              child: Text('Knowing Myself', style: TextStyle(color: Colors.white)),
                              onPressed: (){},
                            ),
                              ),

                              Center(
                                child: Text('Resources',
                                style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500)
                                )),

                              SizedBox(
                                height: 200.0,
                                child: ListView.builder(
                                  physics: ClampingScrollPhysics(),
                                  shrinkWrap: true,
                                  scrollDirection: Axis.horizontal,
                                  itemCount: 8,
                                  itemBuilder: (BuildContext context, int index) => Card(
                                        child: RaisedButton(
                                          child: Center(child: Text('Dummy Card Text')),
                                        onPressed: (){} )
                                      ),
                                ),
                              ),
                              Text(
                                'Health Plans',
                                style: TextStyle(fontSize: 18),
                              ),
                              Card(
                                child: ListTile(title: Text('Card Text'), 
                                subtitle: Text('this is a description of the card text')),
                              ), Card(
                                child: ListTile(title: Text('Card Text'), 
                                subtitle: Text('this is a description of the card text')),
                              ),
                              Card(
                                child: ListTile(title: Text('Card Text'), 
                                subtitle: Text('this is a description of the card text')),
                              ),
                              Card(
                                child: ListTile(title: Text('Card Text'), 
                                subtitle: Text('this is a description of the card text')),
                              ),
                              Card(
                                child: ListTile(title: Text('Card Text'), 
                                subtitle: Text('this is a description of the card text')),
                              ),
                            ],
                          ),
                        ), )
                            
                          );
                                        
                          }
                        }
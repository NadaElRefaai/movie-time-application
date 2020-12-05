import 'package:flutter/material.dart';

class User extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Widget titleSection = new Container(
      padding: const EdgeInsets.all(10.0),
      child: new Row(
        children: <Widget>[
          new Expanded(
              child: new Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              new Text("Name",
                  style: new TextStyle(
                      fontSize: 25.0, fontWeight: FontWeight.bold)),
              new Text("User 1",
                  style:
                      new TextStyle(fontSize: 15.0, color: Colors.grey[600])),
              new Text("Email",
                  style: new TextStyle(
                      fontSize: 25.0, fontWeight: FontWeight.bold)),
              new Text("User1@yahoo.com",
                  style:
                      new TextStyle(fontSize: 15.0, color: Colors.grey[600])),
              new Text("Age",
                  style: new TextStyle(
                      fontSize: 25.0, fontWeight: FontWeight.bold)),
              new Text("Age 1",
                  style: new TextStyle(fontSize: 15.0, color: Colors.grey[600]))
            ],
          )),
        ],
      ),
    );
    return MaterialApp(
      title: 'User Profile',
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.black,
          title: Text('User Profile'),
        ),
        body: Center(
          child: Column(
            children: <Widget>[
              Image.asset('assets/logo.jpg', fit: BoxFit.cover),
              titleSection
            ],
          ),
        ),
      ),
    );
  }
}

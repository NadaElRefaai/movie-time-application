import 'package:flutter/material.dart';

class MyStaticListView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new ListView(children: <Widget>[
      ListTile(
        leading: Icon(Icons.movie),
        title: Text('movie1'),
      ),
      ListTile(
        leading: Icon(Icons.movie),
        title: Text('movie2'),
      ),
      ListTile(
        leading: Icon(Icons.movie),
        title: Text('movie3'),
      ),
      ListTile(
        leading: Icon(Icons.movie),
        title: Text('movie4'),
      ),
      ListTile(
        leading: Icon(Icons.movie),
        title: Text('movie5'),
      ),
      ListTile(
        leading: Icon(Icons.movie),
        title: Text('movie6'),
      ),
    ]);
  }
}

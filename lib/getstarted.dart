import 'package:flutter/material.dart';
import 'signUp.dart';

class Getstarted extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Get Started With Movie Time',
      home: Container(
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage("assets/getstarted.jpg"), fit: BoxFit.cover)),
        child: Scaffold(
          backgroundColor: Colors.transparent,
          appBar: AppBar(
            leading: RaisedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => MyCustomForm()),
                );
              },
              child: const Text('Get Started'),
            ),
          ),
        ),
      ),
    );
  }
}

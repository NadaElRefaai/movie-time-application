import 'package:flutter/material.dart';
import 'welcome.dart';

class Getstarted extends StatefulWidget {
  @override
  _GetstartedState createState() => _GetstartedState();
}

class _GetstartedState extends State<Getstarted> {
  @override
  Widget build(BuildContext context) {
    return Stack(alignment: Alignment.bottomCenter, children: <Widget>[
      Image(
        image: AssetImage('assets/getstarted.jpg'),
        fit: BoxFit.cover,
      ),
      Padding(
          padding: EdgeInsets.all(8.0),
          child: RaisedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => MyApp()),
                );
              },
              child: Text("Get Started"))),
    ]);
  }
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: WelcomePage(),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'home.dart';
import 'search.dart';
import 'userprofile.dart';

class MainPage extends StatefulWidget {
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int page = 0;
  var pageoptions = [HomePage(), SearchPage(), MyApp()];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        items: [
          // ignore: deprecated_member_use
          BottomNavigationBarItem(icon: Icon(Icons.home), title: Text("Home")),

          BottomNavigationBarItem(
              icon: Icon(Icons.search),
              // ignore: deprecated_member_use
              title: Text("Search")),

          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            // ignore: deprecated_member_use
            title: Text("Profile"),
          )
        ],
        onTap: (index) {
          setState(() {
            page = index;
          });
        },
      ),
      body: pageoptions[page],
    );
  }
}

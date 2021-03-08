import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import '../api key/apikey.dart';
import 'dart:convert';

class SearchPage extends StatefulWidget {
  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  @override
  Widget build(BuildContext context) {
    // ignore: unused_element
    search() async {
      var url =
          'https://api.themoviedb.org/3/search/movie?api_key=$apikey&language=en-US&page=1&include_adult=false';
      var response = await http.get(url);
      var result = jsonDecode(response.body);
      print(result);
    }

    return MaterialApp(
      home: FloatingActionButton(
        child: Icon(Icons.search),
        tooltip: 'Search Movie',
        onPressed: () => search(),
      ),
    );
  }
}

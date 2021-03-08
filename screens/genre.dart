import 'dart:convert';
import '../classes/model.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../api key/apikey.dart';

class GenrePage extends StatefulWidget {
  final String id;
  GenrePage(this.id);
  @override
  _GenrePageState createState() => _GenrePageState();
}

class _GenrePageState extends State<GenrePage> {
  getgenres() async {
    var url =
        'https://api.themoviedb.org/3/discover/movie?api_key=$apikey&language=en-US&sort_by=popularity.desc&page=1&with_genres=${widget.id}';
    var response = await http.get(url);
    var result = jsonDecode(response.body);
    List<Movie> genrelist = List<Movie>();
    for (var x in result['results']) {
      Movie movie = Movie(
          x['poster_path'],
          x['title'],
          x['overview'],
          x['vote_average'],
          x['id'],
          x['original_language'],
          x['original_title']);
      genrelist.add(movie);
    }

    return genrelist;
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: getgenres(),
        builder: (BuildContext context, dataSnapshot) {
          if (!dataSnapshot.hasData) {
            return Text("Loading");
          }
          return ListView.builder(
              itemCount: dataSnapshot.data.lenght,
              itemBuilder: (BuildContext context, int index) {
                return Container(
                  height: 200,
                  padding: EdgeInsets.all(10.0),
                  child: Image(
                    image: NetworkImage(
                        'https://image.tmdb.org/t/p/w500${dataSnapshot.data[index].poster}'),
                    fit: BoxFit.cover,
                  ),
                );
              });
        });
  }
}

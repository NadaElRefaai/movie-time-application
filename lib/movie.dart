import 'package:flutter/material.dart';

class ViewMovie extends StatefulWidget {
  final String poster;
  final String title;
  final String overview;
  final double rating;
  final int id;
  final String origin;
  final String original;

  ViewMovie(this.poster, this.title, this.overview, this.rating, this.id,
      this.origin, this.original);

  @override
  _ViewMovieState createState() => _ViewMovieState();
}

class _ViewMovieState extends State<ViewMovie> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[],
        ),
      ),
    );
  }
}

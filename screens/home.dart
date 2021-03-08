import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:http/http.dart' as http;
import 'package:movietime/screens/genre.dart';
import '../api key/apikey.dart';
import '../classes/model.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  TabController tabController;
  void initState() {
    super.initState();
    tabController = TabController(length: 5, vsync: this);
  }

  getTrindingMovies() async {
    var url = 'https://api.themoviedb.org/3/trending/movie/day?api_key=$apikey';
    var response = await http.get(url);
    var result = jsonDecode(response.body);
    List<Movie> trendinglist = List<Movie>();
    for (var x in result['results']) {
      Movie movie = Movie(
          x['poster_path'],
          x['title'],
          x['overview'],
          x['vote_average'],
          x['id'],
          x['original_language'],
          x['original_title']);
      trendinglist.add(movie);
    }
    print(trendinglist);
    return trendinglist;
  }

  getgenrelist() async {
    var url =
        'https://api.themoviedb.org/3/genre/movie/list?api_key=$apikey&language=en-US';
    var response = await http.get(url);
    var result = jsonDecode(response.body);
    print(result);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Container(
                alignment: Alignment.centerLeft,
                margin: EdgeInsets.only(left: 10.0, top: 50.0),
                child: Text(
                  'Trending Movies',
                  style: TextStyle(fontWeight: FontWeight.bold),
                )),
            SizedBox(height: 20.0),
            Container(
                height: 400,
                child: FutureBuilder(
                    future: getTrindingMovies(),
                    builder: (BuildContext context, dataSnapshot) {
                      if (!dataSnapshot.hasData) {
                        return Text("Loading");
                      }
                      return CarouselSlider.builder(
                          itemCount: dataSnapshot.data.length,
                          itemBuilder: (BuildContext context, int index) {
                            return GestureDetector(
                              /*onTap: () => {
                                Navigator.push(
                                   context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                         ))
                              },*/
                              child: Container(
                                //  height: 400,
                                child: Image(
                                  image: NetworkImage(
                                      'https://image.tmdb.org/t/p/w500${dataSnapshot.data[index].poster}'),
                                  fit: BoxFit.cover,
                                ),
                              ),
                            );
                          },
                          options: CarouselOptions(
                              height: MediaQuery.of(context).size.width,
                              viewportFraction: 0.65,
                              initialPage: 0,
                              enableInfiniteScroll: true,
                              reverse: true,
                              autoPlay: true,
                              autoPlayInterval: Duration(seconds: 4),
                              autoPlayAnimationDuration:
                                  Duration(milliseconds: 800),
                              enlargeCenterPage: true,
                              scrollDirection: Axis.horizontal));
                    })),
            TabBar(
                controller: tabController,
                isScrollable: true,
                indicatorColor: Colors.black,
                labelColor: Colors.black,
                unselectedLabelColor: Colors.grey,
                tabs: [
                  Tab(
                    text: "Action",
                  ),
                  Tab(
                    text: "Comedy",
                  ),
                  Tab(
                    text: "Crime",
                  ),
                  Tab(
                    text: "Thriller",
                  ),
                  Tab(
                    text: "Romance",
                  ),
                ]),
            SingleChildScrollView(
              child: Container(
                height: 200,
                child: TabBarView(
                  controller: tabController,
                  children: [
                    GenrePage('28'),
                    GenrePage('35'),
                    GenrePage('80'),
                    GenrePage('53'),
                    GenrePage('10749'),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

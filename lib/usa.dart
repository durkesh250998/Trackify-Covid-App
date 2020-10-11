import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Album {
  final String state;
  final int updated;
  final int cases;
  final int deaths;
  final int todayDeaths;
  final int active;
  final int casesPerOneMillion;
  final int deathsPerOneMillion;
  final int tests;
  final int testsPerOneMillion;
  final int population;
  final int todayCases;

  Album(
      {this.state,
      this.updated,
      this.cases,
      this.deaths,
      this.todayCases,
      this.todayDeaths,
      this.active,
      this.casesPerOneMillion,
      this.deathsPerOneMillion,
      this.tests,
      this.testsPerOneMillion,
      this.population});

  factory Album.fromJson(Map<String, dynamic> json) {
    return Album(
      state: json['state'],
      updated: json['updated'],
      cases: json['cases'],
      deaths: json['deaths'],
      todayCases: json['todayCases'],
      active: json['active'],
      casesPerOneMillion: json['casesPerOneMillion'],
      deathsPerOneMillion: json['deathsPerOneMillion'],
      tests: json['tests'],
      testsPerOneMillion: json['testsPerOneMillion'],
      population: json['population'],
      todayDeaths: json['todayDeaths'],
    );
  }
}

void main() => runApp(HomePage());

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Flutter Demo",
      theme: ThemeData(primarySwatch: Colors.grey),
      home: MyApp(title: "USA"),
    );
  }
}

class MyApp extends StatefulWidget {
  MyApp({Key key, this.title}) : super(key: key);
  final String title;
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Future<List<Album>> _getAlbums() async {
    var data = await http.get("https://corona.lmao.ninja/v3/covid-19/states");
    var jsonData = jsonDecode(data.body);
    List<Album> albums = [];
    for (var a in jsonData) {
      Album album = Album(
          state: a["state"],
          updated: a["updated"],
          cases: a["cases"],
          deaths: a["deaths"],
          todayCases: a["todayCases"],
          todayDeaths: a["todayDeaths"],
          active: a["active"],
          casesPerOneMillion: a["casesPerOneMillion"],
          deathsPerOneMillion: a["deathsPerOneMillion"],
          tests: a["tests"],
          testsPerOneMillion: a["testsPerOneMillion"],
          population: a["population"]);
      albums.add(album);
    }
    print(albums.length);
    return albums;
  }

  /* @override
  void initState() {
    super.initState();
    futureAlbum = fetchAlbum();
  }
*/
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: new Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.indigoAccent,
          centerTitle: true,
          title: Text(
            widget.title,
            style: TextStyle(
                fontFamily: "Times New Roman",
                fontSize: 20.0,
                fontWeight: FontWeight.bold),
          ),
        ),
        body: Container(
          decoration: BoxDecoration(color: Colors.indigo),
          child: FutureBuilder(
            future: _getAlbums(),
            builder: (BuildContext context, AsyncSnapshot snapshot) {
              if (snapshot.data == null) {
                return Container(
                  child: Center(child: Text("Loading")),
                );
              } else {
                return ListView.builder(
                  itemCount: snapshot.data.length,
                  itemBuilder: (BuildContext context, int index) {
                    return Container(
                      margin: const EdgeInsets.only(
                        top: 40.0,
                        bottom: 40.0,
                        left: 40.0,
                        right: 40.0,
                      ),
                      decoration: new BoxDecoration(
                        //  color: Colors.,
                        shape: BoxShape.rectangle,
                        borderRadius: new BorderRadius.circular(5.0),
                        boxShadow: <BoxShadow>[
                          new BoxShadow(
                              color: Colors.blue,
                              blurRadius: 5.0,
                              spreadRadius: 5.0
                              //   offset: new Offset(0.0, 40.0),
                              ),
                        ],
                      ),
                      child: Card(
                        color: Colors.indigo,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            Text(
                              "State:" + snapshot.data[index].state,
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 12.0,
                                  fontWeight: FontWeight.bold,
                                  fontFamily: "Times"),
                            ),
                            Text(
                              "Cases : " +
                                  snapshot.data[index].cases.toString(),
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 12.0,
                                  fontWeight: FontWeight.bold,
                                  fontFamily: "Times"),
                            ),
                            Text(
                                "Today Cases : " +
                                    snapshot.data[index].todayCases.toString(),
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 12.0,
                                    fontWeight: FontWeight.bold,
                                    fontFamily: "Times")),
                            Text(
                              "Today Deaths : " +
                                  snapshot.data[index].todayDeaths.toString(),
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 12.0,
                                  fontWeight: FontWeight.bold,
                                  fontFamily: "Times"),
                            ),
                            Text(
                              "Active : " +
                                  snapshot.data[index].active.toString(),
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 12.0,
                                  fontWeight: FontWeight.bold,
                                  fontFamily: "Times"),
                            ),
                            Text(
                              "Cases Per One Million : " +
                                  snapshot.data[index].casesPerOneMillion
                                      .toString(),
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 12.0,
                                  fontWeight: FontWeight.bold,
                                  fontFamily: "Times"),
                            ),
                            Text(
                              "Total Deaths : " +
                                  snapshot.data[index].deaths.toString(),
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 12.0,
                                  fontWeight: FontWeight.bold,
                                  fontFamily: "Times"),
                            ),
                            Text(
                              "Deaths Per One Million : " +
                                  snapshot.data[index].deathsPerOneMillion
                                      .toString(),
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 12.0,
                                  fontWeight: FontWeight.bold,
                                  fontFamily: "Times"),
                            ),
                            Text(
                              "Tests Per One Million : " +
                                  snapshot.data[index].testsPerOneMillion
                                      .toString(),
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 12.0,
                                  fontWeight: FontWeight.bold,
                                  fontFamily: "Times"),
                            ),
                            Text(
                              "Tests : " +
                                  snapshot.data[index].tests.toString(),
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 12.0,
                                  fontWeight: FontWeight.bold,
                                  fontFamily: "Times"),
                            ),
                            Text(
                              "Population : " +
                                  snapshot.data[index].population.toString(),
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 12.0,
                                  fontWeight: FontWeight.bold,
                                  fontFamily: "Times"),
                            )
                          ],
                        ),
                      ),
                    );
                    /*    Center(
                      child: SafeArea(
                        child: Container(
                          decoration: BoxDecoration(
                              color: Colors.black,
                              border: Border.all(color: Colors.white, width: 15)),
                          child: ListTile(
                            leading: Icon(
                              Icons.assessment,
                              color: Colors.green,
                            ),
                            title: Text(
                              snapshot.data[index].state,
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 20.0,
                                  fontWeight: FontWeight.bold,
                                  fontFamily: "Times New Roman"),
                            ),
                            subtitle: Text(
                              snapshot.data[index].cases.toString(),
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 20.0,
                                  fontWeight: FontWeight.bold,
                                  fontFamily: "Sans"),
                            ),
                          ),
                        ),
                      ),
                    );*/
                  },
                );
              }
            },
          ),
        ),
      ),
    );
  }
}

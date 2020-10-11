import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:http/http.dart' as http;

class Album {
  int active;
  int cured;
  int deaths;
  int noOfCases;
  String state;

  Album({
    this.active,
    this.cured,
    this.deaths,
    this.noOfCases,
    this.state,
  });

  factory Album.fromJson(Map<String, dynamic> json) {
    return Album(
      active: json["active"],
      cured: json["cured"],
      deaths: json["deaths"],
      noOfCases: json["noOfCases"],
      state: json["state"],
    );
  }
}

void main() => runApp(Home());

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: "Flutter Demo",
        theme: ThemeData(primarySwatch: Colors.purple),
        home: MyApp(title: "INDIA"),
      ),
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
    var data =
        await http.get("https://covid-india-cases.herokuapp.com/states/");
    var jsonData = jsonDecode(data.body);
    List<Album> albums = [];
    for (var a in jsonData) {
      Album album = Album(
        active: a["active"],
        cured: a["cured"],
        deaths: a["deaths"],
        noOfCases: a["noOfCases"],
        state: a["state"],
      );
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
    return new Scaffold(
      appBar: AppBar(
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
        decoration: BoxDecoration(color: Colors.deepPurple),
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
                            color: Colors.purple,
                            blurRadius: 5.0,
                            spreadRadius: 5.0
                            //   offset: new Offset(0.0, 40.0),
                            ),
                      ],
                    ),
                    child: Card(
                      color: Colors.deepPurple,
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
                              "Cured : " +
                                  snapshot.data[index].cured.toString(),
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 12.0,
                                  fontWeight: FontWeight.bold,
                                  fontFamily: "Times")),
                          Text(
                            "No of Cases : " +
                                snapshot.data[index].noOfCases.toString(),
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 12.0,
                                fontWeight: FontWeight.bold,
                                fontFamily: "Times"),
                          ),
                          Text(
                            "Active : " +
                                snapshot.data[index].deaths.toString(),
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 12.0,
                                fontWeight: FontWeight.bold,
                                fontFamily: "Times"),
                          ),
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
    );
  }
}

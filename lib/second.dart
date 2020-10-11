import 'package:flutter/material.dart';
import 'safety.dart';
import 'usa.dart';
import 'india.dart';
import 'tweets.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'main.dart';

void main() => runApp(new MaterialApp(
      debugShowCheckedModeBanner: false,
      home: new MyApp(),
    ));

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Vx.blue800,
        appBar: AppBar(
          iconTheme: new IconThemeData(color: Vx.blue400),
          backgroundColor: Vx.blue800,
          elevation: 0,
          /*    leading: IconButton(
              icon: Icon(Icons.menu),
              onPressed: () {
                print('ICON BUTTON');
              }),*/
          title: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Trackify',
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 20.0,
                    fontFamily: "Times New Roman"),
              ),
              Text(
                'Covid',
                style: TextStyle(
                    color: Colors.blue,
                    fontWeight: FontWeight.bold,
                    fontSize: 20.0,
                    fontFamily: "Times New Roman"),
              ),
            ],
          ),
          actions: [
            /*  IconButton(
                icon: Icon(
                  Icons.search,
                  color: Colors.white,
                ),
                onPressed: null),*/
            Center(
              child: SizedBox(
                height: 38.0,
                width: 50,
                child: RaisedButton(
                  child: IconButton(
                      icon: Icon(
                        Icons.more_vert,
                        color: Colors.white,
                      ),
                      onPressed: () {
                        setState(() {
                          showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                return AlertDialog(
                                  title: Text(
                                    "For Queries",
                                    textAlign: TextAlign.center,
                                  ),
                                  content: Text("durkesh250998@gmail.com"),
                                );
                              });
                        });
                      }),
                ),
              ),
            ),
          ],
        ),
        body: WebView(
          initialUrl:
              ("https://www.who.int/emergencies/diseases/novel-coronavirus-2019/media-resources/news"),
          javascriptMode: JavascriptMode.unrestricted,
        ),
        drawer: SafeArea(
          child: Drawer(
            elevation: 1.0,
            child: Container(
              width: 20,
              padding: EdgeInsets.zero,
              decoration: BoxDecoration(color: Colors.black),
              child: Column(
                children: [
                  DrawerHeader(
                      decoration: BoxDecoration(
                    image: DecorationImage(
                        fit: BoxFit.cover,
                        image: AssetImage('assets/covid.jpg')),
                  )),
                  Container(
                    child: Center(
                      child: ListTile(
                        title: Text(
                          'USA(state wise count)',
                          //  textAlign: TextAlign.center,
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 15.0,
                              fontFamily: "Times"),
                        ),
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => HomePage()),
                          );
                        },
                        leading: Icon(
                          Icons.apps,
                          color: Colors.green,
                        ),
                      ),
                    ),
                  ),
                  Container(
                    child: Divider(
                      color: Colors.indigo,
                      height: 1,
                      thickness: 2.0,
                    ),
                  ),
                  ListTile(
                    title: Text(
                      'INDIA(state wise count)',
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 15.0,
                          fontFamily: "Times New Roman"),
                    ),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => Home()),
                      );
                    },
                    leading: Icon(
                      Icons.bubble_chart,
                      color: Colors.green,
                    ),
                  ),
                  Divider(
                    color: Colors.indigo,
                    height: 1,
                    thickness: 2.0,
                  ),
                  ListTile(
                    title: Text(
                      'Tweets',
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 15.0,
                          fontFamily: "Times New Roman"),
                    ),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => tweets()),
                      );
                    },
                    leading: Icon(
                      Icons.message,
                      color: Colors.green,
                    ),
                  ),
                  Divider(
                    color: Colors.indigo,
                    height: 1,
                    thickness: 2.0,
                  ),
                  ListTile(
                    title: Text(
                      'Symptoms',
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 15.0,
                          fontFamily: "Times New Roman"),
                    ),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => safety()),
                      );
                    },
                    leading: Icon(
                      Icons.all_inclusive,
                      color: Colors.green,
                    ),
                  ),
                  Divider(
                    color: Colors.indigo,
                    height: 1,
                    thickness: 2.0,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

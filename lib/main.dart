import 'package:app1/second.dart';
import 'package:flutter/material.dart';
import 'second.dart';

void main() => runApp(App());

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Trackify Covid",
      home: startScreen(),
    );
  }
}

class startScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          backgroundColor: Colors.white24,
          body: Column(children: [
            Expanded(
              child: Center(
                child: RichText(
                  text: TextSpan(
                    children: [
                      TextSpan(
                        text: "Trackify",
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 40.0,
                            fontFamily: "Times"),
                      ),
                      TextSpan(
                        text: "Covid",
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.blue,
                            fontSize: 25.0,
                            fontStyle: FontStyle.italic,
                            fontFamily: "Times"),
                      )
                    ],
                  ),
                ),
              ),
            ),
            GestureDetector(
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return MyApp();
                }));
                // MaterialPageRoute(builder: (context) => MyApp());
              },
              child: FittedBox(
                child: Container(
                  margin: EdgeInsets.only(bottom: 20.0),
                  padding: EdgeInsets.symmetric(horizontal: 25, vertical: 15),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(25.0),
                      color: Colors.red),
                  child: Row(
                    children: [
                      Text("Turn on Mobile Data and Proceed"),
                      Icon(Icons.arrow_forward_ios)
                    ],
                  ),
                ),
              ),
            ),
          ])),
    );
  }
}

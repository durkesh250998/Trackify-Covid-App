import 'package:flutter/material.dart';
import 'main.dart';
import 'package:webview_flutter/webview_flutter.dart';

class tweets extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            "India Fights Covid",
            style: TextStyle(
                color: Colors.blue,
                fontWeight: FontWeight.bold,
                fontSize: 20.0,
                fontFamily: "Times New Roman"),
          ),
        ),
        body: WebView(
          initialUrl: ("https:mobile.twitter.com/covidnewsbymib?lang=en"),
          javascriptMode: JavascriptMode.unrestricted,
        ),
      ),
    );
  }
}

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'package:simple_pos/pages/home_page.dart';

import 'dependency/contants.dart';

void main() {
  setMode(kReleaseMode);
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Siple POS',
      theme: ThemeData(
        primarySwatch: Colors.red,
        accentColor: Colors.cyan[600],
        fontFamily: 'Montserrat',

        // Define the default TextTheme. Use this to specify the default
        // text styling for headlines, titles, bodies of text, and more.
        textTheme: TextTheme(
          headline: TextStyle(fontSize: 72.0, fontWeight: FontWeight.bold),
          title: TextStyle(fontSize: 36.0, fontStyle: FontStyle.italic),
          body1: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
        ),
      ),
      home: HomePage(),
    );
  }
}

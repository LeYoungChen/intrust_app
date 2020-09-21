import 'package:flutter/material.dart';
import 'package:intrust/pages/home.dart';
import 'package:intrust/pages/recommend.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override

  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: new ThemeData(
        primaryColor: Colors.white,
        visualDensity: VisualDensity.adaptivePlatformDensity,
        fontFamily: 'DIN2014',
      ),
      home: Home(),
    );
  }
}


import 'package:dribbbletravelui/screens/homepage.dart';
import 'package:dribbbletravelui/screens/homepage2.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Travel UI',
      theme: ThemeData(
        primaryColor: Colors.grey,
        accentColor: Colors.blueAccent
      ),
      home: HomePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}
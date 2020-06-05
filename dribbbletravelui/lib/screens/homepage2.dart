import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class HomePagee extends StatefulWidget {
  
  @override
  _HomePageeState createState() => _HomePageeState();
}

class _HomePageeState extends State<HomePagee> {
  final List<String>iconSubText = [
    'Flight',
    'Hotels',
    'Cars',
    'Train',
  ];
  List<Icon>icons = [
      Icon(
      FontAwesomeIcons.car,
      color: Colors.purple,
      size: 30.0,
      ),
      Icon(
        FontAwesomeIcons.bed,
        color: Colors.red,
        size: 30.0,
        ),
      Icon(
        FontAwesomeIcons.fly,
        color: Colors.blue,
        size: 30.0,
      ),
      Icon(
        FontAwesomeIcons.train,
        color: Colors.grey,
        size: 30.0,
        ),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 20.0),
        height: 150.0,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: icons.length,
          itemBuilder: (BuildContext context, int index){
            return Column(
              children: <Widget>[
                Container(
                  margin: EdgeInsets.all(10.0),
                  height: 70.0,
                  width: 70.0,
                  decoration: BoxDecoration(
                    color: Colors.grey[200],
                    borderRadius: BorderRadius.circular(10.0)
                  ),
                  child: icons[index],
                ),
                Text(iconSubText[index],
                ),
              ],
            );
          },
          ),
    ),
      ),
    );
  }
}
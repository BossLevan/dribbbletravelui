import 'package:dribbbletravelui/models/destination_model.dart';
import 'package:dribbbletravelui/screens/second_screen.dart';
import 'package:flutter/material.dart';

class DestinationCarousel extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
                  margin: EdgeInsets.only(left: 20.0),
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: destinations.length,
                    itemBuilder: (BuildContext context, int index){
                      Destination destination = destinations[index];
                      return GestureDetector(
                        onTap: () => Navigator.push(context, MaterialPageRoute(builder: (_) => SecondScreen(destination: destination))),
                          child: Stack(
                          children: <Widget>[
                            Container(
                              padding: EdgeInsets.only(right: 20.0),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(30.0),
                                child: Image(
                                  height: 200.0,
                                  width: 300.0,
                                  image: AssetImage(destination.imageUrl),
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                            Positioned(
                              bottom: 18.0,
                              left: 18.0,
                              child: Text(
                                destination.name,
                                style: TextStyle(
                                  fontSize: 22.0,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white
                                ),
                                ),
                            ),
                            Positioned(
                              right: 40.0,
                              top: 15.0,
                              child: Container(
                                height: 30.0,
                                width: 60.0,
                                decoration: BoxDecoration(
                                  color: Colors.black26,
                                  borderRadius: BorderRadius.circular(10.0)
                                ),
                                child: Center(
                                  child: Text(
                                    '4.5 *',
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 16.0,
                                      color: Colors.white
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ]
                        ),
                      );
                    }
                    ),
                  height: 200.0,
                  width: double.infinity,
                );
  }
}
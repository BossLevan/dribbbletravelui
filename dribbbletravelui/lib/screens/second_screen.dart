import 'package:dribbbletravelui/models/destination_model.dart';
import 'package:flutter/material.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

class SecondScreen extends StatelessWidget {
  final Destination destination;
  SecondScreen({this.destination});
  double convertRating(int index){
      return stats[index].rating/ 10.0 * 1.0;
  }
  Widget _buildRatingContainer(int index){
   return Column(
     children: <Widget>[
       CircularPercentIndicator(
          radius: 70.0,
          progressColor: Colors.blue,
          percent: convertRating(index),
          lineWidth: 8.0,
          circularStrokeCap: CircularStrokeCap.round,
          center: Text(
            (stats[index].rating).toString(),
            style: TextStyle(
              fontSize: 20.0,
              fontWeight: FontWeight.w600,
            ),
            ),
        ),
        Text(
          stats[index].description,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.grey,
          ),
          )
     ],
   );
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(  
      backgroundColor: Colors.white,
      body: Stack(
          children: <Widget> [
            ListView(
          children: <Widget>[
            Stack(
              children: <Widget>[
                Container(
                  width: MediaQuery.of(context).size.width,
                  height: 250.0,
                  child: Image(
                    fit: BoxFit.cover,
                    image: AssetImage(destination.imageUrl),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      IconButton(
                        icon: Icon(
                          Icons.arrow_back,
                          size: 30.0,
                          color: Colors.white,
                          ),
                        onPressed: () => Navigator.pop(context),  
                      ),
                      IconButton(
                        icon: Icon(
                          Icons.cloud_upload,
                          size: 30.0,
                          color: Colors.white,
                          ),
                        onPressed: (){},
                      )
                    ],
                  ),
                ),
                Positioned(
                  bottom: 20.0,
                  left: 30.0,
                    child: Text(
                    destination.name,
                    style: TextStyle(
                      fontSize: 40.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.white
                    ),),
                )
              ],
            ),
            SizedBox(height: 20.0,),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 30.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    'Description',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 24.0,
                      fontWeight: FontWeight.bold
                    ),
                  ),
                  SizedBox(height: 10.0,),
                  Text(
                    destination.description,
                    softWrap: true,
                    style: TextStyle(
                      fontSize: 15.0,
                      fontWeight: FontWeight.w800,
                      color: Colors.grey,
                      letterSpacing: 1.0,
                    )
                  ),
                  SizedBox(height: 20.0,),
                  Text(
                    'Stats',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 24.0,
                      fontWeight: FontWeight.bold
                    ),
                  ),
                  SizedBox(height: 20.0,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: 
                     stats.asMap().entries.map((MapEntry map) => ((_buildRatingContainer(map.key)))).toList(),
                    ),
                    SizedBox(height: 20.0,),
                  Text(
                  'Popular Hotels',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 24.0,
                    fontWeight: FontWeight.bold
                  ),
                ),
                SizedBox(height: 20.0,),
                ],
              ),
            ),
            Container(
              height: 200.0,
              padding: EdgeInsets.only(left:20.0),
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: destinations.length,
                    itemBuilder: (BuildContext context, int index){
                      return Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10.0),
                        child: ClipRRect(
                          borderRadius: BorderRadius.all(Radius.circular(30.0)),
                            child: Image(
                            image: AssetImage(destination.imageUrl),
                            fit: BoxFit.fill,
                            width: 250.0,
                          ),
                        ),
                      );
                    }),
                ),
          ],
        ),
        Positioned(
          bottom: 0.0,
          child: Container(
            height: 70.0,
            width: MediaQuery.of(context).size.width,
            color: Colors.white,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 20.0),
                  padding: EdgeInsets.fromLTRB(24.0, 12.0, 24.0, 12.0),
                  decoration: BoxDecoration(
                    color: Colors.grey[200],
                    borderRadius: BorderRadius.all(Radius.circular(15.0))
                  ),
                  child: Icon(
                    Icons.bookmark,
                    color: Colors.grey[700],
                    ),
                ),
                Expanded(
                child: Container(
                  margin: EdgeInsets.only(right: 20.0),
                  padding: EdgeInsets.symmetric(vertical: 16.0),
                   decoration: BoxDecoration(
                      color: Colors.blue,
                       borderRadius: BorderRadius.all(Radius.circular(15.0))
                   ),
                    child: Text(
                      'Book Now',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 14.0,
                        fontWeight: FontWeight.bold,
                        color: Colors.white
                      ),
                      ),
                  ),
                )
              ],
            ),
          ),
        ),
      ]
      ),
    );
  }
}
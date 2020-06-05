import 'package:dribbbletravelui/models/destination_model.dart';
import 'package:dribbbletravelui/models/explore_model.dart';
import 'package:dribbbletravelui/widgets/destination_carousel.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class HomePage extends StatefulWidget {
  final List<String>iconSubText = [
    'Flight',
    'Hotels',
    'Cars',
    'Train',
  ];
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
   int selectedValue = 0;
  List<String>texts = ['Solo Trips', 'Family Trips'];
    var selectedIndex = 0;
    var index;
    Widget _buildButton(int index){
    return GestureDetector(
      onTap: (){
        setState(() {
          selectedIndex = index;
        });
      },
          child: Container(
            height: 50.0,
             width: 170.0,     
              decoration: BoxDecoration(
                color: selectedIndex == index ? Colors.blue : Colors.transparent,
                borderRadius: BorderRadius.circular(25.0),
              ),
            child: Center(
              child: Text(
                  texts[index],
                  style: TextStyle(
               fontWeight: FontWeight.bold,
               fontSize: 18.0,
               color: selectedIndex == index ? Colors.white : Colors.black,
                  ),
                ),
            ),
          ),
      );
  }
  
  List<Icon>icons = [
      Icon(
      FontAwesomeIcons.car,
      color: Colors.purple,
      size: 35.0,
      ),
      Icon(
        FontAwesomeIcons.bed,
        color: Colors.red,
        size: 35.0,
        ),
      Icon(
        FontAwesomeIcons.fly,
        color: Colors.blue,
        size: 35.0,
      ),
      Icon(
        FontAwesomeIcons.train,
        color: Colors.grey,
        size: 35.0,
        ),
  ];
  
  Widget _buildIcon(index){   
    
    return Column(
      children: <Widget>[
        
           Container(
            height: 70.0,
            width: 70.0,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10.0),
              color: Colors.grey[200]
            ),
            child: icons[index],
          ),
        
        SizedBox(height: 10.0,),
        Text(
          widget.iconSubText[index],
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 18.0
          ),
          )
      ],
    );
  }

  Widget _buildContainer(int index){
    
    Widget _buildStars(double rating){
      String stars = '';
    for(int i = 0; i < exploreDestinations[index].rating; i++){
        stars+= '*';
    }
    return Text(
      stars,
      style: TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: 40.0,
        color: Colors.yellow,
      ),
      );
  }
    return Container(
      margin: EdgeInsets.only(bottom: 20.0),
      height: 140.0,
      width: 360.0,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20.0),
        color: Colors.grey[200],
      ),
      child: Row(
        children: <Widget>[
          Container(
            height: 140.0,
            width: 130.0,
            child: ClipRRect(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20.0),
                bottomLeft: Radius.circular(20.0),
                ),
                child: Image(            
                image: AssetImage(exploreDestinations[index].imageUrl),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Container(
            padding: EdgeInsets.all(10.0),
            width: 230.0,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  exploreDestinations[index].name,
                  style: TextStyle(
                    fontSize: 18.0,
                    fontWeight: FontWeight.bold
                  ),
                ),
                _buildStars(exploreDestinations[index].rating),
                SizedBox.shrink(),
                Text(
                  exploreDestinations[index].description,
                  softWrap: true,
                  )
              ],
            ),
          )
        ]
      ),      
    );
  }

  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      backgroundColor: Colors.white,
      body: ListView(
          children: <Widget>[
           Padding(
             padding: const EdgeInsets.all(20.0),
             child: Text(
                'Plan a trip',
                style: TextStyle(
                  fontSize: 36.0,
                  fontWeight: FontWeight.bold
                ),
              ),
            ),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 10.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children:
                    icons.asMap().entries.map((MapEntry map) => ((_buildIcon(map.key)))).toList(),
                  ),
                ),
                SizedBox(height: 50.0),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: Text(
                    'Top Destinations',
                    style: TextStyle(
                      fontSize: 25.0,
                      fontWeight: FontWeight.bold
                    ),
                  ),
                ),
                SizedBox(height: 20.0,),
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 20.0),
                  height: 50.0,
                  width: 360.0,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(25.0),
                    color: Colors.grey[200],
                  ),
                  child: Container(
                  height: 50.0,
                  width: 360.0,     
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(25.0),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: 
                     texts.asMap().entries.map((MapEntry map) => (_buildButton(map.key))).toList(),
                  ),
                ),
                ),
                SizedBox(height: 30.0,),
                DestinationCarousel(),
                SizedBox(height: 40.0,),
                Padding(
                  padding: const EdgeInsets.only(left: 20.0),
                  child: Text(
                    'Explore More',
                    style: TextStyle(
                      fontSize: 25.0,
                      fontWeight: FontWeight.bold
                    ),
                  ),
                ),
                SizedBox(height: 20.0,),
                Column(
                  children:
                    exploreDestinations.asMap().entries.map((MapEntry map) => (_buildContainer(map.key))).toList()
                ),
              ],
            ),
          bottomNavigationBar: BottomNavigationBar(
           //type: BottomNavigationBarType.fixed,
            onTap: (int value){
              setState(() {
                selectedValue = value;
              });
            },
            currentIndex: selectedValue,
            elevation: 0.0,
            items:[
              BottomNavigationBarItem(
              icon: Icon(
                Icons.home,
                size: 30.0,
                color: Colors.blue
                ),
              title: SizedBox.shrink()
            ),
             BottomNavigationBarItem(
              icon: Icon(
                FontAwesomeIcons.search,
                size: 25.0,
                color: Colors.grey,
                ),
              title: Text(''),
            ),
             BottomNavigationBarItem(
              icon: Icon(
                Icons.favorite,
                size: 30.0,
                color: Colors.grey,
                ),
              title: Text(''),
            ),
             BottomNavigationBarItem(
              icon: Icon(
                Icons.settings,
                size: 30.0,
                color: Colors.grey,
              ),
              title: Text(''),
            ),
            ]),
        );
     
   }
}
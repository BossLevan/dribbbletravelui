import 'package:dribbbletravelui/models/stats.dart';

class Destination{
  String name;
  double rating;
  String description;
  String imageUrl;
  List<Stats> stats;

  Destination({
    this.description,
    this.name,
    this.rating,
    this.stats,
    this.imageUrl
  });

}
List <Stats> stats = [
  Stats(
    description: 'Foodies',
    rating: 9.4
  ),
  Stats(
    description: 'Wellness',
    rating: 6.5
  ),
  Stats(
    description: 'Outdoorsy',
    rating: 9.6
  ),
  Stats(
    description: 'Adventure',
    rating: 7.9
  ),
 ];

 List<Destination> destinations = [
   Destination(
     imageUrl: 'lib/images/murano.jpg',
     description: 'The origin of the word "travel" is most likely lost to history. The term may originate from the old French word "travial, which means work. According to Merriam Webster Dictionary is century. It also states that... MORE',
     name: 'Manhattan, USA',
     rating: 4.5,
     stats: stats,
   ),
   Destination(
     imageUrl: 'lib/images/saopaulo.jpg',
     description: 'The origin of the word "travel" is most likely lost to history. The term may originate from the old French word "travial, which means work. According to Merriam Webster Dictionary is century. It also states that... MORE',
     name: 'Lagos, NG',
     rating: 5.0,
     stats: stats,
   ),
   Destination(
     imageUrl: 'lib/images/venice.jpg',
     description: 'The origin of the word "travel" is most likely lost to history. The term may originate from the old French word "travial, which means work. According to Merriam Webster Dictionary is century. It also states that... MORE',
     name: 'Amsterdam, NL',
     rating: 4.1,
     stats: stats,
   ),
   Destination(
     imageUrl: 'lib/images/paris.jpg',
     description: 'The origin of the word "travel" is most likely lost to history. The term may originate from the old French word "travial, which means work. According to Merriam Webster Dictionary is century. It also states that... MORE',
     name: 'Toulouse, FR',
     rating: 3.9,
     stats: stats,
   ),
 ];

 
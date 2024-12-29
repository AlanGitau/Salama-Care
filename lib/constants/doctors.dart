import 'package:flutter/material.dart';
/*class Doctors {
  final String name;
  final String  speciality;
  final String imageUrl;


Doctors({
  required this.name,
  required this.speciality,
  required this.imageUrl,
});

}*/



class Doctorcard extends StatelessWidget {
  final String name;
  final String  speciality;
  final String imageUrl;

  const Doctorcard({super.key,
  required this.name,
  required this.speciality,
  required this.imageUrl,

  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        height: 100,
        padding: const EdgeInsets.all(15),
        decoration: BoxDecoration(
          color: Colors.deepPurple[100],
          borderRadius: BorderRadius.circular(10),
        ),
        //color: Colors.deepPurple,
         child: Column(
           children: [
             //picture
             ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: Image.asset(imageUrl,height: 90,)),
             //rating
             const Row(
               children: [
                 Icon(Icons.star,
                 color: Colors.yellow,
                 ),
                 Text('4.9'),
               ],
             ),
             //name
              Text(name),
             //speciality
             Text(speciality),
           ],
         )
            
      ),
    );
  }
}
import 'package:flutter/material.dart';
import 'constants/categories.dart';
//import 'constants/categories.dart';



class Homepage extends StatelessWidget {
  const Homepage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child:Column(
          children: [
             const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Hello',
                    style: TextStyle(
                      fontSize: 19,
                      fontWeight: FontWeight.bold,
                    ),
                    ),
                    Text('Welcome back',
                    style:TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                    ),
                  ],
                ),
               //adding the profile icon
                Icon(Icons.person_2),
              ],
            ),

            //search bar
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.grey,
                  borderRadius: BorderRadius.circular(25),
                ),
                child:  const TextField(
                 decoration: InputDecoration(
                  prefixIcon: Icon(Icons.search),
                  hintText: 'Search',
                  border:InputBorder.none,
                  
                 ),
                ),
              ),
            ),

            const Text('Our services',style: TextStyle(
              fontSize: 18,
            ),),
            const SizedBox(height: 5,),

            //horizontal listview
            Container(
              height: 80,
              //color: Colors.black,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: const [
                     CategoryCard(
                      categoryName: 'general',
                      iconImage: 'assets/Icons/health.png',
                     ),

                      CategoryCard(
                      categoryName: 'Dentist',
                      iconImage: 'assets/Icons/dental-care.png',
                     ),

                      CategoryCard(
                      categoryName: 'Dermatologist',
                      iconImage: 'assets/Icons/dermatology.png',
                     ),




                ],
              ),

            )
          ],
        ) 
        ),
    );
  }
}
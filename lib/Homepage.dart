import 'package:flutter/material.dart';
import 'package:signup/constants/doctors.dart';
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
                Padding(
                  padding: EdgeInsets.all(9.0),
                  child: Column(
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
                  color: Colors.grey[300],
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
            SizedBox(
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

                      CategoryCard(
                      categoryName: 'Diabetes testing',
                      iconImage: 'assets/Icons/blood-test.png',
                     ),

                      CategoryCard(
                      categoryName: 'psychiatry',
                      iconImage: 'assets/Icons/brain.png',
                     ),

                     CategoryCard(
                      categoryName: 'X-ray',
                      iconImage: 'assets/Icons/x-ray.png',
                     ),

                     CategoryCard(
                      categoryName: 'ultrasound',
                      iconImage: 'assets/Icons/ultrasound.png',
                     ),

                     CategoryCard(
                      categoryName: 'Mother child care',
                      iconImage: 'assets/Icons/baby.png',
                     ),


                     CategoryCard(
                      categoryName: 'Nutrition ',
                      iconImage: 'assets/Icons/nutrition.png',
                     ),

                     CategoryCard(
                      categoryName: 'HIV Testing ',
                      iconImage: 'assets/Icons/red-ribbon.png',
                     ),


                     CategoryCard(
                      categoryName: 'orthopedic care',
                      iconImage: 'assets/Icons/broken-arm.png',
                     ),






                ],
              ),
            ),
            const SizedBox(height: 15,),
            const Text('Top doctors', style: TextStyle(
              fontSize: 18,
            ),),

        

           Expanded(
             child: ListView(
               scrollDirection:Axis.horizontal,
               children: const [
                 Doctorcard(
                   imageUrl: 'assets/images/smiling doctor.jpg',
                   name: 'Dr. Kevin Maina',
                   speciality: 'Dentist',
                 ),
             
                 Doctorcard(
                   imageUrl: 'assets/images/devine doctor.jpg',
                   name: 'Dr. faith wanjiru',
                   speciality: 'Dermatologist',
                 ),
             
                 Doctorcard(
                   imageUrl: 'assets/images/doctor3.jpg',
                   name: 'Dr. faith wanjiru',
                   speciality: 'General doctor',
                 ),
             
                  Doctorcard(
                   imageUrl: 'assets/images/doctor4.jpg',
                   name: 'Dr. faith wanjiru',
                   speciality: 'Nutritionist',
                 ),
             
                  Doctorcard(
                   imageUrl: 'assets/images/doctor5.jpg',
                   name: 'Dr. faith wanjiru',
                   speciality: 'General doctor',
                 ),
             
                 Doctorcard(
                   imageUrl: 'assets/images/doctor6.jpg',
                   name: 'Dr. faith wanjiru',
                   speciality: 'General doctor',
                 ),
             
             
             
             
             
               ]
               
             ),
           ) 
          ]
        ),
      )
    );
  }
}
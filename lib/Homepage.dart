import 'package:flutter/material.dart';
import 'package:signup/constants/doctors.dart';
import 'ProfileScreen.dart';
import 'appointmentsScreen.dart';
import 'constants/categories.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:signup/loginScreen.dart';
//import 'constants/categories.dart';

//handle the bottom navigation ba
class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  int _selectedIndex = 0;

  
  final List<Widget> pages = const [
    HomeScreen(), 
    Appointmentsscreen(),
    Profilescreen(),
  ];

  void ontapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: pages[_selectedIndex], // Dynamically display the selected screen
      ),
      bottomNavigationBar: GNav(
        selectedIndex: _selectedIndex,
        onTabChange: ontapped, // Correctly pass the function reference
        tabBorderRadius: 25,
        gap: 10,
        tabBackgroundColor: Colors.purple.shade100.withOpacity(0.5),
        tabs: const [
          GButton(
            icon: Icons.home,
            text: 'Home',
          ),
          GButton(
            icon: Icons.calendar_month,
            text: 'Appointments',
          ),
          GButton(
            icon: Icons.person,
            text: 'Profile',
          ),
        ],
      ),
    );
  }
}



//Home screen

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer:Drawer(
                child: ListView(
                  children: [
                    const DrawerHeader(
                      child: Text('menu')
                      ),
                      const ListTile(
                        leading: Icon(Icons.settings),
                         title: Text('settings')
                      ),
                       const ListTile(
                           leading: Icon(Icons.question_mark_rounded),
                           title: Text('FAQ'),
                       ),
//log out button
                     ListTile(
                           leading: const Icon(Icons.logout),
                           title: const Text('log out',
                                  style: TextStyle(color: Colors.red),
                              ),
                           onTap: () {
                             Navigator.pushReplacement(
                              context,
                               MaterialPageRoute(builder: (context) => const Loginscreen()),
                              );
                           },
                          )
                  ],
                ),
               ),
      body: SafeArea(
        child:Column(
          children: [
             Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Padding(
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

                Builder(
                  builder: (context) {
                    return GestureDetector(
                      onTap: (){
                         Scaffold.of(context).openDrawer();
                      },
                      child: const Icon(Icons.person_2)
                      );
                  }
                ),


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
           ), 

           //bottom navigation bar
                 
          ]
        ),
      )
    );
  }
}
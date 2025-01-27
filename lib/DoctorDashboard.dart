import 'package:flutter/material.dart';
import 'package:signup/loginScreen.dart';

class DoctorDashboard extends StatelessWidget {
  const DoctorDashboard({super.key});

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
                      onTap: () {
                        Scaffold.of(context).openDrawer();
                      },
                      child: const Icon(Icons.person_2)
                      );
                  }
                ),
              ],
            ),
                // statistics section
             const Text('statistics',style: TextStyle(
              fontSize: 18,
            ),),

                // upcoming appointments
              const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text('Upcoming appointments',style: TextStyle(
                  fontSize: 18,
                  ),),

                  Text('view all',style:TextStyle(color: Colors.blue)),
                ],
              ),
            
          ],
        ),
        ),
    );
  }
}
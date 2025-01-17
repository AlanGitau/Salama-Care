import 'package:flutter/material.dart';

class DoctorDashboard extends StatelessWidget {
  const DoctorDashboard({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
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
                // statistics section
             const Text('statistics',style: TextStyle(
              fontSize: 18,
            ),),

                // upcoming appointments
              Row(
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
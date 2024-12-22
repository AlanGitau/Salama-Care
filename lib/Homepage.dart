import 'package:flutter/material.dart';

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
                      fontSize: 16,
                    ),
                    ),
                    Text('Welcome back',
                    style:TextStyle(
                      fontSize: 20,
                    ),
                    ),
                  ],
                ),
               //adding the profile icon
                Icon(Icons.person_2),
              ],
            ),
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
            )
          ],
        ) 
        ),
    );
  }
}
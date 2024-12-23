import 'package:flutter/material.dart';

class CategoryCard extends StatelessWidget {
  final String iconImage;
  final String categoryName;
   
  const CategoryCard({super.key, required this.iconImage, required this.categoryName});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20.0),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.deepPurple[100],
          borderRadius: BorderRadius.circular(18)
        ),
        padding: const EdgeInsets.all(25),
        child: Row(
          children: [
            Image.asset(iconImage,height: 30,),
            const SizedBox(width:5,),
            Text(categoryName),
            
          ],
          
        ),
      ),
    );
  }
}
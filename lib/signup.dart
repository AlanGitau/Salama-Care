import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

class Signup extends StatelessWidget {
  const Signup({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        title: const Text('hello'),
      ),
      body: Column(
        children:[ 
          Center(
          child: SvgPicture.asset('assets/images/undraw_doctor_kw-5-l.svg',
          height: 160,
          width:160 ,
          ),
          ),
          const SizedBox(height: 30,),

          Text('Salama care',
          style: GoogleFonts.pacifico(
            textStyle: const TextStyle(
              fontSize: 40,
            )
          ),
          ),

          const SizedBox(height: 10,),

          Text('Welcome to Salama Care, your partner in health',
          style: GoogleFonts.poppins(
            textStyle: const TextStyle(
              fontSize: 20,
            )
          ),
          ),

          const SizedBox(height: 10,),

          Text('Book appointments with top specialists, Get reminders for upcoming visits and Access your medical records anytime',
          style: GoogleFonts.poppins(
            textStyle: const TextStyle(
              fontSize: 15,
            )
          ),
          ),
          

          const SizedBox(height: 20,),

        ElevatedButton(onPressed:(){}, 
          style:ElevatedButton.styleFrom(
            elevation: 5,
          ),
          child: const Text('Get started'),
          
          )
        ]
      ),
      
    );
  }
}
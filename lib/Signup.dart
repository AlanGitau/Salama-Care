import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:signup/loginScreen.dart';

class Signup extends StatelessWidget {
  const Signup({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SvgPicture.asset('assets/images/sign-up.svg',
          height: 200,
          width: 200,
          ),

          const Text('create your free account',
          style: TextStyle(
            fontSize: 30,
            fontWeight: FontWeight.bold,
          ),
          ),

          const SizedBox(height: 10,),

          TextField(
                    decoration: InputDecoration(
                      border:OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5),
                      ) ,
                      prefixIcon: const Icon(Icons.person),
                      labelText: 'username',
                      //errorText: 'This filed cannot be empty',
                    ),
                ),

                const SizedBox(height:15,),

                TextField(
                    decoration: InputDecoration(
                      border:OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5),
                      ) ,
                      prefixIcon: const Icon(Icons.email),
                      labelText: 'Email',
                      //errorText: 'This filed cannot be empty',
                    ),
                ),

                const SizedBox(height:15,),

                TextField(
                    obscureText: true,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius:BorderRadius.circular(10), 
                      ),
                      prefixIcon: const Icon(Icons.password),
                      labelText: 'password',
                    ),
                ),

                const SizedBox(height:15,),

          ElevatedButton(onPressed: (){},//handles the sign up process 
           child:const Text('sign up')
           ),

          Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text('Already have an account?'),

                    TextButton(onPressed:(){
                      Navigator.pop(context, 
                      MaterialPageRoute(builder:(context)=>const Loginscreen()));//navigates back to the login page
                    }, 
                    child:const Text('Login',
                    style: TextStyle(
                      color: Colors.blue
                    ),
                    ),
                    
                    ),
                  ],
                ),
        ],
      ),
    );
  }
}
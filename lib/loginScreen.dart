import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:signup/Homepage.dart';
import 'package:signup/signup.dart';
// if it's directly in the 'lib' directory


class Loginscreen extends StatelessWidget {
  const Loginscreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SvgPicture.asset('assets/images/authenticaton.svg',
              height:220,
              width: 220,
              ),
              const Text('Welcome back',
              style: TextStyle(
                fontSize: 40,
                fontWeight: FontWeight.bold,
              ),
              ),

              const SizedBox(height:2,),

              const Text('Enter your credetials to login',
              style: TextStyle(

              ),
              ),

              const SizedBox(height: 10,),

                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextField(
                      decoration: InputDecoration(
                        border:OutlineInputBorder(
                          borderRadius: BorderRadius.circular(25),
                        ) ,
                        prefixIcon: const Icon(Icons.person),
                        labelText: 'username',
                        //errorText: 'This filed cannot be empty',
                      ),
                  ),
                ),

                const SizedBox(height: 10,),

                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextField(
                      obscureText: true,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius:BorderRadius.circular(25), 
                        ),
                        prefixIcon: const Icon(Icons.password),
                        labelText: 'password',
                        //errorText: 'This filed cannot be empty',
                      ),
                  ),
                ),

                const SizedBox(height: 15,),

                ElevatedButton(
                  onPressed: (){
                     Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context)=>const Homepage())
                     );
                  }, 
                  child:const Text('Login')
                  ),

                const SizedBox(height: 20,),

                TextButton(onPressed:(){}, 
                child:const Text('Forgot Password?',
                style: TextStyle(
                  color: Colors.blue
                ),
                ),
                ),

                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text('Don\'t have an account?'),

                    TextButton(onPressed:(){
                      Navigator.push(context, 
                      MaterialPageRoute(builder:(context)=>const Signup()));//navigates to the sign up page
                    }, 
                    child:const Text('sign up',
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
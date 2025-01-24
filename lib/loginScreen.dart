import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:signup/DoctorDashboard.dart';
import 'package:signup/Homepage.dart';
import 'package:signup/signup.dart';
import 'package:signup/Services/auth_service.dart';


class Loginscreen extends StatefulWidget {
  const Loginscreen({super.key});

  @override
  State<Loginscreen> createState() => _LoginscreenState();
}

class _LoginscreenState extends State<Loginscreen> {

  final _emailcontroller = TextEditingController();
  final _passwordcontroller = TextEditingController();
  final _authservice = AuthService();
   bool _isloading  = false;
  
  Future<void> _handleslogin()async{
    setState(() {
      _isloading = true;
    });

  //Get result from firebase authentication
    final result  = await _authservice.login(
      email: _emailcontroller.text.trim(),
      password: _passwordcontroller.text,
      );

      setState(() {
      _isloading = false;
    });

    if (!mounted) return;

     /*ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Logged in successfully!'),
          backgroundColor: Colors.green,
        ),
      ); */

    if (result == 'Success') {  // Note: 'Success' with capital S to match AuthService
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Logged in successfully!'),
          backgroundColor: Colors.green,
        ),
      );

      /* Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const DoctorDashboard()),  // Navigate to Homepage
      );
       } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(result ?? 'An error occurred'),
          backgroundColor: Colors.red,
        ),
      );
    }  */


    //fetch users id from firestore
    final userid = FirebaseAuth.instance.currentUser?.uid;

    if (userid != null){
      //fetch users role
      final userDoc = await FirebaseFirestore.instance.collection('users').doc(userid).get();

      if(userDoc.exists){
        final userRole = userDoc['role'];

        //navigate to appropriate screen
        if (userRole == 'patient'){
          Navigator.pushReplacement(
            context, 
            MaterialPageRoute(builder:(context)=> const Homepage()),
            );
        }else if (userRole == 'doctor'){
          Navigator.pushReplacement(
            context, 
            MaterialPageRoute(builder:(context)=> const DoctorDashboard()),
            );
        } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(result ?? 'An error occurred'),
          backgroundColor: Colors.red,
        ),
      );
    }  

        }
        
      }
    }
    print('User UID: ${FirebaseAuth.instance.currentUser?.uid}');
  }
  

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
                    controller: _emailcontroller,
                    keyboardType: TextInputType.emailAddress,
                      decoration: InputDecoration(
                        border:OutlineInputBorder(
                          borderRadius: BorderRadius.circular(25),
                        ) ,
                        prefixIcon: const Icon(Icons.mail),
                        labelText: 'Email',
                      ),
                  ),
                ),

                const SizedBox(height: 10,),

                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextField(
                    controller: _passwordcontroller,
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
//login button
               _isloading 
          ? const CircularProgressIndicator()
          : ElevatedButton(
              onPressed: _handleslogin,
              child: const Text('Login')
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
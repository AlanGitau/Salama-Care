import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:signup/Services/auth_service.dart';
import 'package:signup/loginScreen.dart';

class Signup extends StatefulWidget {
  const Signup({super.key});

  @override
  State<Signup> createState() => _SignupState();
}

class _SignupState extends State<Signup> {

  final _usernamecontroller = TextEditingController();
  final _emailcontroller = TextEditingController();
  final _passwordcontroller = TextEditingController();
  final _authservice = AuthService();
   bool _isloading = false ;

  Future<void> _handlesignup()async{
    setState(() {
      _isloading = true;
    });
//Get result from firebase authentication
    final result  = await _authservice.registration(
      email: _emailcontroller.text.trim(),
      password: _passwordcontroller.text,
      );

      setState(() {
        _isloading= false;
      });

      if (!mounted) return ;

      if (result == 'success'){
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content:Text('Account created successfully!'),
            backgroundColor: Colors.lightGreen,
          ));

      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder:(context)=> const Loginscreen()),
        );

      }else{
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar( 
            content: Text(result ?? 'An error occurred'),
            backgroundColor: Colors.red,
          ));
      }
        
      }
  


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
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
        
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: TextField(
                controller: _usernamecontroller,
                decoration: InputDecoration(
                  border:OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                      ) ,
                      prefixIcon: const Icon(Icons.person),
                      labelText: 'username',
                        ),
                    ),
            ),
        
                  const SizedBox(height:5,),
        
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: TextField(
                      controller: _emailcontroller,
                      keyboardType: TextInputType.emailAddress,
                        decoration: InputDecoration(
                          border:OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15),
                          ) ,
                          prefixIcon: const Icon(Icons.email),
                          labelText: 'Email',
                        ),
                    ),
                  ),
        
                  const SizedBox(height:5,),
        
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: TextField(
                      controller: _passwordcontroller,
                      obscureText: true,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius:BorderRadius.circular(15), 
                          ),
                          prefixIcon: const Icon(Icons.password),
                          labelText: 'password',
                        ),
                    ),
                  ),
        
                  const SizedBox(height:5,),

            _isloading
            ? const CircularProgressIndicator() 
            : ElevatedButton(onPressed: _handlesignup, 
            child: const Text('sign up'),
            ),    
        
            /*ElevatedButton(onPressed: (){},//handles the sign up process 
             child:const Text('sign up')
             ),*/
        
            Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text('Already have an account?',style: TextStyle(
                        fontSize: 15,
                      ),),
        
                      TextButton(onPressed:(){
                        Navigator.pop(context, 
                        MaterialPageRoute(builder:(context)=>const Loginscreen()));//navigates back to the login page
                      }, 
                      child:const Text('Login',
                      style: TextStyle(
                        color: Colors.blue,
                        fontSize: 15,
        
                      ),
                      ),
                      
                      ),
                    ],
                  ),
          ],
        ),
      ),
    );
  }
}
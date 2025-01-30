import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
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
  String? _selectedRole;
  final List<String> roles = ['patient', 'doctor'];
  
  // Additional controllers for doctor details
  final _specializationController = TextEditingController();
  final _experienceController = TextEditingController();
  final _usernamecontroller = TextEditingController();
  final _emailcontroller = TextEditingController();
  final _passwordcontroller = TextEditingController();
  final _authservice = AuthService();
  bool _isloading = false;

  Future<void> _handlesignup() async {
    if (_selectedRole == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Please select a role!'),
          backgroundColor: Colors.red,
        ),
      );
      return;
    }

    // Validate doctor-specific fields
    if (_selectedRole == 'doctor') {
      if (_specializationController.text.isEmpty || 
          _experienceController.text.isEmpty) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Please fill all doctor details!'),
            backgroundColor: Colors.red,
          ),
        );
        return;
      }
    }

    setState(() {
      _isloading = true;
    });

    try {
      final result = await _authservice.registration(
        email: _emailcontroller.text.trim(),
        password: _passwordcontroller.text,
      );

      if (result == 'Success') {
        final user = FirebaseAuth.instance.currentUser;
        if (user != null) {
          // Create base user data
          final userData = {
            'email': _emailcontroller.text.trim(),
            'username': _usernamecontroller.text.trim(),
            'role': _selectedRole,
          };

          // Add doctor-specific fields if role is doctor
          if (_selectedRole == 'doctor') {
            userData.addAll({
              'specialization': _specializationController.text.trim(),
              'experience': _experienceController.text.trim(),
              //'isAvailable': true, // Default availability status
              //'rating': 0.0, // Initial rating
             // 'totalRatings': 0, // Number of ratings received
            });
          }

          // Save user data in Firestore
          await FirebaseFirestore.instance
              .collection('users')
              .doc(user.uid)
              .set(userData);

          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('Account created successfully!'),
              backgroundColor: Colors.lightGreen,
            ),
          );

          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => const Loginscreen()),
          );
        }
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(result ?? 'An error occurred'),
            backgroundColor: Colors.red,
          ),
        );
      }
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Error: $e'),
          backgroundColor: Colors.red,
        ),
      );
    } finally {
      setState(() {
        _isloading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset(
              'assets/images/sign-up.svg',
              height: 200,
              width: 200,
            ),
            const Text(
              'Create your free account',
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 10),

            // Roles dropdown (your existing code)
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: DropdownButtonFormField<String>(
                value: _selectedRole,
                items: roles
                    .map((role) => DropdownMenuItem(
                          value: role,
                          child: Text(role),
                        ))
                    .toList(),
                onChanged: (value) => setState(() => _selectedRole = value),
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                  labelText: 'Role',
                  prefixIcon: const Icon(Icons.person_outline),
                  contentPadding:
                      const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                  isDense: true,
                ),
                style: const TextStyle(color: Colors.black, fontSize: 16),
                dropdownColor: Colors.white,
                isExpanded: true,
              ),
            ),

            // Basic fields
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: TextField(
                controller: _usernamecontroller,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                  prefixIcon: const Icon(Icons.person),
                  labelText: 'Username',
                ),
              ),
            ),

            Padding(
              padding: const EdgeInsets.all(10.0),
              child: TextField(
                controller: _emailcontroller,
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                  prefixIcon: const Icon(Icons.email),
                  labelText: 'Email',
                ),
              ),
            ),

            Padding(
              padding: const EdgeInsets.all(10.0),
              child: TextField(
                controller: _passwordcontroller,
                obscureText: true,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                  prefixIcon: const Icon(Icons.password),
                  labelText: 'Password',
                ),
              ),
            ),

            // Doctor-specific fields
            if (_selectedRole == 'doctor') ...[
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: TextField(
                  controller: _specializationController,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                    prefixIcon: const Icon(Icons.medical_services),
                    labelText: 'Specialization',
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: TextField(
                  controller: _experienceController,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                    prefixIcon: const Icon(Icons.work),
                    labelText: 'Years of Experience',
                    hintText: 'e.g., 5',
                  ),
                  keyboardType: TextInputType.number,
                ),
              ),
            ],

            // Signup Button
            _isloading
                ? const CircularProgressIndicator()
                : ElevatedButton(
                    onPressed: _handlesignup,
                    child: const Text('Sign Up'),
                  ),

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  'Already have an account?',
                  style: TextStyle(fontSize: 15),
                ),
                TextButton(
                  onPressed: () {
                    Navigator.pop(
                      context,
                      MaterialPageRoute(builder: (context) => const Loginscreen()),
                    );
                  },
                  child: const Text(
                    'Login',
                    style: TextStyle(color: Colors.blue, fontSize: 15),
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
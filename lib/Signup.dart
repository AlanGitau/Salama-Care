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

    setState(() {
      _isloading = true;
    });

    try {
      // Perform registration
      final result = await _authservice.registration(
        email: _emailcontroller.text.trim(),
        password: _passwordcontroller.text,
      );

      if (result == 'Success') {
        final user = FirebaseAuth.instance.currentUser;
        if (user != null) {
          // Save user data in Firestore
          await FirebaseFirestore.instance.collection('users').doc(user.uid).set({
            'email': _emailcontroller.text.trim(),
            'username': _usernamecontroller.text.trim(),
            'role': _selectedRole,
          });

          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('Account created successfully!'),
              backgroundColor: Colors.lightGreen,
            ),
          );

          // Navigate to login screen
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => const Loginscreen()),
          );
        } else {
          throw Exception('Failed to retrieve user ID.');
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

            // Roles
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
            const SizedBox(height: 5),

            // Username
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
            const SizedBox(height: 5),

            // Email
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
            const SizedBox(height: 5),

            // Password
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
            const SizedBox(height: 5),

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

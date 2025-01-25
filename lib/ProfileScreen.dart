import 'package:flutter/material.dart';

class Profilescreen extends StatelessWidget {
  const Profilescreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Column(
        children: [
          ListTile(
            leading: Icon(Icons.settings),
            title: Text('settings'),
          ),

          ListTile(
            leading: Icon(Icons.question_mark_rounded),
            title: Text('FAQ'),
          ),

          ListTile(
            leading: Icon(Icons.logout),
            title: Text('log out',
            style: TextStyle(color: Colors.red),
            ),
          )
        ],
      )
    );
  }
}
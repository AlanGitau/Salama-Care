import 'package:flutter/material.dart';
import 'package:signup/BookAppointmentPage.dart';

//import 'BookAppointmentPage.dart';

class Appointmentsscreen extends StatelessWidget {
  const Appointmentsscreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,//number of tabs
      child: Scaffold(
        appBar: AppBar(
         title: const Text('Appointments'),
         leading: IconButton(
          onPressed:(){
            Navigator.pop(context);
          }, 
          icon: const Icon(Icons.arrow_back)),
         bottom: const TabBar(
          tabs: [
            Tab(text: 'upcoming',),
            Tab(text: 'past',)
          ]
          ),
        ),
      
        body:const TabBarView(
          children: [
            UpcomingAppointments(),
            PastAppointments(),
          ]),

          floatingActionButton: FloatingActionButton(
            onPressed: (){
              //navigates to the booking page
              Navigator.push(
                context,
                 MaterialPageRoute(builder: (context)=> const BookAppointmentPage())
                 );
            },
            tooltip: 'book an appointment',
            child: Icon(Icons.add),
            ),
      ),
    );
  }
}

class UpcomingAppointments extends StatelessWidget {
  const UpcomingAppointments({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('upcoming appointments'),
        ],
      ),
    );
  }
}

class PastAppointments extends StatelessWidget {
  const PastAppointments({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body:Column(
        children: [
          Text('past appointments'),
        ],
      ),
    );
  }
}
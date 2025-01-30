import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
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
            child: const Icon(Icons.add),
            ),
      ),
    );
  }
}

class UpcomingAppointments extends StatefulWidget {
  const UpcomingAppointments({super.key});

  @override
  State<UpcomingAppointments> createState() => _UpcomingAppointmentsState();
}

class _UpcomingAppointmentsState extends State<UpcomingAppointments> {

  final user = FirebaseAuth.instance.currentUser;
  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder(
        stream: FirebaseFirestore.instance
            .collection('appointments')
            .where('userId', isEqualTo: user?.uid)
            .where('appointmentDate', isGreaterThanOrEqualTo: DateTime.now())
            .orderBy('appointmentDate')
            .snapshots(), 
        builder: (context , Snapshot){
          if(Snapshot.hasError){
            return Center(child: Text('Error:${Snapshot.error}'));
          }

          if (Snapshot.connectionState == ConnectionState.waiting){
            return const Center(child: CircularProgressIndicator(),);
          }

          final appointments = Snapshot.data?.docs ?? [];

          if (appointments.isEmpty){
            return const Center(child: Text('No upcoming appointments'),);
          }

           return ListView.builder(
            itemCount: appointments.length,
            itemBuilder: (context, index) {
              final appointment = appointments[index].data();
              return ListTile(
                title: Text(appointment['doctorName'] ?? ''),
                subtitle: Text('${DateFormat('MMM dd, yyyy').format(appointment['appointmentDate'].toDate())}, ${appointment['appointmentTime']}'),
              );
            },
          );



          
        }
        ),
    
    );
  }
}

class PastAppointments extends StatefulWidget {
  const PastAppointments({super.key});

  @override
  State<PastAppointments> createState() => _PastAppointmentsState();
}

class _PastAppointmentsState extends State<PastAppointments> {

  final user = FirebaseAuth.instance.currentUser;
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:StreamBuilder(
        stream: FirebaseFirestore.instance
            .collection('appointments')
            .where('userId', isEqualTo: user?.uid)
            .where('appointmentDate', isLessThan: DateTime.now())
            .orderBy('appointmentDate')
            .snapshots(), 
        builder: (context , Snapshot){
          if(Snapshot.hasError){
            return Center(child: Text('Error:${Snapshot.error}'));
          }

          if (Snapshot.connectionState == ConnectionState.waiting){
            return const Center(child: CircularProgressIndicator(),);
          }

          final appointments = Snapshot.data?.docs ?? [];

          if (appointments.isEmpty){
            return const Center(child: Text('No upcoming appointments'),);
          }

           return ListView.builder(
            itemCount: appointments.length,
            itemBuilder: (context, index) {
              final appointment = appointments[index].data();
              return ListTile(
                title: Text(appointment['doctorName'] ?? ''),
                subtitle: Text('${DateFormat('MMM dd, yyyy').format(appointment['appointmentDate'].toDate())}, ${appointment['appointmentTime']}'),
              );
            },
          );
        }
      ),
      );
  }
  
}
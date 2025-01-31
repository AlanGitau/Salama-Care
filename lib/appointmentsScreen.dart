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

  final user = FirebaseAuth.instance.currentUser;//It retrieves the currently authenticated user from Firebase Authentication and stores details about the authenticated user
  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder(
        //querys the database
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

          final appointments = Snapshot.data?.docs ?? []; //If Snapshot.data is null, appointments will default to an empty list ([]).

          if (appointments.isEmpty){
            return const Center(child: Text('No upcoming appointments'),);
          }

           return ListView.builder(
            itemCount: appointments.length,
            itemBuilder: (context, index) {
              final appointment = appointments[index].data();
              final doctorId = appointment['doctorId'];//The doctorId is retrieved from the appointment map:

              return FutureBuilder<DocumentSnapshot>(
                //The FutureBuilder is used to handle the asynchronous Firestore query.
                //It waits for the get() method to complete and then builds the UI based on the result.

      future: FirebaseFirestore.instance.collection('users').doc(doctorId).get(),//The code queries Firestore to fetch the doctor's details using the doctorId:
      builder: (context, doctorSnapshot) {
        //While the data is being fetched, a loading message is displayed.
        if (doctorSnapshot.connectionState == ConnectionState.waiting) {
          return const ListTile(
            title: Text('Loading doctor info...'),
            subtitle: Text('Fetching details...'),
          );
        }
        //If the document doesn't exist or there's an error, a "Doctor not found" message is displayed.
        if (!doctorSnapshot.hasData || doctorSnapshot.data == null) {
          return const ListTile(
            title: Text('Doctor not found'),
          );
        }
        //If the document is found, its data is extracted as a Map<String, dynamic>.

        final doctorData = doctorSnapshot.data!.data() as Map<String, dynamic>?;

        return ListTile(
          //The doctor's username is accessed from the doctorData map
          title: Text(doctorData?['username'] ?? 'Unknown Doctor'),
          subtitle: Text('${DateFormat('MMM dd, yyyy').format(appointment['appointmentDate'].toDate())}, ${appointment['appointmentTime']}'),
         );
            },
          );



          
        },
        );
    
        },
      ));
    
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
      body: StreamBuilder(
        //querys the database
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

          final appointments = Snapshot.data?.docs ?? []; //If Snapshot.data is null, appointments will default to an empty list ([]).

          if (appointments.isEmpty){
            return const Center(child: Text('No  appointments'),);
          }

           return ListView.builder(
            itemCount: appointments.length,
            itemBuilder: (context, index) {
              final appointment = appointments[index].data();
              final doctorId = appointment['doctorId'];//The doctorId is retrieved from the appointment map:

              return FutureBuilder<DocumentSnapshot>(
                //The FutureBuilder is used to handle the asynchronous Firestore query.
                //It waits for the get() method to complete and then builds the UI based on the result.

      future: FirebaseFirestore.instance.collection('users').doc(doctorId).get(),//The code queries Firestore to fetch the doctor's details using the doctorId:
      builder: (context, doctorSnapshot) {
        //While the data is being fetched, a loading message is displayed.
        if (doctorSnapshot.connectionState == ConnectionState.waiting) {
          return const ListTile(
            title: Text('Loading doctor info...'),
            subtitle: Text('Fetching details...'),
          );
        }
        //If the document doesn't exist or there's an error, a "Doctor not found" message is displayed.
        if (!doctorSnapshot.hasData || doctorSnapshot.data == null) {
          return const ListTile(
            title: Text('Doctor not found'),
          );
        }
        //If the document is found, its data is extracted as a Map<String, dynamic>.

        final doctorData = doctorSnapshot.data!.data() as Map<String, dynamic>?;

        return ListTile(
          //The doctor's username is accessed from the doctorData map
          title: Text(doctorData?['username'] ?? 'Unknown Doctor'),
          subtitle: Text('${DateFormat('MMM dd, yyyy').format(appointment['appointmentDate'].toDate())}, ${appointment['appointmentTime']}'),
         );
            },
          );



          
        },
        );
    
        },
      ));
  }
  
}
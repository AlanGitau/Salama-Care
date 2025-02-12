import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:signup/loginScreen.dart';

class Doctordashboard extends StatefulWidget {
  const Doctordashboard({super.key});

  @override
  State<Doctordashboard> createState() => _DoctordashboardState();
}

class _DoctordashboardState extends State<Doctordashboard> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: Builder(
          builder: (context) {
            return IconButton(onPressed: (){// menu icon
              Scaffold.of(context).openDrawer();
            }, 
            icon: const Icon(Icons.menu,color: Colors.black,));
          }
        ),
        title:  Row(
          children: [
            //searchbar
            Expanded(
              child: TextField(
                decoration: InputDecoration(
                  hintText: 'search',
                  prefixIcon: const Icon(Icons.search),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(35),
                    borderSide: BorderSide.none,
                  ),
                  filled: true,
                  fillColor: Colors.grey[200],
                  contentPadding: const EdgeInsets.symmetric(vertical: 8),
                ),
              )
              ),
              const SizedBox(width: 15,),
              //new appointment button

              ElevatedButton(
                onPressed: (){}, 
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.redAccent,
                  elevation: 2,
                ),
                child: const Text('New appointment',style: TextStyle(color: Colors.white,fontWeight: FontWeight.w500),)
                ),

                const SizedBox(width: 15,),
//circle avatar
                const CircleAvatar(
                   backgroundImage: AssetImage('assets/images/boy.png'),
                   radius: 20,
                ),
          ],
        ),
      ),
      drawer: Drawer(
        elevation: 15,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            topRight: Radius.circular(30),
            bottomRight: Radius.circular(30),
          )
        ),
        backgroundColor: Colors.grey.shade50,
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors:[Colors.blue.shade700,Colors.blue.shade400],
                  begin: Alignment.topLeft,
                  end:Alignment.bottomRight,
                  ),
                  
                ),
              child:Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Image.asset('assets/images/Salamacare logo.png',width: 50,height: 50,),
                  const SizedBox(width: 10,),
                  const Text('Salama care',
                  style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                    letterSpacing: 1.2,
                    ),),
                ],
              )
              ),

            ListTile(
              leading:  Icon(Icons.dashboard, color: Colors.blue.shade600,),
              title:  Text('Appointments',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w500,
                color: Colors.grey.shade800,
              ),
              ),
              onTap: (){},
              horizontalTitleGap: 16,
              tileColor: Colors.transparent,
              splashColor: Colors.blue.withOpacity(0.1),
              hoverColor: Colors.blue.withOpacity(0.05),
            ),

            const SizedBox(height: 8,),

            ListTile(
              leading:Icon(Icons.people, color: Colors.blue.shade600,),
              title: Text('patients',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w500,
                color: Colors.grey.shade800,
              ),
              ),
              onTap: (){},
              horizontalTitleGap: 16,
              tileColor: Colors.transparent,
              splashColor: Colors.blue.withOpacity(0.1),
              hoverColor: Colors.blue.withOpacity(0.05),
            ),

            const SizedBox(height: 8,),

            ListTile(
              leading:  Icon(Icons.settings, color: Colors.blue.shade600,),
              title: Text('settings',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w500,
                color: Colors.grey.shade800,
              ),
              ),
              onTap: (){},
              horizontalTitleGap: 16,
              tileColor: Colors.transparent,
              splashColor: Colors.blue.withOpacity(0.1),
              hoverColor: Colors.blue.withOpacity(0.05),

            ),

            const SizedBox(height: 8,),
            Divider(color: Colors.grey.shade300, height: 1),

            ListTile(
        leading: const Icon(Icons.logout, color: Colors.red),
        title: const Text(
          'Log out',
          style: TextStyle(
            color: Colors.red,
            fontWeight: FontWeight.bold,
          ),
        ),
        onTap: () {
          Navigator.pushReplacement(context, 
          MaterialPageRoute(builder: (context)=> const Loginscreen()),
          );
        },
        horizontalTitleGap: 16,
        tileColor: Colors.transparent,
        splashColor: Colors.red.withOpacity(0.1),
        hoverColor: Colors.red.withOpacity(0.05),
      ),

          ],
        ),
      ),

      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('Today\'s appointments',
             style: TextStyle(fontWeight: FontWeight.bold,fontSize: 18),),

            const SizedBox(height: 10,),

            //Appointments stat cards
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const statcard(
                  title: 'Upcoming appointments', 
                  color: Colors.amber, 
                  count: '10', 
                  icon: Icons.upcoming),
        
                  const statcard(
                    title: 'Completed Appointments', 
                    color: Colors.green, 
                    count: '5', 
                    icon: Icons.check_circle),
        
                 statcard(
                  title:'missed Apointments', 
                  color: Colors.orange.shade200, 
                  count: '2', 
                  icon: Icons.hourglass_empty)
        
        
              ],
            ),

            const SizedBox(height: 5,),

          //Appointments Table section
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text('Appointment details'),
              TextButton(
                onPressed: (){}, 
                child:const Text('view all')),

            ],
          ),  
         const AppointmentTables(),
          ],
        ),
      ),
    );
  }
}


class statcard extends StatelessWidget {
  final String title;
  final String count;
  final Color color;
  final IconData icon;

  const statcard({
    super.key,
    required this.title,
    required this.color,
    required this.count,
    required this.icon,});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 8),//Adds spacing between cards
        padding: const EdgeInsets.all(25),
        decoration: BoxDecoration(
          color: color, //passed the color object stored in the statcard widget
          borderRadius: BorderRadius.circular(22),
          boxShadow: const [
            BoxShadow(
              color: Colors.black12,
              blurRadius: 6,
              offset: Offset(0, 2),
            )
          ]
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            //card icon
            Icon(
              icon,
              size: 32,
              color: Colors.black54,
              ),
            const SizedBox(height: 15,),
//Card Title
            Text(
              title,
              style: const TextStyle(
                fontSize: 16, 
                fontWeight: FontWeight.bold,
                color: Colors.black87
                ),
            ),
            const SizedBox(height: 4,),
//count 
            Text(
              count,
              style: const TextStyle(fontSize: 28, 
              fontWeight: FontWeight.bold,
              color: Colors.black87,
              ),
            ),
          ],

        ),
      ),
    );
  }
}

class AppointmentTables extends StatelessWidget {
  const AppointmentTables({super.key});

  @override
  Widget build(BuildContext context) {
    // Get current user (doctor) ID
    final String? currentDoctorId = FirebaseAuth.instance.currentUser?.uid;

    // Check if user is logged in
    if (currentDoctorId == null) {
      return Center(child: Text('No user logged in'));
    }

    return Container(
      decoration: BoxDecoration(
        border: Border.all(
          color: Colors.black12,
          width: 1.0,
        ),
        borderRadius: BorderRadius.circular(10),
      ),
      padding: EdgeInsets.all(20),
      child: StreamBuilder<QuerySnapshot>(
        stream: FirebaseFirestore.instance
            .collection('appointments')
            .where('doctorId', isEqualTo: currentDoctorId)
            .orderBy('appointmentDate', descending: true)
            .snapshots(),
        builder: (context, snapshot) {
          // Add detailed error handling
          if (snapshot.hasError) {
            print('Error in StreamBuilder: ${snapshot.error}');
            return Center(
              child: Text('Error: ${snapshot.error}'),
            );
          }

          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          }

          final appointments = snapshot.data?.docs ?? [];

          // Handle empty appointments
          if (appointments.isEmpty) {
            return Center(child: Text('No appointments found'));
          }

          return SingleChildScrollView( // Add horizontal scrolling
            scrollDirection: Axis.horizontal,
            child: DataTable(
              columns: [
                DataColumn(label: Text('Patient Name')),
                DataColumn(label: Text('Appointment Date')),
                DataColumn(label: Text('Appointment Time')),
                DataColumn(label: Text('Status')),
                DataColumn(label: Text('Actions')),
              ],
              rows: appointments.map((doc) {
                // Add error handling for document data
                Map<String, dynamic> data;
                try {
                  data = doc.data() as Map<String, dynamic>;
                } catch (e) {
                  print('Error parsing document data: $e');
                  return DataRow(cells: [
                    DataCell(Text('Error')),
                    DataCell(Text('Error')),
                    DataCell(Text('Error')),
                    DataCell(Text('Error')),
                    DataCell(Text('Error')),
                  ]);
                }

                return DataRow(cells: [
                  DataCell(FutureBuilder<DocumentSnapshot>(
                    future: FirebaseFirestore.instance
                        .collection('patients')
                        .doc(data['userId'])
                        .get(),
                    builder: (context, patientSnapshot) {
                      if (patientSnapshot.hasError) {
                        print('Error fetching patient: ${patientSnapshot.error}');
                        return Text('Error loading patient');
                      }
                      
                      if (patientSnapshot.hasData) {
                        try {
                          final patientData = patientSnapshot.data?.data() as Map<String, dynamic>;
                          return Text('${patientData['First name']} ${patientData['Last name']}');
                        } catch (e) {
                          print('Error parsing patient data: $e');
                          return Text('Error parsing patient data');
                        }
                      }
                      return Text('Loading...');
                    },
                  )),
                  DataCell(Text(
                    _formatDate(data['appointmentDate'] as Timestamp)
                  )),
                  DataCell(Text(data['appointmentTime']?.toString() ?? 'N/A')),
                  DataCell(Text(data['status'] ?? 'Scheduled')),
                  DataCell(Row(
                    children: [
                      ElevatedButton(
                        onPressed: () => _rescheduleAppointment(doc.id),
                        child: Text('Reschedule'),
                      ),
                      SizedBox(width: 5),
                      ElevatedButton(
                        onPressed: () => _cancelAppointment(doc.id),
                        child: Text('Cancel'),
                      ),
                    ],
                  )),
                ]);
              }).toList(),
            ),
          );
        },
      ),
    );
  }

  String _formatDate(Timestamp timestamp) {
    try {
      final date = timestamp.toDate();
      return '${date.day}/${date.month}/${date.year}';
    } catch (e) {
      print('Error formatting date: $e');
      return 'Invalid date';
    }
  }

  Future<void> _rescheduleAppointment(String appointmentId) async {
    try {
      await FirebaseFirestore.instance
          .collection('appointments')
          .doc(appointmentId)
          .update({
            'status': 'Rescheduled',
          });
    } catch (e) {
      print('Error rescheduling appointment: $e');
    }
  }

  Future<void> _cancelAppointment(String appointmentId) async {
    try {
      await FirebaseFirestore.instance
          .collection('appointments')
          .doc(appointmentId)
          .update({'status': 'Cancelled'});
    } catch (e) {
      print('Error cancelling appointment: $e');
    }
  }
}
               
              
              

    
  

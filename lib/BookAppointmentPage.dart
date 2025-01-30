import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class BookAppointmentPage extends StatefulWidget {
  const BookAppointmentPage({super.key});

  @override
  _BookAppointmentPageState createState() => _BookAppointmentPageState();
}

class _BookAppointmentPageState extends State<BookAppointmentPage> {
  String? selectedDoctor;
  DateTime? selectedDate;
  TimeOfDay? selectedTime;
  List<Map<String, dynamic>> doctors = [];
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    fetchDoctors();
  }

  Future<void> fetchDoctors() async {
    try {
      final QuerySnapshot querySnapshot = await FirebaseFirestore.instance
          .collection('users')
          .where('role', isEqualTo: 'doctor')
          .get();

      setState(() {
        doctors = querySnapshot.docs
            .map((doc) => {
                  'id': doc.id,
                  'name': doc['username'],
                })
            .toList();
        isLoading = false;
      });

      print('Fetched doctors: $doctors');
    } catch (e) {
      print('Error fetching doctors: $e');
      setState(() {
        isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Book Appointment")),
      body: Padding(
        padding: const EdgeInsets.all(28.0),
        child: Column(
          children: [
            const Text('Select Doctor'),
            const Divider(),

            // Dropdown for selecting a doctor
            isLoading
                ? const Center(child: CircularProgressIndicator())
                : DropdownButtonFormField<String>(
                    value: selectedDoctor,
                    items: doctors.map((doctor) {
                      return DropdownMenuItem<String>(
                        value: doctor['id'],
                        child: Text(doctor['name']),
                      );
                    }).toList(),
                    onChanged: (value) {
                      setState(() {
                        selectedDoctor = value;
                      });
                    },
                    decoration: const InputDecoration(
                      labelText: "Select Doctor",
                      border: OutlineInputBorder(),
                    ),
                  ),

            const SizedBox(height: 16),
            const Divider(),
            const Text('Step 2: Choose Date'),

            // Date picker for appointment date
            ListTile(
              leading: const Icon(Icons.calendar_today),
              title: Text(selectedDate == null
                  ? "Select Date"
                  : "${selectedDate!.toLocal()}".split(' ')[0]),
              onTap: () async {
                DateTime? date = await showDatePicker(
                  context: context,
                  initialDate: DateTime.now(),
                  firstDate: DateTime.now(),
                  lastDate: DateTime(2100),
                );
                if (date != null) {
                  setState(() {
                    selectedDate = date;
                  });
                }
              },
            ),

            const Divider(),
            const Text('Step 3: Pick Time'),

            // Time picker for appointment time
            ListTile(
              leading: const Icon(Icons.access_time),
              title: Text(selectedTime == null
                  ? "Select Time"
                  : "${selectedTime!.hour}:${selectedTime!.minute}"),
              onTap: () async {
                TimeOfDay? time = await showTimePicker(
                  context: context,
                  initialTime: TimeOfDay.now(),
                );
                if (time != null) {
                  setState(() {
                    selectedTime = time;
                  });
                }
              },
            ),

            const SizedBox(height: 10),

            // Confirm button
            ElevatedButton(
              onPressed: () async {
                if (selectedDoctor != null &&
                    selectedDate != null &&
                    selectedTime != null) {
                  try {
                    final user = FirebaseAuth.instance.currentUser;
                    if (user != null) {
                      await FirebaseFirestore.instance
                          .collection('appointments')
                          .add({
                        'userId': user.uid,
                        'doctorId': selectedDoctor,
                        'appointmentDate': selectedDate,
                        'appointmentTime':
                            '${selectedTime!.hour}:${selectedTime!.minute}',
                        'createdAt': FieldValue.serverTimestamp(),
                      });
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text("Appointment booked successfully"),
                          backgroundColor: Colors.green,
                        ),
                      );
                      Navigator.pop(context);
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text("Please login first")),
                      );
                    }
                  } catch (e) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text("Error booking appointment: $e")),
                    );
                  }
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text("Please fill all fields")),
                  );
                }
              },
              child: const Text("Confirm Appointment"),
            ),
          ],
        ),
      ),
    );
  }
}

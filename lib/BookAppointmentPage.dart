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

  // Dummy list of doctors
  final List<String> doctors = ["Dr. Smith", "Dr. Jane Doe", "Dr. Ahmed"];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Book Appointment")),
      body: Padding(
        padding: const EdgeInsets.all(28.0),
        child: Column(
          children: [
            const Text('select doctor'),
            const Divider(),
            // Dropdown for selecting a doctor
            DropdownButtonFormField<String>(
              value: selectedDoctor,
              items: doctors
                  .map((doctor) => DropdownMenuItem(
                        value: doctor,
                        child: Text(doctor),
                      ))
                  .toList(),
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
            const Text('step 2 : choose date'),
            // Date picker for appointment date
            ListTile(
              leading: const Icon(Icons.calendar_today),
              title: Text(selectedDate == null// is a date is not selected it displays select date
                  ? "Select Date"
                  : "${selectedDate!.toLocal()}".split(' ')[0]),//if a date is selected it formats it and displays it
              //opens the date picker when tapped
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
            const Text('step 3 :Pick time'),
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

           // const Spacer(),

           const SizedBox(height: 10,),

            //cornfirm button
            ElevatedButton(
              onPressed: () {
                // Validate inputs and book the appointment (backend to be added later)
                if (selectedDoctor != null &&
                    selectedDate != null &&
                    selectedTime != null) {
                  print("Appointment Booked: $selectedDoctor, $selectedDate, $selectedTime");
                  Navigator.pop(context); // Return to previous page
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

import 'package:flutter/material.dart';

class PatientPortal extends StatelessWidget {
  final String patientName = "Vasco Nunes";
  final String patientEmail = "vs.nunes";
  final String patientPhone = "11111111111";
  final List<Appointment> appointments = [
    Appointment(date: "2024/06/15", time: "10:00 AM", doctor: "Dr. João"),
    Appointment(date: "2024/07/20", time: "02:00 PM", doctor: "Dr. Diogo"),
  ];
  final List<ExamResult> examResults = [
    ExamResult(date: "2024/05/10", exam: "Blood test", result: "Normal"),
    ExamResult(date: "2024/06/20", exam: "XRay", result: "No problems detected"),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Patient Portal'),
        backgroundColor: Colors.teal,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            _buildPersonalInfoSection(),
            SizedBox(height: 20),
            _buildAppointmentsSection(),
            SizedBox(height: 20),
            _buildExamResultsSection(),
          ],
        ),
      ),
    );
  }

  Widget _buildPersonalInfoSection() {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
      elevation: 4,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Personal Information",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Text("Name: $patientName"),
            Text("Email: $patientEmail"),
            Text("Phone: $patientPhone"),
          ],
        ),
      ),
    );
  }

  Widget _buildAppointmentsSection() {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
      elevation: 4,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Appointments",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            ...appointments.map((appointment) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Date: ${appointment.date}"),
                  Text("Time: ${appointment.time}"),
                  Text("Doctor: ${appointment.doctor}"),
                  Divider(),
                ],
              );
            }).toList(),
            ElevatedButton(
              onPressed: () {
              },
              child: Text('Mark New Appointment'),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildExamResultsSection() {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
      elevation: 4,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Exam Results",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            ...examResults.map((examResult) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Date: ${examResult.date}"),
                  Text("Exam: ${examResult.exam}"),
                  Text("Result: ${examResult.result}"),
                  Divider(),
                ],
              );
            }).toList(),
          ],
        ),
      ),
    );
  }
}

class Appointment {
  final String date;
  final String time;
  final String doctor;

  Appointment({required this.date, required this.time, required this.doctor});
}

class ExamResult {
  final String date;
  final String exam;
  final String result;

  ExamResult({required this.date, required this.exam, required this.result});
}

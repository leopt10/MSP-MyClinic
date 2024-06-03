import 'package:flutter/material.dart';

class DecongestionSystem extends StatelessWidget {
  final List<Clinic> clinics = [
    Clinic(name: "Clinic A", location: "Location Lisboa", capacity: 100, occupancy: 80, waitTime: 30),
    Clinic(name: "Clinic B", location: "Location Mem Martins", capacity: 150, occupancy: 120, waitTime: 20),
    Clinic(name: "Clinic C", location: "Location Porto", capacity: 200, occupancy: 150, waitTime: 15),
    Clinic(name: "Clinic D", location: "Location Alcochete", capacity: 50, occupancy: 50, waitTime: 60),
  ];

  Clinic getBestClinic() {
    clinics.sort((a, b) => a.waitTime.compareTo(b.waitTime));
    return clinics.first;
  }

  @override
  Widget build(BuildContext context) {
    final bestClinic = getBestClinic();
    return Scaffold(
      appBar: AppBar(
        title: Text('Clinics List'),
        backgroundColor: Colors.teal,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Expanded(
              child: ListView.builder(
                itemCount: clinics.length,
                itemBuilder: (context, index) {
                  final clinic = clinics[index];
                  return Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    elevation: 4,
                    margin: EdgeInsets.symmetric(vertical: 10.0),
                    child: ListTile(
                      contentPadding: EdgeInsets.all(16.0),
                      title: Text(
                        clinic.name,
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      subtitle: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(height: 8),
                          Text('Location: ${clinic.location}'),
                          SizedBox(height: 8),
                          Text('Capacity: ${clinic.capacity}'),
                          SizedBox(height: 8),
                          Text('Occupancy: ${clinic.occupancy}'),
                          SizedBox(height: 8),
                          Text('Wait Time: ${clinic.waitTime} min'),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
            SizedBox(height: 20),
            Text(
              'Best Clinic to Visit:',
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: Colors.teal),
            ),
            SizedBox(height: 10),
            Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
              elevation: 4,
              margin: EdgeInsets.symmetric(vertical: 10.0),
              child: ListTile(
                contentPadding: EdgeInsets.all(16.0),
                title: Text(
                  bestClinic.name,
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                subtitle: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 8),
                    Text('Location: ${bestClinic.location}'),
                    SizedBox(height: 8),
                    Text('Capacity: ${bestClinic.capacity}'),
                    SizedBox(height: 8),
                    Text('Occupancy: ${bestClinic.occupancy}'),
                    SizedBox(height: 8),
                    Text('Wait Time: ${bestClinic.waitTime} min'),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class Clinic {
  final String name;
  final String location;
  final int capacity;
  final int occupancy;
  final int waitTime;

  Clinic({required this.name, required this.location, required this.capacity, required this.occupancy, required this.waitTime});
}

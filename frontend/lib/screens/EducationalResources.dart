import 'package:flutter/material.dart';

class EducationalResources extends StatelessWidget {
  final List<EducationalResource> resources = [
    EducationalResource(
      title: "Healthy Eating",
      description: "Information on maintaining a balanced diet.",
      details: "A balanced diet includes a variety of foods: fruits, vegetables, whole grains, lean proteins, and healthy fats. It's important to limit sugar, salt, and unhealthy fats. Drink plenty of water and avoid sugary drinks."
    ),
    EducationalResource(
      title: "Diabetes Management",
      description: "How to manage diabetes effectively.",
      details: "Managing diabetes involves monitoring blood sugar levels, following a healthy diet, exercising regularly, and taking prescribed medications. It's important to have regular check-ups with your healthcare provider and to stay informed about your condition."
    ),
    EducationalResource(
      title: "Heart Health",
      description: "Tips to keep your heart healthy.",
      details: "To maintain a healthy heart, eat a diet rich in fruits, vegetables, and whole grains, and low in saturated fats, trans fats, and cholesterol. Exercise regularly, avoid smoking, and limit alcohol intake. Keep track of your blood pressure, cholesterol levels, and blood sugar levels."
    ),

  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Educational Resources'),
        backgroundColor: Colors.teal,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView.builder(
          itemCount: resources.length,
          itemBuilder: (context, index) {
            final resource = resources[index];
            return Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
              elevation: 4,
              margin: EdgeInsets.symmetric(vertical: 10.0),
              child: ExpansionTile(
                title: Text(
                  resource.title,
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                subtitle: Text(resource.description),
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Text(
                      resource.details,
                      style: TextStyle(fontSize: 16),
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}

class EducationalResource {
  final String title;
  final String description;
  final String details;

  EducationalResource({required this.title, required this.description, required this.details});
}

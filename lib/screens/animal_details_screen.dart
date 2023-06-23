import 'package:flutter/material.dart';
import 'package:vet_app/lib.dart';

class AnimalDetailsScreen extends StatelessWidget {
  const AnimalDetailsScreen({super.key, required this.animal});

  final Animal animal;

  @override
  Widget build(BuildContext context) {
    //final animal = ModalRoute.of(context)!.settings.arguments as Animal;

    return Scaffold(
        appBar: AppBar(
          title: Text(animal.name + " Vital Signs"),
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("\n"),
            Text(
                style: TextStyle(fontSize: 20),
                "Temperature: ${animal.temperature_low} - ${animal.temperature_high}\n"),
            Text(
                style: TextStyle(fontSize: 20),
                "Heart Rate: ${animal.heart_rate_low} - ${animal.heart_rate_high}\n"),
            Text(
                style: TextStyle(fontSize: 20),
                "Respiratory Rate: ${animal.respiratory_rate_low} - ${animal.respiratory_rate_high}\n"),
          ],
        ));
  }
}

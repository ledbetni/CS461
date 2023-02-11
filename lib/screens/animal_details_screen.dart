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
          title: Text(animal.name),
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Text(
              "Temperature = ${animal.temperature}\nHeart Rate = ${animal.heartRate}\nRespiratory Rate = ${animal.breathRate}\nList of Drugs = ${animal.druglist}"),
        ));
  }
}

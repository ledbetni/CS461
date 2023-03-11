import 'package:flutter/material.dart';
import 'package:open_file_plus/open_file_plus.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'dart:io';
import 'dart:convert';
import 'package:vet_app/lib.dart';

class AnimalScreen extends StatefulWidget {
  const AnimalScreen({super.key, required this.title});

  final String title;

  @override
  State<AnimalScreen> createState() => _AnimalScreenState();
}

class _AnimalScreenState extends State<AnimalScreen> {
  var animals = <Animal>[];

  @override
  void initState() {
    super.initState();
    getAnimals();
  }

  void getAnimals() async {
    var data = await NetworkData().makeList<Animal>(Animal.URL, Animal.fromJson);
    setState(() { animals = data; });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
          itemCount: animals.length,
          itemBuilder: (context, index) {
            return ListTile(
                title: Text(animals[index].name),
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => AnimalDetailsScreen(
                              animal: animals[index])));
                });
          }),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:open_file_plus/open_file_plus.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'dart:io';
import 'dart:convert';
import 'package:vet_app/lib.dart';
import 'animal_details_screen.dart';
import 'package:http/http.dart' as http;

class AnimalScreen extends StatefulWidget {
  const AnimalScreen({super.key, required this.title});

  final String title;
  static const String URL = 'https://vaddb.liamgombart.com/animals';

  @override
  State<AnimalScreen> createState() => _AnimalScreenState();
}

class _AnimalScreenState extends State<AnimalScreen> {
  List<Animal> animals = [];
  var animalList = AnimalList(entries: []);

  @override
  void initState() {
    super.initState();
    retrieveAnimalData();
  }

  void retrieveAnimalData() async {
    final http.Response apiResponse =
        await http.get(Uri.parse(AnimalScreen.URL));
    animalList = AnimalList.fromJson(jsonDecode(apiResponse.body));
    // print('API Response' + apiResponse.body);
    // print('AnimalList object: ' + animals.toString());
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
          itemCount: animalList.entries.length,
          itemBuilder: (context, index) {
            return ListTile(
                title: Text(animalList.entries[index].name),
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => AnimalDetailsScreen(
                              animal: animalList.entries[index])));
                });
          }),
    );
  }
}

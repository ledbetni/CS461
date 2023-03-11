import 'package:flutter/material.dart';
import 'package:open_file_plus/open_file_plus.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'dart:io';
import 'dart:convert';
import 'package:vet_app/lib.dart';
import 'animal_details_screen.dart';
import 'package:http/http.dart' as http;

class DrugScreen extends StatefulWidget {
  const DrugScreen({super.key, required this.title});

  final String title;

  @override
  State<DrugScreen> createState() => _DrugScreenState();
}

class _DrugScreenState extends State<DrugScreen> {

  var drugs = <Drug>[];

  @override
  void initState() {
    super.initState();
    getDrugs();
  }

  void getDrugs() async {
    var data = await NetworkData().makeList<Drug>(Drug.URL, Drug.fromJson);
    setState(() { drugs = data; });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: ListView.builder(
            itemCount: drugs.length,
            itemBuilder: (context, index) {
              return ListTile(title: Text(drugs[index].name));
            }));
  }
}

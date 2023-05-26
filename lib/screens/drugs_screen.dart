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

  static const String URL = 'https://vaddb.liamgombart.com/drugs';

  final String title;

  @override
  State<DrugScreen> createState() => _DrugScreenState();
}

class _DrugScreenState extends State<DrugScreen> {
  // final List<Drug> drugs = [
  //   Drug(1, 'Acepromazine'),
  //   Drug(2, 'Alfaxalone'),
  //   Drug(3, 'Atropine'),
  //   Drug(4, 'Azaperone'),
  //   Drug(5, 'Buprenorphine')
  // ];

  List<Drug> drugs = [];
  var drugList = DrugList(entries: []);

  @override
  void initState() {
    super.initState();
    retrieveDrugData();
  }

  void retrieveDrugData() async {
    final http.Response apiResponse = await http.get(Uri.parse(DrugScreen.URL));
    drugList = DrugList.fromJson(jsonDecode(apiResponse.body));
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Scrollbar(
      child: ListView.builder(
          itemCount: drugList.entries.length,
          itemBuilder: (context, index) {
            return ListTile(title: Text(drugList.entries[index].name));
          }),
    ));
  }
}

import 'package:flutter/material.dart';
import 'package:open_file_plus/open_file_plus.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'dart:io';
import 'dart:math';
import 'dart:convert';
import 'package:vet_app/lib.dart';
import 'animal_details_screen.dart';
import 'package:http/http.dart' as http;

class CalculatorScreen extends StatefulWidget {
  // final DrugList drugList;
  // final AnimalList animalList;
  const CalculatorScreen({super.key});

  static const String concentrationURL = 'https://vaddb.liamgombart.com/drugs';
  //static const String deliveryURL = 'https://vaddb.liamgombart.com/drugs';
  static const String dosageURL = 'https://vaddb.liamgombart.com/dosages';
  static const String dosageDerefURL =
      'https://vaddb.liamgombart.com/deref/dosages';
  //static const String methodURL = 'https://vaddb.liamgombart.com/drugs';
  //static const String unitURL = 'https://vaddb.liamgombart.com/drugs';

  @override
  State<CalculatorScreen> createState() => _CalculatorScreenState();
}

class _CalculatorScreenState extends State<CalculatorScreen> {
  List<String> selectedItemValue = [];

  List<Animal> animals = [];
  var animalList = AnimalList(entries: []);

  List<Drug> drugs = [];
  var drugList = DrugList(entries: []);

  List<Concentration> concentrations = [];
  var concentrationList = ConcentrationList(entries: []);

  List<Delivery> deliveries = [];
  var deliveryList = DeliveryList(entries: []);

  List<Dosage> dosages = [];
  var dosageList = DosageList(entries: []);

  List<DosageDeref> dosagesDeref = [];
  var dosageDerefList = DosageDerefList(entries: []);

  List<Method> methods = [];
  var methodList = MethodList(entries: []);

  List<Unit> units = [];
  var unitList = UnitList(entries: []);

  @override
  void initState() {
    super.initState();
    retrieveAnimalData();
    retrieveDrugData();
    //retrieveDosageData();
    retrieveDosageDerefData();
  }

  void retrieveAnimalData() async {
    final http.Response apiResponse =
        await http.get(Uri.parse(AnimalScreen.URL));
    animalList = AnimalList.fromJson(jsonDecode(apiResponse.body));
    // print('API Response' + apiResponse.body);
    // print('AnimalList object: ' + animals.toString());
    setState(() {});
  }

  void retrieveDrugData() async {
    final http.Response apiResponse = await http.get(Uri.parse(DrugScreen.URL));
    drugList = DrugList.fromJson(jsonDecode(apiResponse.body));
    setState(() {});
  }

  void retrieveConcentrationData() async {
    final http.Response apiResponse =
        await http.get(Uri.parse(CalculatorScreen.concentrationURL));
    concentrationList =
        ConcentrationList.fromJson(jsonDecode(apiResponse.body));
    setState(() {});
  }

  void retrieveDosageData() async {
    final http.Response apiResponse =
        await http.get(Uri.parse(CalculatorScreen.dosageURL));
    dosageList = DosageList.fromJson(jsonDecode(apiResponse.body));
    setState(() {});
  }

  void retrieveDosageDerefData() async {
    final http.Response apiResponse =
        await http.get(Uri.parse(CalculatorScreen.dosageDerefURL));
    dosageDerefList = DosageDerefList.fromJson(jsonDecode(apiResponse.body));
    setState(() {});
  }

  int getAnimalDrop() {
    Animal getAnimal;
    getAnimal = animalDropValue!;
    return getAnimal.animal_id;
  }

  int getDrugDrop() {
    Drug getDrug;
    getDrug = drugDropValue!;
    return getDrug.drug_id;
  }

  void getDosageAnimalDrug() async {
    String animalID = animalDropValue!.animal_id.toString();
    String drugID = drugDropValue!.drug_id.toString();
    String dosageIDURL =
        "https://vaddb.liamgombart.com/dosages?animal_id=$animalID&drug_id=$drugID";

    final http.Response apiResponse = await http.get(Uri.parse(dosageIDURL));
    dosageList = DosageList.fromJson(jsonDecode(apiResponse.body));
    // print(jsonDecode(animalID));
    // print(jsonDecode(drugID));
    print(dosageList.entries);
    //return dosageList;
  }

  void getUnitURL(int dosageUnitID) async {
    String unitURL = "https://vaddb.liamgombart.com/units/$dosageUnitID";
    final http.Response apiResponse = await http.get(Uri.parse(unitURL));
    unitList = UnitList.fromJson(jsonDecode(apiResponse.body));
  }

  void getDeliveryMethods(int dosageID) async {
    String deliveryURL =
        "https://vaddb.liamgombart.com/delivery?dosage_id=$dosageID";
    final http.Response apiResponse = await http.get(Uri.parse(deliveryURL));
    deliveryList = DeliveryList.fromJson(jsonDecode(apiResponse.body));
  }

  void getDosageConcentrations(int dosageID) async {
    String dosageConcentrationURL =
        "https://vaddb.liamgombart.com/concentrations?dosage_id=$dosageID";
    final http.Response apiResponse =
        await http.get(Uri.parse(dosageConcentrationURL));
    concentrationList =
        ConcentrationList.fromJson(jsonDecode(apiResponse.body));
  }

  /* Animal Weight * Dose(low,high range) / concentration value
    If */

  void eachDosageLooper() {
    String? newAnswerValue;
    List<String> finalAnswersList = [];
    answerString = '';
    //Iterate through dereferenced list. If animal_id and drug_id match, perform calculation
    for (var i = 0; i < dosageDerefList.entries.length; i++) {
      if (dosageDerefList.entries[i].animal.animal_id ==
              animalDropValue!.animal_id &&
          dosageDerefList.entries[i].drug.drug_id == drugDropValue!.drug_id) {
        // Calculation starts here
        calculatorValueLow =
            (weightAnswerValue! * dosageDerefList.entries[i].dose_low);
        calculatorValueHigh =
            weightAnswerValue! * dosageDerefList.entries[i].dose_high;
        for (var j = 0;
            j < dosageDerefList.entries[i].concentrations.entries.length;
            j++) {
          calculatorValueLow =
              (weightAnswerValue! * dosageDerefList.entries[i].dose_low);
          calculatorValueHigh =
              weightAnswerValue! * dosageDerefList.entries[i].dose_high;

          calculatorValueLow = calculatorValueLow! /
              dosageDerefList.entries[i].concentrations.entries[j].value;
          calculatorValueHigh = calculatorValueHigh! /
              dosageDerefList.entries[i].concentrations.entries[j].value;

          // calculatorValueLow = roundDouble
          // calculatorValueHigh

          // unitString =
          //     dosageDerefList.entries[i].concentrations.entries[j].unit!.name;

          unitString = dosageDerefList.entries[i].dose_unit.name;

          /* WORKING CONCENTRATION BUT ONLY ONE */
          concentrationString =
              dosageDerefList.entries[i].concentrations.entries[j].unit.name;
          concentrationValue =
              dosageDerefList.entries[i].concentrations.entries[j].value;

          notesString = dosageDerefList.entries[i].notes;
          if (notesString == null) {
            notesString = "No notes for this dosage\n\n";
          }
          //notesString = notesString! + "\n\n";
          for (var k = 0;
              k < dosageDerefList.entries[i].methods.entries.length;
              k++) {
            if (dosageDerefList.entries[i].methods.entries.length > 1) {
              //methodString = '';
              methodString = methodString! +
                  dosageDerefList.entries[i].methods.entries[k].name;
              methodString = methodString! + " ";
            } else {
              methodString = '';
              methodString = methodString! +
                  dosageDerefList.entries[i].methods.entries[k].name;
            }

            // newAnswerValue =
            //     "$calculatorValueLow $unitString - $calculatorValueHigh $unitString\nConcentration: $concentrationString\nMethod of Administration: $methodString\nNotes: $notesString $spaceString";
            // finalAnswersList.add(newAnswerValue);
          }
          doseNum++;
          doseString = "Dose $doseNum: ";
          resultHigh = calculatorValueHigh?.toStringAsFixed(2);
          resultLow = calculatorValueLow?.toStringAsFixed(2);
          newAnswerValue =
              "$doseString$resultLow - $resultHigh\nConcentration: $concentrationValue $concentrationString\nMethod of Administration: $methodString\nNotes: $notesString $spaceString";
          finalAnswersList.add(newAnswerValue);
        }

        setState(() {
          //answerString = answerString! + newAnswerValue!;
          //doseNum = 0;
          answerString = finalAnswersList.join(" ");
        });
      }
    }
  }

  void showError(BuildContext context) {
    showDialog(
        context: context,
        builder: ((context) {
          return AlertDialog(
            title: Text('Error'),
            content: Text('Please ensure that all fields have been selected'),
            actions: [
              TextButton(
                child: Text('OK'),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ],
          );
        }));
  }

  Animal? animalDropValue;
  Drug? drugDropValue;
  Concentration? concentrationDropValue;
  double? calculatorValueHigh;
  double? calculatorValueLow;
  String? unitString;
  String? concentrationString = '';
  String? notesString;
  num concentrationValue = 0;
  String? doseString;
  var resultHigh;
  var resultLow;
  int doseNum = 0;
  String? spaceString = "\n\n";
  String? methodString = '';
  String? answerString = 'Answer will appear here';
  double? weightAnswerValue;
  final TextEditingController calculatorController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Column(mainAxisAlignment: MainAxisAlignment.start, children: [
        Text("Species"),
        Padding(
          padding: EdgeInsets.all(8.0),
          child: DecoratedBox(
            decoration: const ShapeDecoration(
                color: Colors.white,
                shape: RoundedRectangleBorder(
                  side: BorderSide(
                      width: 1.0,
                      style: BorderStyle.solid,
                      color: Colors.indigo),
                  borderRadius: BorderRadius.all(Radius.circular(5.0)),
                )),
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 40.0, vertical: 0.0),
              child: DropdownButton<Animal>(
                value: animalDropValue,
                icon: const Icon(Icons.keyboard_arrow_down),
                elevation: 0,
                isExpanded: true,
                hint: Text("Select an Animal"),
                onChanged: (Animal? value) {
                  setState(() {
                    animalDropValue = value;
                  });
                },
                items: animalList.entries
                    .map<DropdownMenuItem<Animal>>((Animal value) {
                  return DropdownMenuItem(
                    value: value,
                    child: Text(value.name),
                  );
                }).toList(),
              ),
            ),
          ),
        ),
        Text("Medication"),
        Padding(
          padding: EdgeInsets.all(8.0),
          child: DecoratedBox(
            decoration: const ShapeDecoration(
                color: Colors.white,
                shape: RoundedRectangleBorder(
                  side: BorderSide(
                      width: 1.0,
                      style: BorderStyle.solid,
                      color: Colors.indigo),
                  borderRadius: BorderRadius.all(Radius.circular(5.0)),
                )),
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 40.0, vertical: 0.0),
              child: DropdownButton<Drug>(
                value: drugDropValue,
                icon: const Icon(Icons.keyboard_arrow_down),
                elevation: 0,
                isExpanded: true,
                hint: Text("Select a Drug"),
                onChanged: (Drug? value) {
                  setState(() {
                    drugDropValue = value;
                    print(value?.name);
                  });
                },
                items:
                    drugList.entries.map<DropdownMenuItem<Drug>>((Drug value) {
                  return DropdownMenuItem(
                    value: value,
                    child: Text(value.name),
                  );
                }).toList(),
              ),
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.all(8.0),
          child: TextField(
            decoration: const InputDecoration(
                border: OutlineInputBorder(),
                hintText: "Enter the animal's weight in kg"),
            onChanged: (value) {
              if (value.isNotEmpty) {
                weightAnswerValue = int.parse(value).toDouble();
                setState(() {
                  weightAnswerValue = int.parse(value).toDouble();
                });
              } else {
                setState(() {
                  weightAnswerValue = 0.0;
                });
              }
            },
          ),
        ),
        Flexible(
          child: Padding(
            padding:
                const EdgeInsets.symmetric(vertical: 0.0, horizontal: 30.0),
            child: ElevatedButton(
              onPressed: () async {
                //eachDosage();
                if (animalDropValue == null || drugDropValue == null) {
                  showError(context);
                } else {
                  eachDosageLooper();
                  print(dosageDerefList.entries[20].dosage_id);
                }
              },
              child: Text('Calculate Dosage'),
            ),
          ),
        ),
        Expanded(
            child: Scrollbar(
          child: SingleChildScrollView(
              child: Text(style: TextStyle(fontSize: 15), answerString!)),
        )),
      ]),
      floatingActionButton: FloatingActionButton(
        onPressed: (() {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => InfoCalcScreen()));
        }),
        tooltip: 'How to use the Calculator?',
        child: const Icon(Icons.info_outline),
      ),
    );
  }
}

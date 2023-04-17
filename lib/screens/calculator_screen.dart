import 'package:flutter/material.dart';
import 'package:open_file_plus/open_file_plus.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'dart:io';
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

  List<Method> methods = [];
  var methodList = MethodList(entries: []);

  List<Unit> units = [];
  var unitList = UnitList(entries: []);

  @override
  void initState() {
    super.initState();
    retrieveAnimalData();
    retrieveDrugData();
    retrieveDosageData();
  }

  @override
  void dispose() {
    calculatorController.dispose();
    super.dispose();
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

  // void retrieveDeliveryData() async {
  //   final http.Response apiResponse =
  //       await http.get(Uri.parse(CalculatorScreen.deliveryURL));
  //   deliveryList = DeliveryList.fromJson(jsonDecode(apiResponse.body));
  //   setState(() {});
  // }

  void retrieveDosageData() async {
    final http.Response apiResponse =
        await http.get(Uri.parse(CalculatorScreen.dosageURL));
    dosageList = DosageList.fromJson(jsonDecode(apiResponse.body));
    setState(() {});
  }

  // void retrieveMethodData() async {
  //   final http.Response apiResponse = await http.get(Uri.parse(DrugScreen.URL));
  //   methodList = MethodList.fromJson(jsonDecode(apiResponse.body));
  //   setState(() {});
  // }

  // void retrieveUnitData() async {
  //   final http.Response apiResponse = await http.get(Uri.parse(DrugScreen.URL));
  //   unitList = UnitList.fromJson(jsonDecode(apiResponse.body));
  //   setState(() {});
  // }

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

  // Future<MethodList> getMethodsOfDose(int dosageID) async {
  //   MethodList newMethodList;
  //   String methodURL = "https://vaddb.liamgombart.com/method?dosage_id=6";
  //   final http.Response apiResponse = await http.get(Uri.parse(methodURL));
  //   newMethodList = MethodList.fromJson(jsonDecode(apiResponse.body));
  //   return newMethodList;
  // }

  // void eachDosage() async {
  //   getDosageAnimalDrug();
  //   Unit unitForDosage;
  //   String unitDosageName;
  //   int dosageID;
  //   var methodsOfDoseList = <Method>[];
  //   Unit concentrationUnit;
  //   Method newMethod;
  //   // for (var i = 0; i < dosageList.entries.length; i++) {
  //   //   Dosage newDosage = dosageList.entries[i];
  //   //   dosageID = dosageList.entries[i].dosage_id;

  //   //   int newDosageUnitID = newDosage.dose_unit_id;
  //   //   getUnitURL(newDosageUnitID);
  //   //   // unitForDosage = unitList.entries.first;
  //   //   // unitDosageName = unitList.entries.first.name;
  //   //   // print(unitList.entries.first.name);

  //   //   getDeliveryMethods(dosageID);
  //   //   // print(deliveryList.entries
  //   //   //     .first); //FIRST ENTRY IN THE DELIVERY LIST - CONSISTS OF A METHODID AND DOSAGEID

  //   //   // for (var n = 0; n < deliveryList.entries.length; n++) {
  //   //   //   String methodURL =
  //   //   //       "https://vaddb.liamgombart.com/methods/${deliveryList.entries[n]}";
  //   //   //   final http.Response apiResponse = await http.get(Uri.parse(methodURL));
  //   //   //   newMethod = Method.fromJson(jsonDecode(apiResponse.body));
  //   //   //   methodsOfDoseList.add(newMethod);
  //   //   // }

  //   //   // getDosageConcentrations(dosageID);
  //   //   // int dosageConcentrationUnitID = concentrationList.entries.first.unit_id;
  //   //   // String unitURL =
  //   //   //     "https://vaddb.liamgombart.com/units/$dosageConcentrationUnitID";
  //   //   // final http.Response apiResponse = await http.get(Uri.parse(unitURL));
  //   //   // concentrationUnit = Unit.fromJson(jsonDecode(apiResponse.body));
  //   //   // print(concentrationUnit.name);
  //   //   // calculatorValueLow = dosageList.entries[i].dose_low;
  //   //   // calculatorValueHigh = dosageList.entries[i].dose_high;
  //   //   // var dosageUnit = unitList.entries[i].name;
  //   //   // int dosageUnitInt = int.parse(dosageUnit);

  //   //   // if (concentrationUnit.name != 'n/a' &&
  //   //   //     concentrationUnit.name != 'varies') {
  //   //   //   //concentrationUnit.name = 'mg/kg';
  //   //   //   // calculatorValueLow = answerValue! * dosageList.entries[i].dose_low;
  //   //   //   // calculatorValueHigh = answerValue! * dosageList.entries[i].dose_high;
  //   //   // }

  //   // }
  //   calculatorValueLow = answerValue! * dosageList.entries.first.dose_low;
  //   calculatorValueHigh = answerValue! * dosageList.entries.first.dose_high;
  //   answerString = "{$calculatorValueLow} - {$calculatorValueHigh}";
  //   setState(() {
  //     answerString = "{$calculatorValueLow} - {$calculatorValueHigh}";
  //   });
  // }

  void eachDosageLooper() {
    String? newValue;
    answerString = '';
    for (var i = 0; i < dosageList.entries.length; i++) {
      if (dosageList.entries[i].animal_id == animalDropValue!.animal_id &&
          dosageList.entries[i].drug_id == drugDropValue!.drug_id) {
        calculatorValueLow = answerValue! * dosageList.entries.first.dose_low;
        calculatorValueHigh = answerValue! * dosageList.entries.first.dose_high;
        newValue = "{$calculatorValueLow} - {$calculatorValueHigh}";
        setState(() {
          answerString = answerString! + newValue!;
        });
      }
    }
  }

  Animal? animalDropValue;
  Drug? drugDropValue;
  double? calculatorValueHigh;
  double? calculatorValueLow;
  String? answerString = 'Answer will appear here';
  int? answerValue;
  final TextEditingController calculatorController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Column(mainAxisAlignment: MainAxisAlignment.start, children: [
        Flexible(child: Text("Species")),
        Flexible(
          child: Padding(
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
        ),
        Flexible(child: Text("Medication")),
        Flexible(
          child: Padding(
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
                  items: drugList.entries
                      .map<DropdownMenuItem<Drug>>((Drug value) {
                    return DropdownMenuItem(
                      value: value,
                      child: Text(value.name),
                    );
                  }).toList(),
                ),
              ),
            ),
          ),
        ),
        Flexible(
          child: Padding(
            padding: EdgeInsets.all(8.0),
            child: TextField(
              decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: "Enter the animal's weight in kg"),
              onChanged: (value) {
                answerValue = int.parse(value);
                setState(() {
                  answerValue = int.parse(value);
                });
              },
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 0.0, horizontal: 30.0),
          child: ElevatedButton(
            onPressed: () async {
              //eachDosage();
              eachDosageLooper();
            },
            child: Text('Calculate Dosage'),
          ),
        ),
        Flexible(child: Text(answerString!))
      ]),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:open_file_plus/open_file_plus.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'dart:io';
import 'dart:convert';
import 'package:vet_app/lib.dart';
import 'animal_details_screen.dart';
import 'dart:async';
import 'package:http/http.dart' as http;


class CalculatorScreen extends StatefulWidget {
  const CalculatorScreen({super.key});

  @override
  State<CalculatorScreen> createState() => _CalculatorScreenState();
}

class _CalculatorScreenState extends State<CalculatorScreen> {
  List<String> selectedItemValue = [];

  var animals = <Animal>[];
  var drugs = <Drug> [];

  dynamic calculatedDosages = '';
  Animal? selectedAnimal;
  Drug? selectedDrug;
  List<Dosage> filteredDosages = [];

  int? animalWeight;

  double? calculatorValueHigh;
  double? calculatorValueLow;
  String? answerString = 'Answer will appear here';


  @override
  void initState() {
    super.initState();
    getAnimals();
    getDrugs();
  }

  @override
  void dispose() {
    calculatorController.dispose();
    super.dispose();
  }

  Future<http.Response> fetch(String uri) async {
    final response = await http.get(Uri.parse(uri));
    return response;
  }

  void getAnimals() async {
    var data = await NetworkData().makeList<Animal>(Animal.URL, Animal.fromJson);
    setState(() { animals = data; });
  }

  void getDrugs() async {
    var data = await NetworkData().makeList<Drug>(Drug.URL, Drug.fromJson);
    setState(() { drugs = data; });
  }

  void animalWeightHandler(newValue) {
    setState(() { animalWeight = int.parse(newValue); });
  }

  void animalDropDownHandler(newValue) {
    setState(() { selectedAnimal = newValue; });
  }

  void drugDropDownHandler(newValue) {
    setState(() { selectedDrug = newValue; });
  }

  void getFilteredDosages() async {
    var animal_id = selectedAnimal?.animal_id ?? null;
    var drug_id = selectedDrug?.drug_id ?? null;
    var data = await NetworkData().makeList<Dosage>('${Dosage.URL}?animal_id=$animal_id&drug_id=$drug_id', Dosage.fromJson);
    for (var dosage in data) {
      var dose_unit_name = await getUnitName(dosage.dose_unit_id);
      dosage.dose_unit_name = dose_unit_name;
    }
    setState(() { filteredDosages = data; });
  }

  Future<dynamic> getAssociatedConcentrations(Dosage dosage) async {
    var collectedConcentrations = <Concentration>[];

    var dosage_id = dosage?.dosage_id ?? null;
    var data = await NetworkData().makeList<Concentration>(
        '${Concentration.URL}?dosage_id=$dosage_id', Concentration.fromJson);

    for (var concentration in data) {
      var unit_name = await getUnitName(concentration.unit_id);
      concentration.unit_name = unit_name;
      collectedConcentrations.add(concentration);
    }
    return collectedConcentrations;
  }

  Future<dynamic> getAssociatedMethods(Dosage dosage) async {
    var collectedMethods = <Method>[];

    var dosage_id = dosage?.dosage_id ?? null;
    var data = await NetworkData().makeList<Delivery>('${Delivery.URL}?dosage_id=$dosage_id', Delivery.fromJson);

    for (var delivery in data) {
      var method = await getMethod(delivery.method_id);
      collectedMethods.add(method.first);
    }
    return collectedMethods;
  }

  Future<dynamic> getUnitName(int unit_id) async {
    var unit = await NetworkData().makeList<Unit>('${Unit.URL}/$unit_id', Unit.fromJson);
    return unit.first.name;
  }

  Future<dynamic> getMethod(int method_id) async {
    var method = await NetworkData().makeList<Method>('${Method.URL}/$method_id', Method.fromJson);
    return method;
  }

  void dereferenceDosages() async {
    try {
      getFilteredDosages();
      for (var item in filteredDosages) {
        item.methods = await getAssociatedMethods(item);
        item.concentrations = await getAssociatedConcentrations(item);
        print(jsonEncode(item));
      }

    } catch (e) {
      print('$e');
    }
  }

  void calculateDosage() async {

    dereferenceDosages();

    // TODO HERE vvvvvvvvvvvv
    //
    // do some calculations  herewith the dereferenced dosages
    //
    // TODO HERE ^^^^^^^^^

    setState(() { calculatedDosages = 'clicked'; });
  }



  //void getDosageAnimalDrug() async {
  //  String animalID = selectedAnimal!.animal_id.toString();
  //  String drugID = selectedDrug!.drug_id.toString();
  //  String dosageIDURL =
  //      "https://vaddb.liamgombart.com/dosages?animal_id=$animalID&drug_id=$drugID";

  //  final http.Response apiResponse = await http.get(Uri.parse(dosageIDURL));
 //   dosageList = DosageList.fromJson(jsonDecode(apiResponse.body));
    // print(jsonDecode(animalID));
    // print(jsonDecode(drugID));
  //  print(dosageList.entries);
    //return dosageList;
  //}

  //void getUnitURL(int dosageUnitID) async {
  //  String unitURL = "https://vaddb.liamgombart.com/units/$dosageUnitID";
  //  final http.Response apiResponse = await http.get(Uri.parse(unitURL));
  //  unitList = UnitList.fromJson(jsonDecode(apiResponse.body));
  //}

  //void getDeliveryMethods(int dosageID) async {
  //  String deliveryURL =
  //      "https://vaddb.liamgombart.com/delivery?dosage_id=$dosageID";
  //  final http.Response apiResponse = await http.get(Uri.parse(deliveryURL));
  //  deliveryList = DeliveryList.fromJson(jsonDecode(apiResponse.body));
  //}

  //void getDosageConcentrations(int dosageID) async {
  //  String dosageConcentrationURL =
  //      "https://vaddb.liamgombart.com/concentrations?dosage_id=$dosageID";
  //  final http.Response apiResponse =
  //      await http.get(Uri.parse(dosageConcentrationURL));
  //  concentrationList =
  //      ConcentrationList.fromJson(jsonDecode(apiResponse.body));
  //}

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
  //   //   //   // calculatorValueLow = animalWeight! * dosageList.entries[i].dose_low;
  //   //   //   // calculatorValueHigh = animalWeight! * dosageList.entries[i].dose_high;
  //   //   // }

  //   // }
  //   calculatorValueLow = animalWeight! * dosageList.entries.first.dose_low;
  //   calculatorValueHigh = animalWeight! * dosageList.entries.first.dose_high;
  //   answerString = "{$calculatorValueLow} - {$calculatorValueHigh}";
  //   setState(() {
  //     answerString = "{$calculatorValueLow} - {$calculatorValueHigh}";
  //   });
  // }

  //void eachDosageLooper() {
  //  String? newValue;
  //  answerString = '';
  //  for (var i = 0; i < dosageList.entries.length; i++) {
  //   if (dosageList.entries[i].animal_id == selectedAnimal!.animal_id &&
  //        dosageList.entries[i].drug_id == selectedDrug!.drug_id) {
  //      calculatorValueLow = animalWeight! * dosageList.entries.first.dose_low;
  //      calculatorValueHigh = animalWeight! * dosageList.entries.first.dose_high;
  //      newValue = "{$calculatorValueLow} - {$calculatorValueHigh}";
  //      setState(() {
  //        answerString = answerString! + newValue!;
  //      });
  //    }
  //  }
  //}


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
                  value: selectedAnimal,
                  icon: const Icon(Icons.keyboard_arrow_down),
                  elevation: 0,
                  isExpanded: true,
                  hint: Text("Select an Animal"),
                  onChanged: (Animal? value) {
                    animalDropDownHandler(value);
                  },
                  items: animals.map<DropdownMenuItem<Animal>>((Animal value) {
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
                  value: selectedDrug,
                  icon: const Icon(Icons.keyboard_arrow_down),
                  elevation: 0,
                  isExpanded: true,
                  hint: Text("Select a Drug"),
                  onChanged: (Drug? value) {
                    drugDropDownHandler(value);
                  },
                  items: drugs
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
                animalWeightHandler(value);
              },
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 0.0, horizontal: 30.0),
          child: ElevatedButton(
            onPressed: () async {
              calculateDosage();
            },
            child: Text('Calculate Dosage'),
          ),
        ),
        Flexible(child: Text('$calculatedDosages'))
    ]),
    );
  }
}

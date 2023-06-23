import 'drug.dart';

class DrugList {
  List<Drug> entries;

  DrugList({required this.entries});

  factory DrugList.fromJson(List<dynamic> parsedJson) {
    List<Drug> drugList = [];
    drugList = parsedJson.map((e) => Drug.fromJson(e)).toList();

    return DrugList(entries: drugList);
  }
}

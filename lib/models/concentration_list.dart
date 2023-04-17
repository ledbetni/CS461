import 'package:vet_app/models/concentration.dart';

class ConcentrationList {
  List<Concentration> entries;

  ConcentrationList({required this.entries});

  factory ConcentrationList.fromJson(List<dynamic> parsedJson) {
    List<Concentration> concentrationList = [];
    concentrationList =
        parsedJson.map((e) => Concentration.fromJson(e)).toList();

    return ConcentrationList(entries: concentrationList);
  }
}

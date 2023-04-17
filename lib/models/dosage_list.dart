import 'dosage.dart';

class DosageList {
  List<Dosage> entries;

  DosageList({required this.entries});

  factory DosageList.fromJson(List<dynamic> parsedJson) {
    List<Dosage> dosageList = [];
    dosageList = parsedJson.map((e) => Dosage.fromJson(e)).toList();

    return DosageList(entries: dosageList);
  }
}

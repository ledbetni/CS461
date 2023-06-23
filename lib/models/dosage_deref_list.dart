import 'package:vet_app/models/dosage_deref.dart';

import 'dosage.dart';

class DosageDerefList {
  List<DosageDeref> entries;

  DosageDerefList({required this.entries});

  factory DosageDerefList.fromJson(List<dynamic> parsedJson) {
    List<DosageDeref> dosageDerefList = [];
    dosageDerefList = parsedJson.map((e) => DosageDeref.fromJson(e)).toList();

    return DosageDerefList(entries: dosageDerefList);
  }
}

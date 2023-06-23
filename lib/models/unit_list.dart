import 'unit.dart';

class UnitList {
  List<Unit> entries;

  UnitList({required this.entries});

  factory UnitList.fromJson(List<dynamic> parsedJson) {
    List<Unit> unitList = [];
    unitList = parsedJson.map((e) => Unit.fromJson(e)).toList();

    return UnitList(entries: unitList);
  }
}

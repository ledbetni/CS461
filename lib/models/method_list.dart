import 'Method.dart';

class MethodList {
  List<Method> entries;

  MethodList({required this.entries});

  factory MethodList.fromJson(List<dynamic> parsedJson) {
    List<Method> methodList = [];
    methodList = parsedJson.map((e) => Method.fromJson(e)).toList();

    return MethodList(entries: methodList);
  }
}

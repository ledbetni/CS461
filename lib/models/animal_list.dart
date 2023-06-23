import 'animal.dart';

class AnimalList {
  List<Animal> entries;

  AnimalList({required this.entries});

  factory AnimalList.fromJson(List<dynamic> parsedJson) {
    List<Animal> animalList = [];
    animalList = parsedJson.map((e) => Animal.fromJson(e)).toList();

    return AnimalList(entries: animalList);
  }
}

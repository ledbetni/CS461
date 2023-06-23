import 'package:vet_app/lib.dart';

class DosageDeref {
  final int dosage_id;
  //final int animal_id;
  //final int drug_id;
  final double dose_low;
  final double dose_high;
  //final int? dose_unit_id; // SHOULD BE INT - NULL
  final String? notes;
  final Animal animal;
  final Drug drug;
  final Unit dose_unit;
  final ConcentrationList
      concentrations; //Might need to be concentration and methodList objects
  final MethodList methods;

  DosageDeref(
      {required this.dosage_id,
      //required this.animal_id,
      //required this.drug_id,
      required this.dose_low,
      required this.dose_high,
      //required this.dose_unit_id,
      required this.notes,
      required this.animal,
      required this.drug,
      required this.dose_unit,
      required this.concentrations,
      required this.methods});

  factory DosageDeref.fromJson(Map<String, dynamic> json) {
    return DosageDeref(
        dosage_id: int.parse(json['dosage_id']),
        //animal_id: int.parse(json['animal_id']),
        //drug_id: int.parse(json['drug_id']),
        dose_low: json['dose_low'].toDouble(),
        dose_high: json['dose_high'].toDouble(),
        //dose_unit_id: int.parse(json['dose_unit_id']),
        notes: json['notes'],
        animal: Animal.fromJson(json['animal']),
        drug: Drug.fromJson(json['drug']),
        dose_unit: Unit.fromJson(json['dose_unit']),
        concentrations: ConcentrationList.fromJson(json['concentrations']),
        methods: MethodList.fromJson(json['methods']));
  }
}

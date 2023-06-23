import 'package:flutter/material.dart';
import 'package:vet_app/lib.dart';

class Concentration {
  final int concentration_id;
  final value;
  final int dosage_id;
  final Unit unit;

  Concentration(
      {required this.concentration_id,
      required this.value,
      required this.dosage_id,
      required this.unit});

  factory Concentration.fromJson(Map<String, dynamic> json) {
    return Concentration(
        concentration_id: int.parse(json['concentration_id']),
        value: (json['value']),
        dosage_id: int.parse(json['dosage_id']),
        unit: Unit.fromJson(json['unit']));
  }
}

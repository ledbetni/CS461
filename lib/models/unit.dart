import 'package:flutter/material.dart';
import 'package:vet_app/lib.dart';

class Unit {
  final int unit_id;
  final String name;

  Unit({
    required this.unit_id,
    required this.name,
  });

  factory Unit.fromJson(Map<String, dynamic> json) {
    return Unit(unit_id: int.parse(json['unit_id']), name: json['name']);
  }
}

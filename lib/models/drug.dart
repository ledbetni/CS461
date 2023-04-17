import 'package:flutter/material.dart';
import 'package:vet_app/lib.dart';

class Drug {
  final int drug_id;
  final String name;

  Drug({
    required this.drug_id,
    required this.name,
  });

  factory Drug.fromJson(Map<String, dynamic> json) {
    return Drug(drug_id: int.parse(json['drug_id']), name: json['name']);
  }
}

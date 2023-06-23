import 'package:flutter/material.dart';
import 'package:vet_app/lib.dart';

class Method {
  final int method_id;
  final String name;

  Method({
    required this.method_id,
    required this.name,
  });

  factory Method.fromJson(Map<String, dynamic> json) {
    return Method(method_id: int.parse(json['method_id']), name: json['name']);
  }
}

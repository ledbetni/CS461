import 'package:flutter/material.dart';
import 'package:vet_app/lib.dart';

class Delivery {
  final int delivery_id;
  final int method_id;

  Delivery({
    required this.delivery_id,
    required this.method_id,
  });

  factory Delivery.fromJson(Map<String, dynamic> json) {
    return Delivery(
        delivery_id: int.parse(json['delivery_id']),
        method_id: int.parse(json['method_id']));
  }
}

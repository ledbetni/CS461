import 'package:vet_app/lib.dart';
//model complete

class Animal {
  final int animal_id;
  final String name;
  final double temperature_low;
  final double temperature_high;
  final double heart_rate_low;
  final double heart_rate_high;
  final double respiratory_rate_low;
  final double respiratory_rate_high;

  Animal(
      {required this.animal_id,
      required this.name,
      required this.temperature_low,
      required this.temperature_high,
      required this.heart_rate_low,
      required this.heart_rate_high,
      required this.respiratory_rate_low,
      required this.respiratory_rate_high});

  factory Animal.fromJson(Map<String, dynamic> json) {
    return Animal(
        animal_id: int.parse(json['animal_id']),
        name: json['name'],
        temperature_low: (json['temperature_low']).toDouble(),
        temperature_high: (json['temperature_high']).toDouble(),
        heart_rate_low: (json['heart_rate_low']).toDouble(),
        heart_rate_high: (json['heart_rate_high']).toDouble(),
        respiratory_rate_low: (json['respiratory_rate_low']).toDouble(),
        respiratory_rate_high: (json['respiratory_rate_high']).toDouble());
  }
}

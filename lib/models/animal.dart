import 'package:vet_app/assets/constants.dart' as constants;

class Animal{
  static const String URL = '${constants.TLD}/animals';

  final int? animal_id;
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
    var animal_id;
    try {
      animal_id = int.parse(json['animal_id']);
    } catch (e) {
      animal_id = null;
    }

    var temperature_low;
    try {
      temperature_low = json['temperature_low'].toDouble();
    } catch (e) {
      temperature_low = null;
    }

    var temperature_high;
    try {
      temperature_high = json['temperature_high'].toDouble();
    } catch (e) {
      temperature_high = null;
    }

    var heart_rate_low;
    try {
      heart_rate_low = json['heart_rate_low'].toDouble();
    } catch (e) {
      heart_rate_low = null;
    }

    var heart_rate_high;
    try {
      heart_rate_high = json['heart_rate_high'].toDouble();
    } catch (e) {
      heart_rate_high = null;
    }

    var respiratory_rate_low;
    try {
      respiratory_rate_low = json['respiratory_rate_low'].toDouble();
    } catch (e) {
      respiratory_rate_low = null;
    }

    var respiratory_rate_high;
    try {
      respiratory_rate_high = json['respiratory_rate_high'].toDouble();
    } catch (e) {
      respiratory_rate_high = null;
    }

    return Animal(
        animal_id: animal_id,
        name: json['name'],
        temperature_low: temperature_low,
        temperature_high: temperature_high,
        heart_rate_low: heart_rate_low,
        heart_rate_high: heart_rate_high,
        respiratory_rate_low: respiratory_rate_low,
        respiratory_rate_high: respiratory_rate_high);
  }

  Map<String, dynamic> toJson() {
    return {
      'animal_id': animal_id,
      'name': name,
      'temperature_low': temperature_low,
      'temperature_high': temperature_high,
      'heart_rate_low': heart_rate_low,
      'heart_rate_high': heart_rate_high,
      'respiratory_rate_low': respiratory_rate_low,
      'respiratory_rate_high': respiratory_rate_high,
    };
  }
}

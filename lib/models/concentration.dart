import 'package:vet_app/assets/constants.dart' as constants;

class Concentration {
  static const String URL = '${constants.TLD}/concentrations';

  final int concentration_id;
  final int? value;
  final int? unit_id;
  final int? dosage_id;

  Concentration(
      {required this.concentration_id,
      required this.value,
      required this.unit_id,
      required this.dosage_id});

  factory Concentration.fromJson(Map<String, dynamic> json) {
    var concentration_id = int.parse(json['concentration_id']);

    var value;
    try {
      value = int.parse(json['value']);
    } catch (e) {
      value = null;
    }

    var unit_id;
    try {
      unit_id = int.parse(json['unit_id']);
    } catch (e) {
      unit_id = null;
    }

    var dosage_id;
    try {
      dosage_id = int.parse(json['dosage_id']);
    } catch (e) {
      dosage_id = null;
    }

    return Concentration(
        concentration_id: concentration_id,
        value: value,
        unit_id: unit_id,
        dosage_id: dosage_id);
  }
  Map<String, dynamic> toJson() {
    return {
      'concentration_id': concentration_id,
      'value': value,
      'unit_id': unit_id,
      'dosage_id': dosage_id,
    };
  }
}

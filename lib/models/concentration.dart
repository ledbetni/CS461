import 'package:vet_app/assets/constants.dart' as constants;

class Concentration {
  static const String URL = '${constants.TLD}/concentrations';

  final int concentration_id;
  final int value;
  final int unit_id;
  final int dosage_id;

  Concentration(
      {required this.concentration_id,
      required this.value,
      required this.unit_id,
      required this.dosage_id});

  factory Concentration.fromJson(Map<String, dynamic> json) {
    return Concentration(
        concentration_id: int.parse(json['concentration_id']),
        value: int.parse(json['value']),
        unit_id: int.parse(json['unit_id']),
        dosage_id: int.parse(json['dosage_id']));
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

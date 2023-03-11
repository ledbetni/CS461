import 'package:vet_app/assets/constants.dart' as constants;

class Dosage {
  static const String URL = '${constants.TLD}/dosages';

  final int? dosage_id;
  final int? animal_id;
  final int? drug_id;
  final double? dose_low;
  final double? dose_high;
  final int? dose_unit_id;
  final String? notes;

  Dosage(
      {required this.dosage_id,
      required this.animal_id,
      required this.drug_id,
      required this.dose_low,
      required this.dose_high,
      required this.dose_unit_id,
      required this.notes});

  factory Dosage.fromJson(Map<String, dynamic> json) {
    var dosage_id;
    try {
      dosage_id = int.parse(json['dosage_id']);
    } catch (e) {
      dosage_id = null;
    }

    var animal_id;
    try {
      animal_id = int.parse(json['animal_id']);
    } catch (e) {
      animal_id = null;
    }

    var drug_id;
    try {
      drug_id = int.parse(json['drug_id']);
    } catch (e) {
      drug_id = null;
    }

    var dose_low;
    try {
      dose_low = json['dose_low'].toDouble();
    } catch (e) {
      dose_low = null;
    }

    var dose_high;
    try {
      dose_high = json['dose_high'].toDouble();
    } catch (e) {
      dose_high = null;
    }

    var dose_unit_id;
    try {
      dose_unit_id = int.parse(json['drug_id']);
    } catch (e) {
      dose_unit_id = null;
    }

    return Dosage(
        dosage_id: dosage_id,
        animal_id: animal_id,
        drug_id: drug_id,
        dose_low: dose_low,
        dose_high: dose_high,
        dose_unit_id: dose_unit_id,
        notes: json['notes']);
  }

  Map<String, dynamic> toJson() {
    return {
      'dosage_id': dosage_id,
      'animal_id': animal_id,
      'drug_id': drug_id,
      'dose_low': dose_low,
      'dose_high': dose_high,
      'dose_unit_id': dose_unit_id,
      'notes': notes,
    };
  }
}

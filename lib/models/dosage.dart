class Dosage {
  final int dosage_id;
  final int animal_id;
  final int drug_id;
  final double dose_low;
  final double dose_high;
  final int? dose_unit_id; // SHOULD BE INT - NULL
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
    print(json['dose_unit_id']);
    return Dosage(
        dosage_id: int.parse(json['dosage_id']),
        animal_id: int.parse(json['animal_id']),
        drug_id: int.parse(json['drug_id']),
        dose_low: json['dose_low'].toDouble(),
        dose_high: json['dose_high'].toDouble(),
        dose_unit_id: int.parse(json['dose_unit_id']),
        notes: json['notes']);
  }
}

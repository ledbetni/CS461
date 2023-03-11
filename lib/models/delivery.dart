import 'package:vet_app/assets/constants.dart' as constants;

class Delivery {
  static const String URL = '${constants.TLD}/delivery';
  final int dosage_id;
  final int method_id;

  Delivery({
    required this.dosage_id,
    required this.method_id,
  });

  factory Delivery.fromJson(Map<String, dynamic> json) {
    return Delivery(
        dosage_id: int.parse(json['dosage_id']),
        method_id: int.parse(json['method_id']));
  }

  Map<String, dynamic> toJson() {
    return {
      'dosage_id': dosage_id,
      'method_id': method_id,
    };
  }
}

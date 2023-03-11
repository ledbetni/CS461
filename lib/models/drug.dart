import 'package:vet_app/assets/constants.dart' as constants;

class Drug {
  static const String URL = '${constants.TLD}/drugs';

  final int drug_id;
  final String name;

  Drug({
    required this.drug_id,
    required this.name,
  });

  factory Drug.fromJson(Map<String, dynamic> json) {
    return Drug(
        drug_id: int.parse(json['drug_id']),
        name: json['name']
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'drug_id': drug_id,
      'name': name,
    };
  }
}

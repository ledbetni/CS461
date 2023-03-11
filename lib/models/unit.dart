import 'package:vet_app/assets/constants.dart' as constants;
class Unit {
  static const String URL = '${constants.TLD}/units';
  final int unit_id;
  String name;

  Unit({
    required this.unit_id,
    required this.name,
  });

  factory Unit.fromJson(Map<String, dynamic> json) {
    var unit_id;
    try {
      unit_id = int.parse(json['unit_id']);
    } catch (e) {
      unit_id = null;
    }

    return Unit(
        unit_id: unit_id,
        name: json['name']
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'unit_id': unit_id,
      'name': name,
    };
  }
}

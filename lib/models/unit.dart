import 'package:vet_app/assets/constants.dart' as constants;
class Unit {
  static const String URL = '${constants.TLD}/unitss';
  final int unit_id;
  String name;

  Unit({
    required this.unit_id,
    required this.name,
  });

  factory Unit.fromJson(Map<String, dynamic> json) {
    return Unit(unit_id: int.parse(json['unit_id']), name: json['name']);
  }

  Map<String, dynamic> toJson() {
    return {
      'unit_id': unit_id,
      'name': name,
    };
  }
}

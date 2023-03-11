import 'package:vet_app/assets/constants.dart' as constants;

class Method {
  static const String URL = '${constants.TLD}/methods';
  final int method_id;
  final String name;

  Method({
    required this.method_id,
    required this.name,
  });

  factory Method.fromJson(Map<String, dynamic> json) {
    return Method(method_id: int.parse(json['method_id']), name: json['name']);
  }

  Map<String, dynamic> toJson() {
    return {
      'method_id': method_id,
      'name': name,
    };
  }

}

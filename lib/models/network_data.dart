import 'dart:convert';
import 'package:http/http.dart' as http;

class NetworkData {
  static final NetworkData _networkData = NetworkData._internal();

  factory NetworkData() {
    return _networkData;
  }
  NetworkData._internal();

  Future<http.Response> fetch(String uri) async {
    final response = await http.get(Uri.parse(uri));
    return response;
  }

  Future<dynamic> retrieveData(String uri) async {
    final response = await fetch(uri);
    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      throw Exception('Status Code ${response.statusCode}...get rekt.');
    }
  }

  Future<dynamic> makeList<T>(String uri, Function(Map<String, dynamic>) constructorFromJson) async {
    var dataAsTarget = <T>[];
    var dataAsJson = await retrieveData(uri);
    if (dataAsJson is! List<dynamic>) {
        dataAsTarget.add(constructorFromJson(dataAsJson));
    } else {
      for (var item in dataAsJson) {
        dataAsTarget.add(constructorFromJson(item));
      }
    }

    return dataAsTarget;
  }
}





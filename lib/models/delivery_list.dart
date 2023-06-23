import 'delivery.dart';

class DeliveryList {
  List<Delivery> entries;

  DeliveryList({required this.entries});

  factory DeliveryList.fromJson(List<dynamic> parsedJson) {
    List<Delivery> deliveryList = [];
    deliveryList = parsedJson.map((e) => Delivery.fromJson(e)).toList();

    return DeliveryList(entries: deliveryList);
  }
}

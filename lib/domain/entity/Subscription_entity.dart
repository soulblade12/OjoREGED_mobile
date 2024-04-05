// To parse this JSON data, do
//
//     final subscriptionEntity = subscriptionEntityFromJson(jsonString);

import 'dart:convert';

List<SubscriptionEntity> subscriptionEntityFromJson(String str) => List<SubscriptionEntity>.from(json.decode(str).map((x) => SubscriptionEntity.fromJson(x)));

String subscriptionEntityToJson(List<SubscriptionEntity> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class SubscriptionEntity {
  int subscriptionId;
  String name;
  double price;

  SubscriptionEntity({
    required this.subscriptionId,
    required this.name,
    required this.price,
  });

  factory SubscriptionEntity.fromJson(Map<String, dynamic> json) => SubscriptionEntity(
    subscriptionId: json["subscriptionId"],
    name: json["name"],
    price: json["price"],
  );

  Map<String, dynamic> toJson() => {
    "subscriptionId": subscriptionId,
    "name": name,
    "price": price,
  };
}

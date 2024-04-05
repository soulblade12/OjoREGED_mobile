// To parse this JSON data, do
//
//     final updateSubscribeEntity = updateSubscribeEntityFromJson(jsonString);

import 'dart:convert';

UpdateSubscribeEntity updateSubscribeEntityFromJson(String str) => UpdateSubscribeEntity.fromJson(json.decode(str));

String updateSubscribeEntityToJson(UpdateSubscribeEntity data) => json.encode(data.toJson());

class UpdateSubscribeEntity {
  int? subscriptionId;
  int? customerId;

  UpdateSubscribeEntity({
    required this.subscriptionId,
    required this.customerId,
  });

  factory UpdateSubscribeEntity.fromJson(Map<String, dynamic> json) => UpdateSubscribeEntity(
    subscriptionId: json["subscription_ID"],
    customerId: json["customer_ID"],
  );

  Map<String, dynamic> toJson() => {
    "subscription_ID": subscriptionId,
    "customer_ID": customerId,
  };
}

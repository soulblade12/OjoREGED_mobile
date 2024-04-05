// To parse this JSON data, do
//
//     final addressEntity = addressEntityFromJson(jsonString);

import 'dart:convert';

AddressEntity addressEntityFromJson(String str) => AddressEntity.fromJson(json.decode(str));

String addressEntityToJson(AddressEntity data) => json.encode(data.toJson());

class AddressEntity {
  int? customerId;
  String province;
  String city;
  String streetAddress;
  String postalCode;

  AddressEntity({
    required this.customerId,
    required this.province,
    required this.city,
    required this.streetAddress,
    required this.postalCode,
  });

  factory AddressEntity.fromJson(Map<String, dynamic> json) => AddressEntity(
    customerId: json["customerId"],
    province: json["province"],
    city: json["city"],
    streetAddress: json["streetAddress"],
    postalCode: json["postalCode"],
  );

  Map<String, dynamic> toJson() => {
    "customerId": customerId,
    "province": province,
    "city": city,
    "streetAddress": streetAddress,
    "postalCode": postalCode,
  };
}

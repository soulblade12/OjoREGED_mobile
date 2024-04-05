// To parse this JSON data, do
//
//     final updateUserEntity = updateUserEntityFromJson(jsonString);

import 'dart:convert';

UpdateUserEntity updateUserEntityFromJson(String str) => UpdateUserEntity.fromJson(json.decode(str));

String updateUserEntityToJson(UpdateUserEntity data) => json.encode(data.toJson());

class UpdateUserEntity {
  int? customerId;
  String username;
  String firstName;
  String middleName;
  String lastName;
  String telephone;

  UpdateUserEntity({
    required this.customerId,
    required this.username,
    required this.firstName,
    required this.middleName,
    required this.lastName,
    required this.telephone,
  });

  factory UpdateUserEntity.fromJson(Map<String, dynamic> json) => UpdateUserEntity(
    customerId: json["customerId"],
    username: json["username"],
    firstName: json["firstName"],
    middleName: json["middleName"],
    lastName: json["lastName"],
    telephone: json["telephone"],
  );

  Map<String, dynamic> toJson() => {
    "customerId": customerId,
    "username": username,
    "firstName": firstName,
    "middleName": middleName,
    "lastName": lastName,
    "telephone": telephone,
  };
}

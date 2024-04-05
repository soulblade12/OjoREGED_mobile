// To parse this JSON data, do
//
//     final registerRequestEntity = registerRequestEntityFromJson(jsonString);

import 'dart:convert';

RegisterRequestEntity registerRequestEntityFromJson(String str) => RegisterRequestEntity.fromJson(json.decode(str));

String registerRequestEntityToJson(RegisterRequestEntity data) => json.encode(data.toJson());

class RegisterRequestEntity {
  String firstName;
  String middleName;
  String lastName;
  String telephone;
  String emailAddress;
  String username;
  String password;

  RegisterRequestEntity({
    required this.firstName,
    required this.middleName,
    required this.lastName,
    required this.telephone,
    required this.emailAddress,
    required this.username,
    required this.password,
  });

  factory RegisterRequestEntity.fromJson(Map<String, dynamic> json) => RegisterRequestEntity(
    firstName: json["firstName"],
    middleName: json["middleName"],
    lastName: json["lastName"],
    telephone: json["telephone"],
    emailAddress: json["emailAddress"],
    username: json["username"],
    password: json["password"],
  );

  Map<String, dynamic> toJson() => {
    "firstName": firstName,
    "middleName": middleName,
    "lastName": lastName,
    "telephone": telephone,
    "emailAddress": emailAddress,
    "username": username,
    "password": password,
  };
}

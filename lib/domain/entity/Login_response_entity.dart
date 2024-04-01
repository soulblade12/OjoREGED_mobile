// To parse this JSON data, do
//
//     final loginResponse = loginResponseFromJson(jsonString);

import 'dart:convert';

LoginResponse loginResponseFromJson(String str) => LoginResponse.fromJson(json.decode(str));

String loginResponseToJson(LoginResponse data) => json.encode(data.toJson());

class LoginResponse {
  String roleName;
  int customerId;
  String firstName;
  String middleName;
  String lastName;
  String token;

  LoginResponse({
    required this.roleName,
    required this.customerId,
    required this.firstName,
    required this.middleName,
    required this.lastName,
    required this.token,
  });

  factory LoginResponse.fromJson(Map<String, dynamic> json) => LoginResponse(
    roleName: json["role_Name"],
    customerId: json["customer_ID"],
    firstName: json["first_Name"],
    middleName: json["middle_Name"],
    lastName: json["last_Name"],
    token: json["token"],
  );

  Map<String, dynamic> toJson() => {
    "role_Name": roleName,
    "customer_ID": customerId,
    "first_Name": firstName,
    "middle_Name": middleName,
    "last_Name": lastName,
    "token": token,
  };
}

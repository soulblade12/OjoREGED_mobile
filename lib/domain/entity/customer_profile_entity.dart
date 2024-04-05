// To parse this JSON data, do
//
//     final customerProfileEntity = customerProfileEntityFromJson(jsonString);

import 'dart:convert';

CustomerProfileEntity customerProfileEntityFromJson(String str) => CustomerProfileEntity.fromJson(json.decode(str));

String customerProfileEntityToJson(CustomerProfileEntity data) => json.encode(data.toJson());

class CustomerProfileEntity {
  int customerId;
  String firstName;
  String middleName;
  String lastName;
  String telephone;
  int subscriptionId;
  String emailAddress;
  String username;
  int roleId;
  String image;
  List<Address> addresses;
  Role role;

  CustomerProfileEntity({
    required this.customerId,
    required this.firstName,
    required this.middleName,
    required this.lastName,
    required this.telephone,
    required this.subscriptionId,
    required this.emailAddress,
    required this.username,
    required this.roleId,
    required this.image,
    required this.addresses,
    required this.role,
  });

  factory CustomerProfileEntity.fromJson(Map<String, dynamic> json) => CustomerProfileEntity(
    customerId: json["customerId"],
    firstName: json["firstName"],
    middleName: json["middleName"],
    lastName: json["lastName"],
    telephone: json["telephone"],
    subscriptionId: json["subscriptionId"],
    emailAddress: json["emailAddress"],
    username: json["username"],
    roleId: json["roleId"],
    image: json["image"]?? "",
    addresses: List<Address>.from(json["addresses"].map((x) => Address.fromJson(x))),
    role: Role.fromJson(json["role"]),
  );

  Map<String, dynamic> toJson() => {
    "customerId": customerId,
    "firstName": firstName,
    "middleName": middleName,
    "lastName": lastName,
    "telephone": telephone,
    "subscriptionId": subscriptionId,
    "emailAddress": emailAddress,
    "username": username,
    "roleId": roleId,
    "image": image,
    "addresses": List<dynamic>.from(addresses.map((x) => x.toJson())),
    "role": role.toJson(),
  };
}

class Address {
  int customerId;
  String province;
  String city;
  String streetAddress;
  String postalCode;

  Address({
    required this.customerId,
    required this.province,
    required this.city,
    required this.streetAddress,
    required this.postalCode,
  });

  factory Address.fromJson(Map<String, dynamic> json) => Address(
    customerId: json["customerId"]?? "",
    province: json["province"]?? "",
    city: json["city"]?? "",
    streetAddress: json["streetAddress"]?? "",
    postalCode: json["postalCode"]?? "",
  );

  Map<String, dynamic> toJson() => {
    "customerId": customerId,
    "province": province,
    "city": city,
    "streetAddress": streetAddress,
    "postalCode": postalCode,
  };
}

class Role {
  int roleId;
  String roleName;

  Role({
    required this.roleId,
    required this.roleName,
  });

  factory Role.fromJson(Map<String, dynamic> json) => Role(
    roleId: json["roleId"],
    roleName: json["roleName"],
  );

  Map<String, dynamic> toJson() => {
    "roleId": roleId,
    "roleName": roleName,
  };
}

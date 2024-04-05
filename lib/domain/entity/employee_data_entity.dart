// To parse this JSON data, do
//
//     final employeeDataEntity = employeeDataEntityFromJson(jsonString);

import 'dart:convert';

List<EmployeeDataEntity> employeeDataEntityFromJson(String str) => List<EmployeeDataEntity>.from(json.decode(str).map((x) => EmployeeDataEntity.fromJson(x)));

String employeeDataEntityToJson(List<EmployeeDataEntity> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class EmployeeDataEntity {
  int employeeId;
  String firstName;
  String middleName;
  String lastName;
  String telephone;
  String username;
  String password;
  int roleId;
  dynamic role;
  List<EmployeeLocation> employeeLocations;
  List<EmployeeSchedule> employeeSchedules;

  EmployeeDataEntity({
    required this.employeeId,
    required this.firstName,
    required this.middleName,
    required this.lastName,
    required this.telephone,
    required this.username,
    required this.password,
    required this.roleId,
    required this.role,
    required this.employeeLocations,
    required this.employeeSchedules,
  });

  factory EmployeeDataEntity.fromJson(Map<String, dynamic> json) => EmployeeDataEntity(
    employeeId: json["employeeId"],
    firstName: json["firstName"],
    middleName: json["middleName"],
    lastName: json["lastName"],
    telephone: json["telephone"],
    username: json["username"],
    password: json["password"],
    roleId: json["roleId"],
    role: json["role"],
    employeeLocations: List<EmployeeLocation>.from(json["employeeLocations"].map((x) => EmployeeLocation.fromJson(x))),
    employeeSchedules: List<EmployeeSchedule>.from(json["employeeSchedules"].map((x) => EmployeeSchedule.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "employeeId": employeeId,
    "firstName": firstName,
    "middleName": middleName,
    "lastName": lastName,
    "telephone": telephone,
    "username": username,
    "password": password,
    "roleId": roleId,
    "role": role,
    "employeeLocations": List<dynamic>.from(employeeLocations.map((x) => x.toJson())),
    "employeeSchedules": List<dynamic>.from(employeeSchedules.map((x) => x.toJson())),
  };
}

class EmployeeLocation {
  String province;
  String city;
  String locationAddress;
  int employeeId;
  String postalCode;

  EmployeeLocation({
    required  this.province,
    required  this.city,
    required  this.locationAddress,
    required  this.employeeId,
    required  this.postalCode,
  });

  factory EmployeeLocation.fromJson(Map<String, dynamic> json) => EmployeeLocation(
    province: json["province"],
    city: json["city"],
    locationAddress: json["locationAddress"],
    employeeId: json["employeeId"],
    postalCode: json["postalCode"],
  );

  Map<String, dynamic> toJson() => {
    "province": province,
    "city": city,
    "locationAddress": locationAddress,
    "employeeId": employeeId,
    "postalCode": postalCode,
  };
}

class EmployeeSchedule {
  int employeeScheduleId;
  int employeeId;
  String status;
  DateTime startDate;
  DateTime endDate;
  int maxOrder;
  int orderScheduled;

  EmployeeSchedule({
    required  this.employeeScheduleId,
    required  this.employeeId,
    required  this.status,
    required  this.startDate,
    required  this.endDate,
    required  this.maxOrder,
    required  this.orderScheduled,
  });

  factory EmployeeSchedule.fromJson(Map<String, dynamic> json) => EmployeeSchedule(
    employeeScheduleId: json["employeeScheduleID"],
    employeeId: json["employeeId"],
    status: json["status"],
    startDate: DateTime.parse(json["startDate"]),
    endDate: DateTime.parse(json["endDate"]),
    maxOrder: json["maxOrder"],
    orderScheduled: json["orderScheduled"],
  );

  Map<String, dynamic> toJson() => {
    "employeeScheduleID": employeeScheduleId,
    "employeeId": employeeId,
    "status": status,
    "startDate": startDate.toIso8601String(),
    "endDate": endDate.toIso8601String(),
    "maxOrder": maxOrder,
    "orderScheduled": orderScheduled,
  };
}

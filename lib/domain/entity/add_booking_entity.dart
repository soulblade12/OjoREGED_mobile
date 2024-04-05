// To parse this JSON data, do
//
//     final addBookingEntity = addBookingEntityFromJson(jsonString);

import 'dart:convert';

AddBookingEntity addBookingEntityFromJson(String str) => AddBookingEntity.fromJson(json.decode(str));

String addBookingEntityToJson(AddBookingEntity data) => json.encode(data.toJson());

class AddBookingEntity {
  int? customerId;
  int? employeeScheduleId;
  int? weight;
  String size;
  String orderInstruction;

  AddBookingEntity({
    required this.customerId,
    required this.employeeScheduleId,
    required this.weight,
    required this.size,
    required this.orderInstruction,
  });

  factory AddBookingEntity.fromJson(Map<String, dynamic> json) => AddBookingEntity(
    customerId: json["customer_ID"],
    employeeScheduleId: json["employee_Schedule_ID"],
    weight: json["weight"],
    size: json["size"],
    orderInstruction: json["order_Instruction"],
  );

  Map<String, dynamic> toJson() => {
    "customer_ID": customerId,
    "employee_Schedule_ID": employeeScheduleId,
    "weight": weight,
    "size": size,
    "order_Instruction": orderInstruction,
  };
}

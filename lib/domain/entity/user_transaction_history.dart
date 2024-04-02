// To parse this JSON data, do
//
//     final customerHistoryEntity = customerHistoryEntityFromJson(jsonString);

import 'dart:convert';

List<CustomerHistoryEntity> customerHistoryEntityFromJson(String str) => List<CustomerHistoryEntity>.from(json.decode(str).map((x) => CustomerHistoryEntity.fromJson(x)));

String customerHistoryEntityToJson(List<CustomerHistoryEntity> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class CustomerHistoryEntity {
  int orderId;
  DateTime timePlaced;
  int customerId;
  int employeeScheduleId;
  List<OrderDetail> orderDetails;

  CustomerHistoryEntity({
    required this.orderId,
    required this.timePlaced,
    required this.customerId,
    required this.employeeScheduleId,
    required this.orderDetails,
  });

  factory CustomerHistoryEntity.fromJson(Map<String, dynamic> json) => CustomerHistoryEntity(
    orderId: json["orderId"],
    timePlaced: DateTime.parse(json["timePlaced"]),
    customerId: json["customerId"],
    employeeScheduleId: json["employeeScheduleId"],
    orderDetails: List<OrderDetail>.from(json["orderDetails"].map((x) => OrderDetail.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "orderId": orderId,
    "timePlaced": timePlaced.toIso8601String(),
    "customerId": customerId,
    "employeeScheduleId": employeeScheduleId,
    "orderDetails": List<dynamic>.from(orderDetails.map((x) => x.toJson())),
  };
}

class OrderDetail {
  int orderDetailId;
  int orderId;
  int weight;
  String size;
  String orderInstruction;
  int orderStatus;
  String orderImg;
  OrderStatusNavigation orderStatusNavigation;

  OrderDetail({
    required this.orderDetailId,
    required this.orderId,
    required this.weight,
    required this.size,
    required this.orderInstruction,
    required this.orderStatus,
    required this.orderImg,
    required this.orderStatusNavigation,
  });

  factory OrderDetail.fromJson(Map<String, dynamic> json) => OrderDetail(
    orderDetailId: json["orderDetailId"],
    orderId: json["orderId"],
    weight: json["weight"],
    size: json["size"],
    orderInstruction: json["orderInstruction"],
    orderStatus: json["orderStatus"],
    orderImg: json["orderImg"] ?? "",
    orderStatusNavigation: OrderStatusNavigation.fromJson(json["orderStatusNavigation"]),
  );

  Map<String, dynamic> toJson() => {
    "orderDetailId": orderDetailId,
    "orderId": orderId,
    "weight": weight,
    "size": size,
    "orderInstruction": orderInstruction,
    "orderStatus": orderStatus,
    "orderImg": orderImg,
    "orderStatusNavigation": orderStatusNavigation.toJson(),
  };
}

class OrderStatusNavigation {
  int orderStatus1;
  String statusDescription;

  OrderStatusNavigation({
    required this.orderStatus1,
    required this.statusDescription,
  });

  factory OrderStatusNavigation.fromJson(Map<String, dynamic> json) => OrderStatusNavigation(
    orderStatus1: json["orderStatus1"],
    statusDescription: json["statusDescription"],
  );

  Map<String, dynamic> toJson() => {
    "orderStatus1": orderStatus1,
    "statusDescription": statusDescription,
  };
}

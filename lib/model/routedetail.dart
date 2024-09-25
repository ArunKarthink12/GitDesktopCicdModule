// To parse this JSON data, do
//
//     final routemodel = routemodelFromJson(jsonString);

import 'dart:convert';

Routemodel routemodelFromJson(String str) =>
    Routemodel.fromJson(json.decode(str));

String routemodelToJson(Routemodel data) => json.encode(data.toJson());

class Routemodel {
  List<GetCustomerDetail> getCustomerDetails;
  List<GetRouteDetail> getRouteDetails;
  bool status;
  String message;

  Routemodel({
    required this.getCustomerDetails,
    required this.getRouteDetails,
    required this.status,
    required this.message,
  });

  factory Routemodel.fromJson(Map<String, dynamic> json) => Routemodel(
        getCustomerDetails: List<GetCustomerDetail>.from(
            json["_getCustomerDetails"]
                .map((x) => GetCustomerDetail.fromJson(x))),
        getRouteDetails: List<GetRouteDetail>.from(
            json["_getRouteDetails"].map((x) => GetRouteDetail.fromJson(x))),
        status: json["_status"],
        message: json["_message"],
      );

  Map<String, dynamic> toJson() => {
        "_getCustomerDetails":
            List<dynamic>.from(getCustomerDetails.map((x) => x.toJson())),
        "_getRouteDetails":
            List<dynamic>.from(getRouteDetails.map((x) => x.toJson())),
        "_status": status,
        "_message": message,
      };
}

class GetCustomerDetail {
  int rowNo;
  int customerNo;
  String customerName;

  GetCustomerDetail({
    required this.rowNo,
    required this.customerNo,
    required this.customerName,
  });

  factory GetCustomerDetail.fromJson(Map<String, dynamic> json) =>
      GetCustomerDetail(
        rowNo: json["rowNo"],
        customerNo: json["customerNo"],
        customerName: json["customerName"],
      );

  Map<String, dynamic> toJson() => {
        "rowNo": rowNo,
        "customerNo": customerNo,
        "customerName": customerName,
      };
}

class GetRouteDetail {
  int rowNo;
  int commonNo;
  String commonName;

  GetRouteDetail({
    required this.rowNo,
    required this.commonNo,
    required this.commonName,
  });

  factory GetRouteDetail.fromJson(Map<String, dynamic> json) => GetRouteDetail(
        rowNo: json["rowNo"],
        commonNo: json["commonNo"],
        commonName: json["commonName"],
      );

  Map<String, dynamic> toJson() => {
        "rowNo": rowNo,
        "commonNo": commonNo,
        "commonName": commonName,
      };
}

// To parse this JSON data, do
//
//     final servicefiltermodel = servicefiltermodelFromJson(jsonString);

import 'dart:convert';

Servicefiltermodel servicefiltermodelFromJson(String str) =>
    Servicefiltermodel.fromJson(json.decode(str));

String servicefiltermodelToJson(Servicefiltermodel data) =>
    json.encode(data.toJson());

class Servicefiltermodel {
  List<GetServiceDetail> getServiceDetails;
  bool status;
  String message;

  Servicefiltermodel({
    required this.getServiceDetails,
    required this.status,
    required this.message,
  });

  factory Servicefiltermodel.fromJson(Map<String, dynamic> json) =>
      Servicefiltermodel(
        getServiceDetails: List<GetServiceDetail>.from(
            json["getServiceDetails"].map((x) => GetServiceDetail.fromJson(x))),
        status: json["status"],
        message: json["message"],
      );

  Map<String, dynamic> toJson() => {
        "getServiceDetails":
            List<dynamic>.from(getServiceDetails.map((x) => x.toJson())),
        "status": status,
        "message": message,
      };
}

class GetServiceDetail {
  int serviceNo;
  String testCode;
  String serviceName;
  // String serviceNameClone;
  String serviceType;

  GetServiceDetail({
    required this.serviceNo,
    required this.testCode,
    required this.serviceName,
    // required this.serviceNameClone,
    required this.serviceType,
  });

  factory GetServiceDetail.fromJson(Map<String, dynamic> json) =>
      GetServiceDetail(
        serviceNo: json["serviceNo"],
        testCode: json["testCode"],
        serviceName: json["serviceName"],
        // serviceNameClone: json["serviceNameClone"] ?? "Service",
        serviceType: json["serviceType"]!,
      );

  Map<String, dynamic> toJson() => {
        "serviceNo": serviceNo,
        "testCode": testCode,
        "serviceName": serviceName,
        // "serviceNameClone": serviceNameClone,
        "serviceType": serviceType,
      };

  toLowerCase() {}
}

class TempService {
  int serviceNo;
  String testCode;
  String serviceName;
  // String serviceNameClone;
  String serviceType;

  TempService({
    required this.serviceNo,
    required this.testCode,
    required this.serviceName,
    // required this.serviceNameClone,
    required this.serviceType,
  });

  factory TempService.fromJson(Map<String, dynamic> json) => TempService(
        serviceNo: json["serviceNo"],
        testCode: json["testCode"],
        serviceName: json["serviceName"],
        // serviceNameClone: json["serviceNameClone"] ?? "Service",
        serviceType: json["serviceType"]!,
      );

  Map<String, dynamic> toJson() => {
        "serviceNo": serviceNo,
        "testCode": testCode,
        "serviceName": serviceName,
        // "serviceNameClone": serviceNameClone,
        "serviceType": serviceType,
      };

  toLowerCase() {}
}
// enum ServiceType { G, P, T }

// final serviceTypeValues =
//     EnumValues({"G": ServiceType.G, "P": ServiceType.P, "T": ServiceType.T});

// class EnumValues<T> {
//   Map<String, T> map;
//   late Map<T, String> reverseMap;

//   EnumValues(this.map);

//   Map<T, String> get reverse {
//     reverseMap = map.map((k, v) => MapEntry(v, k));
//     return reverseMap;
//   }
// }

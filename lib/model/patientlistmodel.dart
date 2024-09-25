// To parse this JSON data, do
//
//     final patientlistmodel = patientlistmodelFromJson(jsonString);

import 'dart:convert';

Patientlistmodel patientlistmodelFromJson(String str) =>
    Patientlistmodel.fromJson(json.decode(str));

String patientlistmodelToJson(Patientlistmodel data) =>
    json.encode(data.toJson());

class Patientlistmodel {
  List<GetDashboardApprovedDetail> getDashboardNonApprovedDetails;
  List<GetDashboardApprovedDetail> getDashboardApprovedDetails;
  bool status;
  String message;

  Patientlistmodel({
    required this.getDashboardNonApprovedDetails,
    required this.getDashboardApprovedDetails,
    required this.status,
    required this.message,
  });

  factory Patientlistmodel.fromJson(Map<String, dynamic> json) =>
      Patientlistmodel(
        getDashboardNonApprovedDetails: List<GetDashboardApprovedDetail>.from(
            json["getDashboardNonApprovedDetails"]
                .map((x) => GetDashboardApprovedDetail.fromJson(x))),
        getDashboardApprovedDetails: List<GetDashboardApprovedDetail>.from(
            json["getDashboardApprovedDetails"]
                .map((x) => GetDashboardApprovedDetail.fromJson(x))),
        status: json["status"],
        message: json["message"],
      );

  Map<String, dynamic> toJson() => {
        "getDashboardNonApprovedDetails": List<dynamic>.from(
            getDashboardNonApprovedDetails.map((x) => x.toJson())),
        "getDashboardApprovedDetails": List<dynamic>.from(
            getDashboardApprovedDetails.map((x) => x.toJson())),
        "status": status,
        "message": message,
      };
}

class GetDashboardApprovedDetail {
  int patientNo;
  int patientVisitNo;
  String patientId;
  String fullName;
  String ageType;
  String gender;
  String mobileNumber;
  String visitId;
  String visitDttm;
  String customerName;
  bool vIsStat;
  bool vIsAbnormal;
  bool vIsCritical;
  int orderListNo;
  String serviceType;
  int serviceNo;
  String serviceName;
  int resultTypeNo;
  int orderListStatus;
  String orderListStatusText;
  bool isRecheck;
  String taskDttm;
  String barcodeNo;
  String venueBranchName;
  int totalRecords;
  String patientImage;

  GetDashboardApprovedDetail({
    required this.patientNo,
    required this.patientVisitNo,
    required this.patientId,
    required this.fullName,
    required this.ageType,
    required this.gender,
    required this.mobileNumber,
    required this.visitId,
    required this.visitDttm,
    required this.customerName,
    required this.vIsStat,
    required this.vIsAbnormal,
    required this.vIsCritical,
    required this.orderListNo,
    required this.serviceType,
    required this.serviceNo,
    required this.serviceName,
    required this.resultTypeNo,
    required this.orderListStatus,
    required this.orderListStatusText,
    required this.isRecheck,
    required this.taskDttm,
    required this.barcodeNo,
    required this.venueBranchName,
    required this.totalRecords,
    required this.patientImage,
  });

  factory GetDashboardApprovedDetail.fromJson(Map<String, dynamic> json) =>
      GetDashboardApprovedDetail(
        patientNo: json["patientNo"],
        patientVisitNo: json["patientVisitNo"],
        patientId: json["patientId"],
        fullName: json["fullName"],
        ageType: json["ageType"],
        gender: json["gender"]!,
        mobileNumber: json["mobileNumber"],
        visitId: json["visitId"],
        visitDttm: json["visitDTTM"],
        customerName: json["customerName"]!,
        vIsStat: json["vIsStat"],
        vIsAbnormal: json["vIsAbnormal"],
        vIsCritical: json["vIsCritical"],
        orderListNo: json["orderListNo"],
        serviceType: json["serviceType"]!,
        serviceNo: json["serviceNo"],
        serviceName: json["serviceName"],
        resultTypeNo: json["resultTypeNo"],
        orderListStatus: json["orderListStatus"],
        orderListStatusText: json["orderListStatusText"]!,
        isRecheck: json["isRecheck"],
        taskDttm: json["taskDTTM"],
        barcodeNo: json["barcodeNo"],
        venueBranchName: json["venueBranchName"]!,
        totalRecords: json["totalRecords"],
        patientImage: json["patientImage"],
      );

  Map<String, dynamic> toJson() => {
        "patientNo": patientNo,
        "patientVisitNo": patientVisitNo,
        "patientId": patientId,
        "fullName": fullName,
        "ageType": ageType,
        "gender": gender,
        "mobileNumber": mobileNumber,
        "visitId": visitId,
        "visitDTTM": visitDttm,
        "customerName": customerName,
        "vIsStat": vIsStat,
        "vIsAbnormal": vIsAbnormal,
        "vIsCritical": vIsCritical,
        "orderListNo": orderListNo,
        "serviceType": serviceType,
        "serviceNo": serviceNo,
        "serviceName": serviceName,
        "resultTypeNo": resultTypeNo,
        "orderListStatus": orderListStatus,
        "orderListStatusText": orderListStatusText,
        "isRecheck": isRecheck,
        "taskDTTM": taskDttm,
        "barcodeNo": barcodeNo,
        "venueBranchName": venueBranchName,
        "totalRecords": totalRecords,
        "patientImage": patientImage,
      };
}

// enum CustomerName {
//     BEE_AARTHI,
//     EMPTY,
//     HARIHARAN
// }

// final customerNameValues = EnumValues({
//     "bee aarthi": CustomerName.BEE_AARTHI,
//     "": CustomerName.EMPTY,
//     "Hariharan": CustomerName.HARIHARAN
// });

// enum Gender {
//     F,
//     M
// }

// final genderValues = EnumValues({
//     "F": Gender.F,
//     "M": Gender.M
// });

// enum OrderListStatusText {
//     RESULT_APPROVED,
//     RESULT_VALIDATED
// }

// final orderListStatusTextValues = EnumValues({
//     "Result Approved": OrderListStatusText.RESULT_APPROVED,
//     "Result Validated": OrderListStatusText.RESULT_VALIDATED
// });

// enum ServiceType {
//     G,
//     T
// }

// final serviceTypeValues = EnumValues({
//     "G": ServiceType.G,
//     "T": ServiceType.T
// });

// enum VenueBranchName {
//     CHENNAI_CHROMPET
// }

// final venueBranchNameValues = EnumValues({
//     "Chennai-Chrompet": VenueBranchName.CHENNAI_CHROMPET
// });

// class EnumValues<T> {
//     Map<String, T> map;
//     late Map<T, String> reverseMap;

//     EnumValues(this.map);

//     Map<T, String> get reverse {
//         reverseMap = map.map((k, v) => MapEntry(v, k));
//         return reverseMap;
//     }
// }

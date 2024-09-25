// To parse this JSON data, do
//
//     final approvedTestDetailsmodel = approvedTestDetailsmodelFromJson(jsonString);

import 'dart:convert';

ApprovedTestDetailsmodel approvedTestDetailsmodelFromJson(String str) =>
    ApprovedTestDetailsmodel.fromJson(json.decode(str));

String approvedTestDetailsmodelToJson(ApprovedTestDetailsmodel data) =>
    json.encode(data.toJson());

class ApprovedTestDetailsmodel {
  int venueno;
  int venuebranchno;
  int userno;
  int patientVisitNo;
  String patientId;
  String fullName;
  String ageType;
  String gender;
  String visitId;
  String extenalVisitId;
  String visitDttm;
  String? referredBy;
  String pagecode;
  List<LstRecallServicve> lstRecallServicves;
  String venueBranchName;

  ApprovedTestDetailsmodel({
    required this.venueno,
    required this.venuebranchno,
    required this.userno,
    required this.patientVisitNo,
    required this.patientId,
    required this.fullName,
    required this.ageType,
    required this.gender,
    required this.visitId,
    required this.extenalVisitId,
    required this.visitDttm,
    required this.referredBy,
    required this.pagecode,
    required this.lstRecallServicves,
    required this.venueBranchName,
  });

  factory ApprovedTestDetailsmodel.fromJson(Map<String, dynamic> json) =>
      ApprovedTestDetailsmodel(
        venueno: json["venueno"],
        venuebranchno: json["venuebranchno"],
        userno: json["userno"],
        patientVisitNo: json["patientVisitNo"],
        patientId: json["patientID"],
        fullName: json["fullName"],
        ageType: json["ageType"],
        gender: json["gender"],
        visitId: json["visitID"],
        extenalVisitId: json["extenalVisitID"],
        visitDttm: json["visitDTTM"],
        pagecode: json["pagecode"] ?? "PCRR",
        referredBy: json["referredBy"] ?? "",
        lstRecallServicves: List<LstRecallServicve>.from(
            json["lstRecallServicves"]
                .map((x) => LstRecallServicve.fromJson(x))),
        venueBranchName: json["venueBranchName"],
      );

  Map<String, dynamic> toJson() => {
        "venueno": venueno,
        "venuebranchno": venuebranchno,
        "userno": userno,
        "patientVisitNo": patientVisitNo,
        "patientID": patientId,
        "fullName": fullName,
        "ageType": ageType,
        "gender": gender,
        "visitID": visitId,
        "extenalVisitID": extenalVisitId,
        "visitDTTM": visitDttm,
        "pagecode": pagecode,
        "referredBy": referredBy,
        "lstRecallServicves":
            List<dynamic>.from(lstRecallServicves.map((x) => x.toJson())),
        "venueBranchName": venueBranchName,
      };
}

class LstRecallServicve {
  bool isChecked;
  int patientVisitNo;
  int orderListNo;
  String? barcodeNo;
  String serviceType;
  int serviceNo;
  String serviceName;
  int orderListStatus;
  String orderListStatusText;
  dynamic comments;

  LstRecallServicve({
    required this.isChecked,
    required this.patientVisitNo,
    required this.orderListNo,
    required this.barcodeNo,
    required this.serviceType,
    required this.serviceNo,
    required this.serviceName,
    required this.orderListStatus,
    required this.orderListStatusText,
    required this.comments,
  });

  factory LstRecallServicve.fromJson(Map<String, dynamic> json) =>
      LstRecallServicve(
        isChecked: json["isChecked"],
        patientVisitNo: json["patientVisitNo"],
        orderListNo: json["orderListNo"],
        barcodeNo: json["barcodeNo"] ?? "**No BarCode**",
        serviceType: json["serviceType"],
        serviceNo: json["serviceNo"],
        serviceName: json["serviceName"],
        orderListStatus: json["orderListStatus"],
        orderListStatusText: json["orderListStatusText"],
        comments: json["comments"] ?? " ",
      );

  Map<String, dynamic> toJson() => {
        "isChecked": isChecked,
        "patientVisitNo": patientVisitNo,
        "orderListNo": orderListNo,
        "barcodeNo": barcodeNo,
        "serviceType": serviceType,
        "serviceNo": serviceNo,
        "serviceName": serviceName,
        "orderListStatus": orderListStatus,
        "orderListStatusText": orderListStatusText,
        "comments": comments,
      };
}

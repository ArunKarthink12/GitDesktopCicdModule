// To parse this JSON data, do
//
//     final converImageBase = converImageBaseFromJson(jsonString);

import 'dart:convert';

List<ConverImageBase> converImageBaseFromJson(String str) =>
    List<ConverImageBase>.from(
        json.decode(str).map((x) => ConverImageBase.fromJson(x)));

String converImageBaseToJson(List<ConverImageBase> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class ConverImageBase {
  String actualFileName;
  String manualFileName;
  dynamic fileBinaryData;
  String fileType;
  String filePath;
  dynamic externalVisitId;
  int patientVisitNo;
  int venueNo;
  int venueBranchNo;
  String actualBinaryData;
  dynamic docType;

  ConverImageBase({
    required this.actualFileName,
    required this.manualFileName,
    required this.fileBinaryData,
    required this.fileType,
    required this.filePath,
    required this.externalVisitId,
    required this.patientVisitNo,
    required this.venueNo,
    required this.venueBranchNo,
    required this.actualBinaryData,
    required this.docType,
  });

  factory ConverImageBase.fromJson(Map<String, dynamic> json) =>
      ConverImageBase(
        actualFileName: json["actualFileName"],
        manualFileName: json["manualFileName"],
        fileBinaryData: json["fileBinaryData"] ?? "",
        fileType: json["fileType"],
        filePath: json["filePath"],
        externalVisitId: json["externalVisitID"] ?? "",
        patientVisitNo: json["patientVisitNo"],
        venueNo: json["venueNo"],
        venueBranchNo: json["venueBranchNo"],
        actualBinaryData: json["actualBinaryData"],
        docType: json["docType"] ?? "",
      );

  Map<String, dynamic> toJson() => {
        "actualFileName": actualFileName,
        "manualFileName": manualFileName,
        "fileBinaryData": fileBinaryData,
        "fileType": fileType,
        "filePath": filePath,
        "externalVisitID": externalVisitId,
        "patientVisitNo": patientVisitNo,
        "venueNo": venueNo,
        "venueBranchNo": venueBranchNo,
        "actualBinaryData": actualBinaryData,
        "docType": docType,
      };
}

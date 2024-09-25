// To parse this JSON data, do
//
//     final recallEntityModel = recallEntityModelFromJson(jsonString);

import 'dart:convert';

RecallEntityModel recallEntityModelFromJson(String str) =>
    RecallEntityModel.fromJson(json.decode(str));

String recallEntityModelToJson(RecallEntityModel data) =>
    json.encode(data.toJson());

class RecallEntityModel {
  int patientvisitno;
  int isMultiEditor;
  int multieditorcount;

  RecallEntityModel({
    required this.patientvisitno,
    required this.isMultiEditor,
    required this.multieditorcount,
  });

  factory RecallEntityModel.fromJson(Map<String, dynamic> json) =>
      RecallEntityModel(
        patientvisitno: json["patientvisitno"],
        isMultiEditor: json["isMultiEditor"],
        multieditorcount: json["multieditorcount"],
      );

  Map<String, dynamic> toJson() => {
        "patientvisitno": patientvisitno,
        "isMultiEditor": isMultiEditor,
        "multieditorcount": multieditorcount,
      };
}

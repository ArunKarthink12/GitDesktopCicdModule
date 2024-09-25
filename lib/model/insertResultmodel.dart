// To parse this JSON data, do
//
//     final approveRecallButtonModel = approveRecallButtonModelFromJson(jsonString);

import 'dart:convert';

ApproveRecallButtonModel approveRecallButtonModelFromJson(String str) =>
    ApproveRecallButtonModel.fromJson(json.decode(str));

String approveRecallButtonModelToJson(ApproveRecallButtonModel data) =>
    json.encode(data.toJson());

class ApproveRecallButtonModel {
  int patientvisitno;
  int isMultiEditor;
  int multieditorcount;

  ApproveRecallButtonModel({
    required this.patientvisitno,
    required this.isMultiEditor,
    required this.multieditorcount,
  });

  factory ApproveRecallButtonModel.fromJson(Map<String, dynamic> json) =>
      ApproveRecallButtonModel(
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

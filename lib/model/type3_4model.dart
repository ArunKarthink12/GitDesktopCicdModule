// To parse this JSON data, do
//
//     final type34Model = type34ModelFromJson(jsonString);

import 'dart:convert';

List<Type34Model> type34ModelFromJson(String str) => List<Type34Model>.from(
    json.decode(str).map((x) => Type34Model.fromJson(x)));

String type34ModelToJson(List<Type34Model> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Type34Model {
  int patientvisitno;
  int isMultiEditor;
  int multieditorcount;

  Type34Model({
    required this.patientvisitno,
    required this.isMultiEditor,
    required this.multieditorcount,
  });

  factory Type34Model.fromJson(Map<String, dynamic> json) => Type34Model(
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

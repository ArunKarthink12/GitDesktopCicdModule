// To parse this JSON data, do
//
//     final type2Model = type2ModelFromJson(jsonString);

import 'dart:convert';

List<Type2Model> type2ModelFromJson(String str) =>
    List<Type2Model>.from(json.decode(str).map((x) => Type2Model.fromJson(x)));

String type2ModelToJson(List<Type2Model> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Type2Model {
  int patientvisitno;
  int isMultiEditor;
  int multieditorcount;

  Type2Model({
    required this.patientvisitno,
    required this.isMultiEditor,
    required this.multieditorcount,
  });

  factory Type2Model.fromJson(Map<String, dynamic> json) => Type2Model(
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

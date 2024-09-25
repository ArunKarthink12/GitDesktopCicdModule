// To parse this JSON data, do
//
//     final branchModel = branchModelFromJson(jsonString);

import 'dart:convert';

List<BranchModel> branchModelFromJson(String str) => List<BranchModel>.from(
    json.decode(str).map((x) => BranchModel.fromJson(x)));

String branchModelToJson(List<BranchModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class BranchModel {
  int rowNum;
  int venueBranchNo;
  String venueBranchName;
  bool isdefault;

  BranchModel({
    required this.rowNum,
    required this.venueBranchNo,
    required this.venueBranchName,
    required this.isdefault,
  });

  factory BranchModel.fromJson(Map<String, dynamic> json) => BranchModel(
        rowNum: json["row_Num"],
        venueBranchNo: json["venueBranchNo"],
        venueBranchName: json["venueBranchName"],
        isdefault: json["isdefault"],
      );

  Map<String, dynamic> toJson() => {
        "row_Num": rowNum,
        "venueBranchNo": venueBranchNo,
        "venueBranchName": venueBranchName,
        "isdefault": isdefault,
      };
}

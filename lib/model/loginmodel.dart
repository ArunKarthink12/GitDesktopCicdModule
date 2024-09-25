// To parse this JSON data, do
//
//     final loginmodel = loginmodelFromJson(jsonString);

import 'dart:convert';

Loginmodel loginmodelFromJson(String str) =>
    Loginmodel.fromJson(json.decode(str));

String loginmodelToJson(Loginmodel data) => json.encode(data.toJson());

class Loginmodel {
  bool status;
  String message;
  Data data;

  Loginmodel({
    required this.status,
    required this.message,
    required this.data,
  });

  factory Loginmodel.fromJson(Map<String, dynamic> json) => Loginmodel(
        status: json["_status"],
        message: json["_message"],
        data: Data.fromJson(json["_data"]),
      );

  Map<String, dynamic> toJson() => {
        "_status": status,
        "_message": message,
        "_data": data.toJson(),
      };
}

class Data {
  String token;
  String doctorName;
  String qualification;
  String contactNumber;
  dynamic email;
  int roleId;
  String roleDetails;
  dynamic doctorImageInNetworkUrl;
  int userNo;
  int venueNo;
  int venueBranchNo;
  List<Venubranchdetal> venubranchdetals;

  Data({
    required this.token,
    required this.doctorName,
    required this.qualification,
    required this.contactNumber,
    required this.email,
    required this.roleId,
    required this.roleDetails,
    required this.doctorImageInNetworkUrl,
    required this.userNo,
    required this.venueNo,
    required this.venueBranchNo,
    required this.venubranchdetals,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        token: json["_token"],
        doctorName: json["_doctorName"],
        qualification: json["_qualification"],
        contactNumber: json["_contactNumber"],
        email: json["_email"],
        roleId: json["_roleId"],
        roleDetails: json["_roleDetails"],
        doctorImageInNetworkUrl: json["_doctorImageInNetworkUrl"],
        userNo: json["_userNo"],
        venueNo: json["_venueNo"],
        venueBranchNo: json["_venueBranchNo"],
        venubranchdetals: List<Venubranchdetal>.from(
            json["venubranchdetals"].map((x) => Venubranchdetal.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "_token": token,
        "_doctorName": doctorName,
        "_qualification": qualification,
        "_contactNumber": contactNumber,
        "_email": email,
        "_roleId": roleId,
        "_roleDetails": roleDetails,
        "_doctorImageInNetworkUrl": doctorImageInNetworkUrl,
        "_userNo": userNo,
        "_venueNo": venueNo,
        "_venueBranchNo": venueBranchNo,
        "venubranchdetals":
            List<dynamic>.from(venubranchdetals.map((x) => x.toJson())),
      };
}

class Venubranchdetal {
  int venueBranchNo;
  String branchName;

  Venubranchdetal({
    required this.venueBranchNo,
    required this.branchName,
  });

  factory Venubranchdetal.fromJson(Map<String, dynamic> json) =>
      Venubranchdetal(
        venueBranchNo: json["_venueBranchNo"],
        branchName: json["_branchName"],
      );

  Map<String, dynamic> toJson() => {
        "_venueBranchNo": venueBranchNo,
        "_branchName": branchName,
      };
}

import 'dart:convert';
import 'dart:developer';

import 'package:doctor_module/model/patientlistmodel.dart';
import 'package:doctor_module/utils/urls.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class Viewlistservice {
  Future<Patientlistmodel?> viewListService(
      {serviceNo,
      venuBranchNo,
      serviceType,
      fromDate,
      toDate,
      searchType,
      searchVisitId,
      customerNo}) async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    try {
      var headers = {
        'Authorization': pref.getString("authToken").toString(),
        'Content-Type': 'application/json'
      };
      var data = json.encode({
        "venueNo": pref.getString("venueNo").toString(),
        "venueBranchNo": venuBranchNo.toString(),
        "fromDate": fromDate,
        "toDate": toDate,
        "userNo": pref.getString("userNo").toString(),
        "departNo": 0,
        "serviceNo": serviceNo,
        "serviceType": serviceType,
        "customerNo": customerNo,
        "routeNo": 0,
        "mainDeptno": 0,
        "pageCode": "PCRA",
        "testStatusFilterNo": 0,
        "searchText": searchVisitId.toString(),
        "searchType": searchType
      });
      log("params");
      log(data);
      var response = await http.post(
          Uri.parse(
            Urls.dash,
          ),
          body: data,
          headers: headers);

      if (response.statusCode == 200) {
        log(response.body);
        return patientlistmodelFromJson(response.body);
      } else {
        log("no data");
        Fluttertoast.showToast(msg: response.statusCode.toString());
      }
    } catch (e) {
      log(e.toString());
      rethrow;
    }
    return null;
  }
}

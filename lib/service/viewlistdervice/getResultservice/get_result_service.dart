import 'dart:convert';
import 'dart:developer';

import 'package:doctor_module/model/test_details_model.dart';
import 'package:doctor_module/utils/urls.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class GetResultService {
  Future<TestDetailsmodel?> getResultService(
      {venuBranchId, patientVisitNo}) async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    try {
      var headers = {
        'Authorization': pref.getString("authToken").toString(),
        'Content-Type': 'application/json'
      };
      var data = jsonEncode({
        "pagecode": "PCRA",
        "venueNo": pref.getString("venueNo").toString(),
        "venueBranchNo": venuBranchId,
        "userno": pref.getString("userNo").toString(),
        "patientvisitno": patientVisitNo,
        "deptno": 0,
        "serviceno": 0,
        "servicetype": ""
      });
      log(data);
      var response = await http.post(
        Uri.parse(Urls.pendinggetResult),
        body: data,
        headers: headers,
      );

      if (response.statusCode == 200) {
        log(response.body);
        return testDetailsmodelFromJson(response.body);
      } else {
        print(response.statusCode);
      }
    } catch (e) {
      log(e.toString());
      rethrow;
    }
    return null;
  }
}

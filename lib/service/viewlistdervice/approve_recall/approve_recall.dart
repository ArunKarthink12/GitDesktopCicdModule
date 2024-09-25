import 'dart:developer';

import 'package:doctor_module/utils/urls.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

import '../../../model/insertResultmodel.dart';

class Approve_recheck {
  Future<ApproveRecallButtonModel?> approveRecheck({params}) async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    try {
      var headers = {
        'Authorization': pref.getString("authToken").toString(),
        'Content-Type': 'application/json'
      };
      var data = params;

      var response = await http.post(
        Uri.parse(Urls.approve_recall_type_1),
        body: data,
        headers: headers,
      );

      if (response.statusCode == 200) {
        log(response.body);
        return approveRecallButtonModelFromJson(response.body);
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

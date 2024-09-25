import 'dart:developer';

import 'package:doctor_module/model/type2model.dart';
import 'package:doctor_module/utils/urls.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class ApproveAndRecallType_2Service {
  Future getapprovedtypeResultService({Object? params}) async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    try {
      var headers = {
        'Authorization': pref.getString("authToken").toString(),
        'Content-Type': 'application/json'
      };
      var data = params;

      print(params);
      var response = await http.post(
        Uri.parse(Urls.approve_recall_type_2),
        body: data,
        headers: headers,
      );

      if (response.statusCode == 200) {
        log(response.body);
        print(response.statusCode);
        print("object success");
        return type2ModelFromJson(response.body);
      } else {
        print(response.statusCode);
      }
    } catch (e) {
      log("service error :: $e");
      rethrow;
    }
  }
}

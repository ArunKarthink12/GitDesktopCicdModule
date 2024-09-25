import 'dart:convert';
import 'dart:developer';

import 'package:doctor_module/model/routedetail.dart';
import 'package:doctor_module/utils/urls.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class RoutelistService {
  Future routDetailsservice({fromDate, toDate}) async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    try {
      var headers = {
        'Authorization': pref.getString("authToken").toString(),
        'Content-Type': 'application/json'
      };
      var data = json.encode({
        "venueNo": pref.getString("venueNo").toString(),
        "venueBranchNo": pref.getString("venueBranchNo").toString()
      });

      var response = await http.post(
          Uri.parse(
            Urls.routeDetails,
          ),
          body: data,
          headers: headers);

      if (response.statusCode == 200) {
        log(response.body);
        return routemodelFromJson(response.body);
      } else {}
    } catch (e) {
      log(e.toString());
      rethrow;
    }
  }
}

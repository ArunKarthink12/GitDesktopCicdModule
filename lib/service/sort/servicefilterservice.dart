import 'dart:convert';
import 'dart:developer';

import 'package:doctor_module/model/branchmodel.dart';
import 'package:doctor_module/model/servicefiltermodel.dart';
import 'package:doctor_module/utils/urls.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class ServicefilterService {
  Future serviceFiltersservice() async {
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
      log("Service :: ${data}");

      var response = await http.post(
          Uri.parse(
            Urls.service,
          ),
          body: data,
          headers: headers);
      log("Service :: ${response.statusCode}");

      if (response.statusCode == 200) {
        log("Service :: ${response.statusCode}");

        // log("Service :: ${response.body}");
        return servicefiltermodelFromJson(response.body);
      } else {
        log("Service :: ${response.statusCode}");
      }
    } catch (e) {
      rethrow;
    }
  }

  Future branchFilterController() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    try {
      var headers = {
        'Authorization': pref.getString("authToken").toString(),
        'Content-Type': 'application/json'
      };

      var response = await http.get(
          Uri.parse(
              "https://lims.yungtrepreneur.com/DAAPI/api/doctorApi/getUserBranchList?VenueNo=${pref.getString("venueNo").toString()}&VenueBranchNo=${pref.getString("venueBranchNo").toString()}&userno=${pref.getString("userNo").toString()}"),
          // "http://uat.yungtrepreneur.com/DAAPI/api/doctorApi/getUserBranchList?VenueNo=${pref.getString("venueNo").toString()}&VenueBranchNo=${pref.getString("venueBranchNo").toString()}&userno=${pref.getString("userNo").toString()}"),
          headers: headers);

      if (response.statusCode == 200) {
        print("objectbranch");
        log(response.body);
        return branchModelFromJson(response.body);
      } else {
        print(response.statusCode);
      }
    } catch (e) {
      rethrow;
    }
  }
}

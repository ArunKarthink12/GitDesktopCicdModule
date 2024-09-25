import 'dart:convert';
import 'dart:developer';

// import 'package:doctor_module/const/styleText.dart';
import 'package:doctor_module/model/approvedtestdetailsmodel.dart';
import 'package:doctor_module/utils/urls.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class GetapprovedResultService {
  Future<ApprovedTestDetailsmodel?> getapprovedResultService(
      {patientVisitNo}) async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    try {
      var headers = {
        'Authorization': pref.getString("authToken").toString(),
        'Content-Type': 'application/json'
      }; 
      log(pref.getString("authToken").toString());
      var data = jsonEncode({
        "pagecode": "PCRR",
        "venueNo": pref.getString("venueNo").toString(),
        "venueBranchNo": pref.getString("venueBranchNo").toString(),
        "patientvisitno": patientVisitNo,
      });
      print(data);
      var response = await http.post(
        Uri.parse(Urls.approvedTestDetails),
        body: data,
        headers: headers,
      );

      if (response.statusCode == 200) {
        log("message serv:${response.body}");
        return approvedTestDetailsmodelFromJson(response.body);
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

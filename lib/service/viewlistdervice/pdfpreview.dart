import 'dart:convert';
import 'dart:developer';

import 'package:doctor_module/model/pdfviewmodel.dart';
import 'package:doctor_module/utils/urls.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class Pdfpreviewservice {
  Future<List<PdfViewModel>?> pdfPreviewService(
      {orderlistno, patientNo, resultType}) async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    try {
      var headers = {
        'Authorization': pref.getString("authToken").toString(),
        'Content-Type': 'application/json'
      };
      var data = json.encode({
        "pagecode": "PCRA",
        "venueNo": pref.getString("venueNo").toString(),
        "venueBranchNo": pref.getString("venueBranchNo").toString(),
        "userno": pref.getString("userNo").toString(),
        "patientvisitno": patientNo,
        "emailid": "",
        "mobile": "",
        "fullname": "Preview",
        "visitid": "0000",
        "resulttypenos": resultType,
        "orderlistnos": orderlistno,
        "isheaderfooter": 0,
        "process": 5
      });

      log("params");
      log(data);
      var response = await http.post(
          Uri.parse(
            Urls.pdfPreview,
          ),
          body: data,
          headers: headers);

      if (response.statusCode == 200) {
        log("log Responce${response.body}");

        return pdfViewModelFromJson(response.body);
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

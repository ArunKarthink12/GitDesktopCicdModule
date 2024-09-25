import 'dart:convert';
import 'dart:developer';

import 'package:doctor_module/model/imageConverter.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
// import 'package:shared_preferences/shared_preferences.dart';

class ConverBaseImageService {
  Future baseImageConverter({externalVisitID, patientVisitNo}) async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    log("ght");
    try {
      var headers = {
        'Content-Type': 'application/json',
        'Authorization':
            'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1bmlxdWVfbmFtZSI6ImxpbXNAeW0uY29tIiwibmJmIjoxNzIzMTk2NzI2LCJleHAiOjE3MjMyODMxMjYsImlhdCI6MTcyMzE5NjcyNn0.bs3y9VzqNToAJl-eZ7mSTLC7WJWI6cYuK84fQfYbwy0'
      };
      var data = json.encode({
        "externalVisitID": externalVisitID,
        "PatientVisitNo": patientVisitNo,
        "venueNo": "1",
        "venueBranchNo": "1"
      });
      log(data);
      var request =
          await http.post(body: data, headers: headers, Uri.parse(""));

      if (request.statusCode == 200) {
        log("message :: ${request.body}");
        return converImageBaseFromJson(request.body);
        // print(await response.stream.bytesToString());
      } else {
        print(request.statusCode);
      }

      //   var data = json.encode({
      //     "externalVisitID": externalVisitID.toString(),
      //     "PatientVisitNo": patientVisitNo.toString(),
      //     "venueNo": "1",
      //     "venueBranchNo": "1",
      //   });

      //   log("params: $data");

      //   var response = await http.post(
      //     Uri.parse(
      //         "http://uat.yungtrepreneur.com/Service/api/FrontOffice/ConvertToBase64"),
      //     body: data,
      //     headers: headers,
      //   );

      //   log("Status Code: ${response.statusCode}");
      //   log("Response Body: ${response.body}");

      //   if (response.statusCode == 200) {
      //     log("Success: ${response.body}");
      //     return converImageBaseFromJson(response.body);
      //   } else {
      //     log("Failed: ${response.statusCode}");
      //     Fluttertoast.showToast(msg: "Error: ${response.statusCode}");
      //   }
    } catch (e) {
      log("Exception: $e");
      rethrow;
    }
    // // return null;
  }
}

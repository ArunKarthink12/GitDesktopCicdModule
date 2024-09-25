import 'dart:developer';

import 'package:doctor_module/model/approvedtestdetailsmodel.dart';
import 'package:doctor_module/service/viewlistdervice/getResultservice/get_approved_testresult.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class GetapprovedResultController extends GetxController {
  RxList<ApprovedTestDetailsmodel> getapprovedData =
      <ApprovedTestDetailsmodel>[].obs;
  RxBool isLoading = false.obs;
  var client = GetapprovedResultService();
  getapprovedResultController({patientVisitNo}) async {
    getapprovedData.clear();
    isLoading(false);
    try {
      var responce =
          await client.getapprovedResultService(patientVisitNo: patientVisitNo);
      if (responce != null) {
        getapprovedData.add(responce);
        log("controller message");
        isLoading(true);
      } else {
        log("null error");
        isLoading(true);
      }
    } on PlatformException catch (err) {
      log("Ex");
      log(err.code.toString());
    } catch (e) {
      log("Error :: $e ");
    }
  }
}

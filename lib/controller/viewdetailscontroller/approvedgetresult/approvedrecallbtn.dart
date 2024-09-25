import 'dart:developer';

import 'package:doctor_module/model/insertResultmodel.dart';
import 'package:doctor_module/service/viewlistdervice/approve_recall/approve_recall_button.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class GetapprovedRecallbtnController extends GetxController {
  RxList<ApproveRecallButtonModel> getapprovedrecallbtndata =
      <ApproveRecallButtonModel>[].obs;
  RxBool isLoading = false.obs;
  var client = ApproverecallbtnService();

  getapprovedrecallbuttonController({params}) async {
    getapprovedrecallbtndata.clear();
    isLoading(false);

    try {
      var responce = await client.approveRecallBtn(params: params);
      if (responce != null) {
        getapprovedrecallbtndata.add(responce);
        log("controller message");

        print(responce.patientvisitno);
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

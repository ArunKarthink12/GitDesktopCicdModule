import 'dart:developer';

import 'package:doctor_module/service/viewlistdervice/approve_recall_type3_4/approve_recall_type_3_4.dart';
import 'package:get/get.dart';

class AppRe_type_3_4Controller extends GetxController {
  RxList getListData = [].obs;
  RxBool isLoading = false.obs;
  var client = ApproveAndRecallType_3_4Service();

  appReType_3_4Controller({params}) async {
    isLoading(false);
    getListData.clear();
    try {
      var responce = await client.getapprovedResultService(params: params);
      if (responce != null) {
        getListData.add(responce);
        isLoading(true);
      } else {
        isLoading(true);
      }
    } catch (e) {
      isLoading(true);
      log("error $e");
      rethrow;
    }
  }
}

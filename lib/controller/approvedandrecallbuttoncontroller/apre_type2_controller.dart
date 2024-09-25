import 'dart:developer';

import 'package:doctor_module/service/viewlistdervice/approveltype2/approve_type_2service.dart';
import 'package:get/get.dart';

class AppRe_type_2_Controller extends GetxController {
  RxList getListData = [].obs;
  RxBool isLoading = false.obs;
  var client = ApproveAndRecallType_2Service();

  appReType_2Controller({params}) async {
    isLoading(false);
    getListData.clear();
    try {
      var responce = await client.getapprovedtypeResultService(params: params);
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

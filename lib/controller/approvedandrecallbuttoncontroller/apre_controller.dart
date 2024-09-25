import 'dart:developer';

import 'package:doctor_module/service/viewlistdervice/approve_recall/approve_recall.dart';
import 'package:get/get.dart';

class AppReController extends GetxController {
  RxList getListData = [].obs;
  RxBool isLoading = false.obs;
  var client = Approve_recheck();

  appReController({params}) async {
    isLoading(false);
    getListData.clear();
    try {
      var responce = await client.approveRecheck(params: params);
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

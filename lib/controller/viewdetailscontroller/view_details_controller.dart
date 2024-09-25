import 'dart:developer';

import 'package:doctor_module/model/patientlistmodel.dart';
import 'package:doctor_module/service/viewlistdervice/viewlistservice.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ViewdetailsController extends GetxController {
  RxBool selectall = false.obs;
  RxBool isIconVisible = false.obs;

  var service = Viewlistservice();
  RxBool isloginLoad = false.obs;
  TextEditingController visitIdSearch = TextEditingController();
  List<Patientlistmodel> getviewlistdata = <Patientlistmodel>[];
  DateTime selectedFromDate =
      DateTime(DateTime.now().year, DateTime.now().month, 1);
  DateTime selectedToDate =
      DateTime(DateTime.now().year, DateTime.now().month, DateTime.now().day);
  RxString selectFromDate = "".obs;
  RxString selectToDate = "".obs;
  RxString tempselectFromDate = "".obs;
  RxString tempselectToDate = "".obs;
  RxString docName = ''.obs;
  RxString searchType = "0".obs;
  RxString searchName = "All".obs;
  RxInt patientVisitNo = 0.obs;
  Future viewlistController(
      {serviceId,
      serviceType,
      fromDate,
      toDate,
      visitId,
      customerNo,
      venuBranchNo}) async {
    isloginLoad(false);
    try {
      var response = await service.viewListService(
        venuBranchNo: venuBranchNo,
        customerNo: customerNo,
        searchVisitId: visitId,
        searchType: searchType.value,
        serviceNo: serviceId,
        serviceType: serviceType,
        fromDate: fromDate,
        toDate: toDate,
      );

      if (response != null) {
        getviewlistdata.clear();
        getviewlistdata.add(response);

        print(getviewlistdata);
        isloginLoad(true);
      } else {
        isloginLoad(true);
      }
    } catch (e) {
      log("error$e");
      rethrow;
    }
  }
}

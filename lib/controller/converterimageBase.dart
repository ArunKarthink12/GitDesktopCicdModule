import 'dart:developer';

import 'package:doctor_module/service/viewlistdervice/converbase64.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../model/imageConverter.dart';

class ConverBaseSixtyFour extends GetxController {
  var client = ConverBaseImageService();
  RxBool isloginLoad = false.obs;
  RxList<List<ConverImageBase>> getConvertImageData =
      <List<ConverImageBase>>[].obs;

  imagePreviewController({
    patientVisitId,
    externalVistiId,
  }) async {
    // isloginLoad(false);
    getConvertImageData.clear();

    try {
      var response = await client.baseImageConverter(
        externalVisitID: externalVistiId,
        patientVisitNo: patientVisitId,
      );
      getConvertImageData.clear();
      if (response != null) {
        getConvertImageData.add(response);

        log("controller Data " +
            getConvertImageData.first.first.fileType.toString());

        isloginLoad(true);
      } else {
        isloginLoad(true);
      }
    } catch (e) {
      log("error :: $e");
      rethrow;
    }
  }
}

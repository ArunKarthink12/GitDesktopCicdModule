import 'dart:developer';

import 'package:doctor_module/model/pdfviewmodel.dart';
import 'package:doctor_module/service/viewlistdervice/pdfpreview.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PdfviewController extends GetxController {
  var service = Pdfpreviewservice();
  RxBool isloginLoad = false.obs;
  List<List<PdfViewModel>> getviewlistdata = <List<PdfViewModel>>[];
  RxBool selectAll = false.obs;
  Future pdfPreviewController(
      {orderlistno, patientNo, resultType, context}) async {
    isloginLoad(false);
    getviewlistdata.clear();
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) {
        return AlertDialog(
            insetPadding: EdgeInsets.zero,
            contentPadding: EdgeInsets.zero,
            clipBehavior: Clip.antiAliasWithSaveLayer,
            content: Builder(builder: (context) {
              return const SizedBox(
                  height: 50,
                  width: 50,
                  child: Center(child: CircularProgressIndicator()));
            }));
      },
    );
    try {
      print("object");
      var response = await service.pdfPreviewService(
          orderlistno: orderlistno,
          patientNo: patientNo,
          resultType: resultType);

      if (response != null) {
        getviewlistdata.add(response);

        print(getviewlistdata.first.first.patientExportFile);

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

import 'dart:convert';
import 'dart:developer';

import 'package:doctor_module/controller/approvedandrecallbuttoncontroller/apre_3_4controller.dart';
import 'package:doctor_module/controller/approvedandrecallbuttoncontroller/apre_controller.dart';
import 'package:doctor_module/controller/approvedandrecallbuttoncontroller/apre_type2_controller.dart';
import 'package:doctor_module/controller/sort/servicefiltercontroller.dart';
import 'package:doctor_module/model/test_details_model.dart';
import 'package:doctor_module/service/viewlistdervice/getResultservice/get_result_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class GetResultListcolntoller extends GetxController {
  RxList<TestDetailsmodel> getData = <TestDetailsmodel>[].obs;
  RxBool isLoading = false.obs;
  var client = GetResultService();
  RxString taskDttm = "".obs;
  RxBool isExpanded = true.obs;
  List<Lstorderlist> entityData = <Lstorderlist>[].obs;

  getResultController({venuBranchId, patientVisitNo}) async {
    getData.clear();
    isLoading(false);

    try {
      var responce = await client.getResultService(
          venuBranchId: venuBranchId, patientVisitNo: patientVisitNo);
      if (responce != null) {
        getData.add(responce);
        log("controller message");

        print(responce.lstvisit);

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

//SD
  Future draft() async {
    // SharedPreferences pref = await SharedPreferences.getInstance();
    // getData.first.venuebranchno =
    //     int.parse(pref.getString("venueBranchNo").toString());
    // getData.first.venueno = int.parse(pref.getString("venueNo").toString());
    // getData.first.userno = int.parse(pref.getString("userNo").toString());
    // getData.first.action = "SD";
    // var json = jsonEncode(getData.first);

    // print("object-type-1");
    // log(json);
    // Future.delayed(Duration.zero, () async {
    //   print("print");
    //   await AppReController().appReController(params: json);
    // });
  }

//SP
  Future preview() async {}
//SV
  Future action({action}) async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    getData.first.venuebranchno =
        int.parse(pref.getString("venueBranchNo").toString());
    getData.first.venueno = int.parse(pref.getString("venueNo").toString());
    getData.first.userno = int.parse(pref.getString("userNo").toString());
    getData.first.action = action;

    var json = jsonEncode(getData.first);

    for (var i = 0; i < getData.first.lstvisit.first.lstorderlist.length; i++) {
      if (getData.first.lstvisit.first.lstorderlist[i].resulttypeno == 1 &&
          getData.first.lstvisit.first.lstorderlist[i].ischecked == true) {
        // if () {
        print("object-type-1");
        log(json);
        Future.delayed(Duration.zero, () async {
          print("print");
          await AppReController().appReController(params: json);
        });
        //  else {
        //   print("type1 not true");
        // }
      }
      if (getData.first.lstvisit.first.lstorderlist[i].resulttypeno == 2 &&
          getData.first.lstvisit.first.lstorderlist[i].ischecked == true) {
        // if () {
        try {
          var params2 = [
            {
              "venueNo": pref.getString("venueNo").toString(),
              "venueBranchNo":
                  ServicefilterController().tempSelectedBranchId.value,
              "userno": pref.getString("userNo").toString(),
              "pagecode": "PCRA",
              "action": action,
              "patientno": getData.first.lstvisit.first.patientno,
              "patientvisitno": getData.first.lstvisit.first.patientvisitno,
              "patientid": getData.first.lstvisit.first.patientid,
              "fullname": getData.first.lstvisit.first.fullname,
              "agetype": getData.first.lstvisit.first.agetype,
              "gender": getData.first.lstvisit.first.gender,
              "visitid": getData.first.lstvisit.first.visitid,
              "extenalvisitid": getData.first.lstvisit.first.extenalvisitid,
              "visitdttm": getData.first.lstvisit.first.visitdttm,
              "referraltype": getData.first.lstvisit.first.referraltype,
              "customername": getData.first.lstvisit.first.customername,
              "physicianname": getData.first.lstvisit.first.physicianname,
              "visstat": false,
              "visremarks": false,
              "address": getData.first.lstvisit.first.address,
              "dob": getData.first.lstvisit.first.dob,
              "urntype": getData.first.lstvisit.first.urntype,
              "urnid": getData.first.lstvisit.first.urnid,
              "samplecollectedon":
                  getData.first.lstvisit.first.samplecollectedon,
              "enteredon": getData.first.lstvisit.first.enteredon,
              "validatedon": getData.first.lstvisit.first.validatedon,
              "approvedon": getData.first.lstvisit.first.approvedon,
              "orderlistno":
                  getData.first.lstvisit.first.lstorderlist[i].orderlistno,
              "departmentno":
                  getData.first.lstvisit.first.lstorderlist[i].departmentno,
              "departmentname":
                  getData.first.lstvisit.first.lstorderlist[i].departmentname,
              "departmentseqno":
                  getData.first.lstvisit.first.lstorderlist[i].departmentseqno,
              "samplename":
                  getData.first.lstvisit.first.lstorderlist[i].samplename,
              "servicetype":
                  getData.first.lstvisit.first.lstorderlist[i].servicetype,
              "serviceno":
                  getData.first.lstvisit.first.lstorderlist[i].serviceno,
              "servicename":
                  getData.first.lstvisit.first.lstorderlist[i].servicename,
              "serviceseqno":
                  getData.first.lstvisit.first.lstorderlist[i].serviceno,
              "barcodeno":
                  getData.first.lstvisit.first.lstorderlist[i].barcodeno,
              "risrerun": false,
              "risrecollect": false,
              "risrecheck":
                  getData.first.lstvisit.first.lstorderlist[i].risrecheck,
              "isrecall": false,
              "isoutsovurce": false,
              "isoutsourceattachment": false,
              "isattachment": false,
              "oisremarks": false,
              "oistat": false,
              "isoledit": false,
              "isabnormal":
                  getData.first.lstvisit.first.lstorderlist[i].isabnormal,
              "iscritical":
                  getData.first.lstvisit.first.lstorderlist[i].iscritical,
              "ischecked":
                  getData.first.lstvisit.first.lstorderlist[i].ischecked,
              "isrerun": false,
              "isrecollect": false,
              "isrecheck": false,
              "reportstatus":
                  getData.first.lstvisit.first.lstorderlist[i].reportstatus,
              "resultstatus": 1,
              "resultpattern": 1,
              "patterndescription": "",
              "colonycount": 3,
              "wetpreparation": "",
              "lstgramstainmb": [],
              "gramstaintext": "",
              "comments": "",
              "lstorg": [],
              "organtixml": null,
              "approvalDoctor": getData.first.lstvisit.first.lstorderlist[i]
                  .lstorderdetail.first.approvalDoctor,
              "venueBranchName": "",
              "ismbnoresult": false,
              "isPopupNeeded": 0,
              "sampleNo": 3,
              "containerNo": 1,
              "specimenSource": 0,
              "specimenCond": 0,
              "additionalresultpattern": ""
            }
          ];
          log("params__2");
          log(params2.toString());
          var json2 = jsonEncode(params2);
          Future.delayed(Duration.zero, () async {
            await AppRe_type_2_Controller()
                .appReType_2Controller(params: json2);
          });
        } catch (e) {
          log(e.toString());
        }
      }

      if (getData.first.lstvisit.first.lstorderlist[i].resulttypeno != 2 &&
          getData.first.lstvisit.first.lstorderlist[i].resulttypeno != 1 &&
          getData.first.lstvisit.first.lstorderlist[i].ischecked == true) {
        var params3 = [];
        for (var j = 0;
            j <
                getData
                    .first.lstvisit.first.lstorderlist[i].lstorderdetail.length;
            j++) {
          params3 = [
            {
              "venueNo": pref.getString("venueNo").toString(),
              "venueBranchNo":
                  ServicefilterController().tempSelectedBranchId.value,
              "userno": pref.getString("userNo").toString(),
              "pagecode": "PCRA",
              "action": action,
              "patientno": getData.first.lstvisit.first.patientno,
              "patientvisitno": getData.first.lstvisit.first.patientvisitno,
              "patientid": getData.first.lstvisit.first.patientid,
              "fullname": "",
              "agetype": "",
              "gender": "",
              "visitid": "",
              "extenalvisitid": "",
              "visitdttm": "",
              "referraltype": "",
              "customername": "",
              "physicianname": "",
              "visstat": false,
              "visremarks": false,
              "address": "",
              "dob": "",
              "urntype": "",
              "urnid": "",
              "samplecollectedon": "",
              "enteredon": "",
              "validatedon": "",
              "approvedon": "",
              "orderlistno":
                  getData.first.lstvisit.first.lstorderlist[i].orderlistno,
              "departmentno": 0,
              "departmentname": "",
              "departmentseqno": 0,
              "samplename": "",
              "barcodeno": "",
              "servicetype": "",
              "serviceno":
                  getData.first.lstvisit.first.lstorderlist[i].serviceno,
              "servicename":
                  getData.first.lstvisit.first.lstorderlist[i].servicename,
              "serviceseqno":
                  getData.first.lstvisit.first.lstorderlist[i].serviceseqno,
              "risrerun": false,
              "risrecollect": false,
              "risrecheck":
                  getData.first.lstvisit.first.lstorderlist[i].risrecheck,
              "isrecall": false,
              "isoutsource": false,
              "isoutsourceattachment": false,
              "isattachment": false,
              "oisremarks": false,
              "oistat": false,
              "isoledit": false,
              "isabnormal": false,
              "iscritical": false,
              "ischecked":
                  getData.first.lstvisit.first.lstorderlist[i].ischecked,
              "isrerun": false,
              "isrecollect": false,
              "isrecheck": false,
              "templateno": 0,
              "icmrPatientId": getData
                  .first.lstvisit.first.lstorderlist[i].icmrPatientId
                  .toString(),
              "srfNumber": getData
                  .first.lstvisit.first.lstorderlist[i].srfNumber
                  .toString(),
              "result": "",
              "comments": "",
              "isdraft": false,
              "approvalDoctor": 0,
              "reportstatus":
                  getData.first.lstvisit.first.lstorderlist[i].reportstatus,
              "resultstatus": 1,
              "orderdetailsno": getData.first.lstvisit.first.lstorderlist[i]
                  .lstorderdetail[j].orderdetailsno,
              "subtestno": getData.first.lstvisit.first.lstorderlist[i]
                  .lstorderdetail[j].subtestno,
              "isMultiEditor": 0,
              "multieditorcount": 0
            }
          ];
        }
        log("params 3_4");
        log(params3.toString());
        var json = jsonEncode(params3);

        if (getData.first.lstvisit.first.lstorderlist[i].ischecked == true) {
          Future.delayed(Duration.zero, () async {
            await AppRe_type_3_4Controller()
                .appReType_3_4Controller(params: json);
          });
        }
        // else {
        //   print("type 3 & 4 not true");
        // }
      }
    }
  }

  Future reCheck() async {
    Get.lazyPut(() => AppReController());
    Get.lazyPut(() => ServicefilterController());
    Get.lazyPut(() => AppRe_type_3_4Controller());
    Get.lazyPut(() => AppRe_type_2_Controller());
    SharedPreferences pref = await SharedPreferences.getInstance();
    var json = jsonEncode(getData.first);
    log(json);
    for (var i = 0; i < getData.first.lstvisit.first.lstorderlist.length; i++) {
      if (getData.first.lstvisit.first.lstorderlist[i].resulttypeno == 1) {
        print("object-type-1");
        Future.delayed(Duration.zero, () async {
          await AppReController().appReController(params: json);
        });
      } else if (getData.first.lstvisit.first.lstorderlist[i].resulttypeno ==
          2) {
        print("00${ServicefilterController().tempSelectedBranchId.value}");
        try {
          var params2 = [
            {
              "venueNo": pref.getString("venueNo").toString(),
              "venueBranchNo":
                  ServicefilterController().tempSelectedBranchId.value,
              "userno": pref.getString("userNo").toString(),
              "pagecode": "PCRA",
              "action": "SV",
              "patientno": getData.first.lstvisit.first.patientno,
              "patientvisitno": getData.first.lstvisit.first.patientvisitno,
              "patientid": getData.first.lstvisit.first.patientid,
              "fullname": getData.first.lstvisit.first.fullname,
              "agetype": getData.first.lstvisit.first.agetype,
              "gender": getData.first.lstvisit.first.gender,
              "visitid": getData.first.lstvisit.first.visitid,
              "extenalvisitid": getData.first.lstvisit.first.extenalvisitid,
              "visitdttm": getData.first.lstvisit.first.visitdttm,
              "referraltype": getData.first.lstvisit.first.referraltype,
              "customername": getData.first.lstvisit.first.customername,
              "physicianname": getData.first.lstvisit.first.physicianname,
              "visstat": false,
              "visremarks": false,
              "address": getData.first.lstvisit.first.address,
              "dob": getData.first.lstvisit.first.dob,
              "urntype": getData.first.lstvisit.first.urntype,
              "urnid": getData.first.lstvisit.first.urnid,
              "samplecollectedon":
                  getData.first.lstvisit.first.samplecollectedon,
              "enteredon": getData.first.lstvisit.first.enteredon,
              "validatedon": getData.first.lstvisit.first.validatedon,
              "approvedon": getData.first.lstvisit.first.approvedon,
              "orderlistno":
                  getData.first.lstvisit.first.lstorderlist[i].orderlistno,
              "departmentno":
                  getData.first.lstvisit.first.lstorderlist[i].departmentno,
              "departmentname":
                  getData.first.lstvisit.first.lstorderlist[i].departmentname,
              "departmentseqno":
                  getData.first.lstvisit.first.lstorderlist[i].departmentseqno,
              "samplename":
                  getData.first.lstvisit.first.lstorderlist[i].samplename,
              "servicetype":
                  getData.first.lstvisit.first.lstorderlist[i].servicetype,
              "serviceno":
                  getData.first.lstvisit.first.lstorderlist[i].serviceno,
              "servicename":
                  getData.first.lstvisit.first.lstorderlist[i].servicename,
              "serviceseqno":
                  getData.first.lstvisit.first.lstorderlist[i].serviceno,
              "barcodeno":
                  getData.first.lstvisit.first.lstorderlist[i].barcodeno,
              "risrerun": false,
              "risrecollect": false,
              "risrecheck":
                  getData.first.lstvisit.first.lstorderlist[i].risrecheck,
              "isrecall": false,
              "isoutsovurce": false,
              "isoutsourceattachment": false,
              "isattachment": false,
              "oisremarks": false,
              "oistat": false,
              "isoledit": false,
              "isabnormal": false,
              "iscritical": false,
              "ischecked":
                  getData.first.lstvisit.first.lstorderlist[i].ischecked,
              "isrerun": false,
              "isrecollect": false,
              "isrecheck": false,
              "reportstatus":
                  getData.first.lstvisit.first.lstorderlist[i].reportstatus,
              "resultstatus": 1,
              "resultpattern": 1,
              "patterndescription": "",
              "colonycount": 3,
              "wetpreparation": "",
              "lstgramstainmb": [],
              "gramstaintext": "",
              "comments": "",
              "lstorg": [],
              "organtixml": null,
              "approvalDoctor": getData.first.lstvisit.first.lstorderlist[i]
                  .lstorderdetail.first.approvalDoctor,
              "venueBranchName": "",
              "ismbnoresult": false,
              "isPopupNeeded": 0,
              "sampleNo": 3,
              "containerNo": 1,
              "specimenSource": 0,
              "specimenCond": 0,
              "additionalresultpattern": ""
            }
          ];
          print("type 2 is true");

          var json2 = jsonEncode(params2);
          log(json2.toString());
          Future.delayed(Duration.zero, () async {
            await AppRe_type_2_Controller()
                .appReType_2Controller(params: json2);
          });
        } catch (e) {
          log(e.toString());
        }
      } else {
        var params3 = [];
        for (var j = 0;
            j <
                getData
                    .first.lstvisit.first.lstorderlist[i].lstorderdetail.length;
            j++) {
          params3 = [
            {
              "venueNo": pref.getString("venueNo").toString(),
              "venueBranchNo":
                  ServicefilterController().tempSelectedBranchId.value,
              "userno": pref.getString("userNo").toString(),
              "pagecode": "PCRA",
              "action": "SV",
              "patientno": getData.first.lstvisit.first.patientno,
              "patientvisitno": getData.first.lstvisit.first.patientvisitno,
              "patientid": getData.first.lstvisit.first.patientid,
              "fullname": "",
              "agetype": "",
              "gender": "",
              "visitid": "",
              "extenalvisitid": "",
              "visitdttm": "",
              "referraltype": "",
              "customername": "",
              "physicianname": "",
              "visstat": false,
              "visremarks": false,
              "address": "",
              "dob": "",
              "urntype": "",
              "urnid": "",
              "samplecollectedon": "",
              "enteredon": "",
              "validatedon": "",
              "approvedon": "",
              "orderlistno":
                  getData.first.lstvisit.first.lstorderlist[i].orderlistno,
              "departmentno": 0,
              "departmentname": "",
              "departmentseqno": 0,
              "samplename": "",
              "barcodeno": "",
              "servicetype": "",
              "serviceno":
                  getData.first.lstvisit.first.lstorderlist[i].serviceno,
              "servicename":
                  getData.first.lstvisit.first.lstorderlist[i].servicename,
              "serviceseqno":
                  getData.first.lstvisit.first.lstorderlist[i].serviceseqno,
              "risrerun": false,
              "risrecollect": false,
              "risrecheck":
                  getData.first.lstvisit.first.lstorderlist[i].risrecheck,
              "isrecall": false,
              "isoutsource": false,
              "isoutsourceattachment": false,
              "isattachment": false,
              "oisremarks": false,
              "oistat": false,
              "isoledit": false,
              "isabnormal": false,
              "iscritical": false,
              "ischecked":
                  getData.first.lstvisit.first.lstorderlist[i].ischecked,
              "isrerun": false,
              "isrecollect": false,
              "isrecheck": false,
              "templateno": 0,
              "icmrPatientId": "",
              "srfNumber": "",
              "result": "",
              "comments": "",
              "isdraft": false,
              "approvalDoctor": 0,
              "reportstatus":
                  getData.first.lstvisit.first.lstorderlist[i].reportstatus,
              "resultstatus": 1,
              "orderdetailsno": getData.first.lstvisit.first.lstorderlist[i]
                  .lstorderdetail[j].orderdetailsno,
              "subtestno": getData.first.lstvisit.first.lstorderlist[i]
                  .lstorderdetail[j].subtestno,
              "isMultiEditor": 0,
              "multieditorcount": 0
            }
          ];
        }

        var json = jsonEncode(params3);
        log(json);

        Future.delayed(Duration.zero, () async {
          await AppRe_type_3_4Controller()
              .appReType_3_4Controller(params: json);
        });
      }
    }
  }
}

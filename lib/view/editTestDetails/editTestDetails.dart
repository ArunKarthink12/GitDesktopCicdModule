// import 'dart:math';

// import 'dart:math';

import 'dart:developer';

import 'package:doctor_module/const/responsive.dart';
import 'package:doctor_module/const/styleText.dart';
import 'package:doctor_module/controller/viewdetailscontroller/getresult/get_result_listColntoller.dart';
import 'package:doctor_module/model/test_details_model.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
// import 'package:intl/intl.dart';

Future editReportStatusTestWidget(
    {List<Lstvisit>? orderListData,
    context,
    selectedIndex,
    reportStatus,
    widgetIndex}) {
  double itemHeight = 50.0; // Approximate height of each item including padding
  double totalHeight = itemHeight * 7;

  // Set a maximum height to prevent the dialog from becoming too large
  double maxHeight = MediaQuery.of(context).size.height;
  double containerHeight = totalHeight > maxHeight ? maxHeight : totalHeight;

  return showDialog(
      context: context,
      builder: (context) {
        return Dialog(
          backgroundColor: Colors.white,
          child: SizedBox(
            width: MediaQuery.of(context).size.width * 0.9,
            height: containerHeight +
                120.0, // Adding extra height for the title and padding

            // height: MediaQuery.of(context).size.height,
            child: Column(
              children: [
                SizedBox(
                  height: 1.0.hp,
                ),
                Align(
                  alignment: Alignment.center,
                  child: Text(
                    orderListData![widgetIndex]
                        .lstorderlist[selectedIndex]
                        .servicename
                        .toUpperCase(),
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Divider(),
                Container(
                  padding: const EdgeInsets.all(16.0),
                  width: MediaQuery.of(context).size.width,
                  child: Column(
                    children: [
                      SizedBox(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                const Text("Critical"),
                                Checkbox(
                                  value: orderListData[widgetIndex]
                                      .lstorderlist[selectedIndex]
                                      .iscritical,
                                  onChanged: (value) {
                                    orderListData[widgetIndex]
                                            .lstorderlist[selectedIndex]
                                            .iscritical =
                                        !orderListData[widgetIndex]
                                            .lstorderlist[selectedIndex]
                                            .iscritical;
                                    orderListData[widgetIndex]
                                        .lstorderlist[selectedIndex]
                                        .isabnormal = false;

                                    update(getResultListcolntoller);
                                    Get.forceAppUpdate();
                                  },
                                )
                              ],
                            ),
                            Row(
                              children: [
                                const Text("Abnormal"),
                                Checkbox(
                                  value: orderListData[widgetIndex]
                                      .lstorderlist[selectedIndex]
                                      .isabnormal,
                                  onChanged: (value) {
                                    orderListData[widgetIndex]
                                            .lstorderlist[selectedIndex]
                                            .isabnormal =
                                        !orderListData[widgetIndex]
                                            .lstorderlist[selectedIndex]
                                            .isabnormal;
                                    orderListData[widgetIndex]
                                        .lstorderlist[selectedIndex]
                                        .iscritical = false;
                                    update(getResultListcolntoller);
                                    Get.forceAppUpdate();
                                  },
                                )
                              ],
                            ),
                          ],
                        ),
                      ),
                      Visibility(
                        visible: orderListData[widgetIndex]
                                    .lstorderlist[selectedIndex]
                                    .resulttypeno ==
                                1
                            ? true
                            : false,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Text(
                              "Sample : ",
                              style: titleTypes,
                            ),
                            Container(
                              decoration: BoxDecoration(
                                  border: Border.all(
                                color: Colors.black,
                                width: 0.5,
                              )),
                              width: MediaQuery.of(context).size.width * 0.5,
                              child: TextFormField(
                                readOnly: true,
                                onTap: () {
                                  // selectedIndex = index;
                                  // log(selectedIndex.toString());
                                },
                                onChanged: (value) {
                                  orderListData[widgetIndex]
                                      .lstorderlist[selectedIndex]
                                      .samplename = value;
                                  log(orderListData[widgetIndex]
                                      .lstorderlist[selectedIndex]
                                      .samplename
                                      .toString());
                                },
                                onFieldSubmitted: (value) {
                                  update(getResultListcolntoller);

                                  // Get.back();
                                  Get.forceAppUpdate();
                                },
                                decoration: InputDecoration(
                                  hintText: orderListData[widgetIndex]
                                      .lstorderlist[selectedIndex]
                                      .samplename,
                                  contentPadding: const EdgeInsets.symmetric(
                                      horizontal: 8.0),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Visibility(
                        visible: orderListData[widgetIndex]
                                    .lstorderlist[selectedIndex]
                                    .resulttypeno !=
                                2
                            ? true
                            : false,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            SizedBox(
                              width: MediaQuery.of(context).size.width / 4,
                              child: const Text("ICMR PatientId : "),
                            ),
                            Container(
                              decoration: BoxDecoration(
                                  border: Border.all(
                                color: Colors.black,
                                width: 0.5,
                              )),
                              width: MediaQuery.of(context).size.width / 2.5,
                              child: TextFormField(
                                decoration: InputDecoration(
                                  hintText: orderListData[widgetIndex]
                                      .lstorderlist[selectedIndex]
                                      .icmrPatientId,
                                  contentPadding: const EdgeInsets.symmetric(
                                      horizontal: 8.0),
                                ),
                                onChanged: (value) {
                                  orderListData[widgetIndex]
                                      .lstorderlist[selectedIndex]
                                      .icmrPatientId = value;
                                },
                                onFieldSubmitted: (value) {
                                  log(orderListData[widgetIndex]
                                      .lstorderlist[selectedIndex]
                                      .icmrPatientId);
                                  update(getResultListcolntoller);

                                  Get.forceAppUpdate();
                                  // Get.back();
                                },
                              ),
                            ),
                          ],
                        ),
                      ),
                      Visibility(
                        visible: orderListData[widgetIndex]
                                    .lstorderlist[selectedIndex]
                                    .resulttypeno !=
                                2
                            ? true
                            : false,
                        child: SizedBox(
                          height: 1.0.hp,
                        ),
                      ),
                      Visibility(
                        visible: orderListData[widgetIndex]
                                    .lstorderlist[selectedIndex]
                                    .resulttypeno !=
                                2
                            ? true
                            : false,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            SizedBox(
                              width: MediaQuery.of(context).size.width / 4,
                              child: const Text("SRF Number : "),
                            ),
                            Container(
                              decoration: BoxDecoration(
                                  border: Border.all(
                                color: Colors.black,
                                width: 0.5,
                              )),
                              width: MediaQuery.of(context).size.width / 2.5,
                              child: TextFormField(
                                  decoration: InputDecoration(
                                    hintText: orderListData[widgetIndex]
                                        .lstorderlist[selectedIndex]
                                        .srfNumber,
                                    contentPadding: const EdgeInsets.symmetric(
                                        horizontal: 8.0),
                                  ),
                                  onChanged: (value) {
                                    orderListData[widgetIndex]
                                        .lstorderlist[selectedIndex]
                                        .srfNumber = value;
                                  },
                                  onFieldSubmitted: (value) {
                                    log(orderListData[widgetIndex]
                                        .lstorderlist[selectedIndex]
                                        .srfNumber);
                                    // Get.forceAppUpdate();
                                    // Get.back();
                                    update(getResultListcolntoller);
                                  }),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Text(
                  "Report Status",
                  style: testBoxKey.copyWith(fontSize: 12.0.sp),
                ),
                Expanded(
                  child: ListView.builder(
                    itemCount: reportStatus.length,
                    itemBuilder: (context, index) {
                      return GestureDetector(
                        onTap: () {},
                        child: Container(
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                reportStatus[index],
                                style: const TextStyle(
                                    fontSize: 16.0), // Adjust your text style
                              ),
                              Checkbox(
                                value: orderListData[widgetIndex]
                                        .lstorderlist[selectedIndex]
                                        .reportstatus ==
                                    index,
                                onChanged: (value) {
                                  // setState(() {
                                  orderListData[widgetIndex]
                                      .lstorderlist[selectedIndex]
                                      .reportstatus = index;
                                  // });
                                  update(getResultListcolntoller);
                                  Get.forceAppUpdate();
                                  // Navigator.of(context).pop();
                                },
                              )
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        );
      });
}

GetResultListcolntoller getResultListcolntoller = Get.find();
Future<void> editResultTestWidget(
  int selectedIndex,
  List<Lstorderlist> orderList,
  List<Lstorderdetail> orderListDetailData,
  BuildContext context,
) {
  double itemHeight = 50.0; // Approximate height of each item including padding
  double totalHeight = itemHeight * orderListDetailData.length;

  // Set a maximum height to prevent the dialog from becoming too large
  double maxHeight = MediaQuery.of(context).size.height * 0.8;
  double containerHeight = totalHeight > maxHeight ? maxHeight : totalHeight;

  return showDialog<void>(
    context: context,
    builder: (context) {
      return Dialog(
        backgroundColor: Colors.white,
        child: Container(
          width: MediaQuery.of(context).size.width * 0.9,
          height: containerHeight +
              115.0, // Adding extra height for the title and padding
          padding: const EdgeInsets.all(16.0),
          child: Column(
            // mainAxisSize: MainAxisSize.min,
            children: [
              SizedBox(
                height: 1.0.hp,
              ),
              Align(
                alignment: Alignment.center,
                child: Text(
                  orderList[selectedIndex].servicename.toUpperCase(),
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Divider(),
              const SizedBox(height: 16),
              Expanded(
                child: ListView.builder(
                  itemCount: orderListDetailData.length,
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    var selectedIndex = 0;
                    return Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8.0),
                      child: Column(
                        children: [
                          Text(orderListDetailData[index].testname),
                          Row(
                            children: [
                              const Text("Result: "),
                              Container(
                                height: 5.0.hp,
                                width: 15.0.wp,
                                decoration: BoxDecoration(
                                    border: Border.all(
                                        color: Colors.black, width: 0.5)),
                                child: TextFormField(
                                  onTap: () {
                                    selectedIndex = index;
                                    log(selectedIndex.toString());
                                  },
                                  onChanged: (value) {
                                    // resultValue = value;
                                    orderListDetailData[index].result = value;
                                    // if (int.parse(
                                    //         orderListDetailData[index].result) >
                                    //     int.parse(orderListDetailData[index]
                                    //                 .masterhlcolumn
                                    //                 .isNum ==
                                    //             false
                                    //         ? ""
                                    //         : orderListDetailData[index]
                                    //             .masterhlcolumn
                                    //             .toString())) {
                                    //   getResultListcolntoller.statusResultText =
                                    //       "H";
                                    //   getResultListcolntoller
                                    //       .statusResultColor = Colors.yellow;
                                    // }
                                    // log(orderListDetailData[index]
                                    //     .result
                                    //     .toString());
                                  },
                                  onFieldSubmitted: (value) {
                                    orderListDetailData[index].result.isEmpty
                                        ? Fluttertoast.showToast(
                                            msg: "Enter Result")
                                        : update(getResultListcolntoller);
                                  },
                                  keyboardType: TextInputType.number,
                                  decoration: InputDecoration(
                                    hintText: orderListDetailData[index].result,
                                    contentPadding: const EdgeInsets.symmetric(
                                        horizontal: 8.0),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),
              // ElevatedButton(
              //     onPressed: () {
              //       // orderListDetailData[selectedIndex].result =
              //       //     resultValue.toString();
              //       // for (var element in orderListDetailData) {
              //       // element.result = "";
              //       // }
              //       // log(message)
              //     },
              //     child: const Text("Edit"))
            ],
          ),
        ),
      );
    },
  );
}

update(GetResultListcolntoller getResultListcolntoller) {
  getResultListcolntoller.action(action: "SD");
  Get.back();
  Get.forceAppUpdate();
}

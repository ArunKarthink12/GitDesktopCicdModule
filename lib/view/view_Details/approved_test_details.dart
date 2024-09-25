import 'dart:convert';
import 'dart:developer';

import 'package:doctor_module/const/colors.dart';
import 'package:doctor_module/const/responsive.dart';
import 'package:doctor_module/const/styleText.dart';
import 'package:doctor_module/controller/sort/servicefiltercontroller.dart';
import 'package:doctor_module/controller/viewdetailscontroller/approvedgetresult/approved_getResult_controller.dart';
import 'package:doctor_module/controller/viewdetailscontroller/approvedgetresult/approvedrecallbtn.dart';
import 'package:doctor_module/controller/viewdetailscontroller/getresult/get_result_listColntoller.dart';
import 'package:doctor_module/controller/viewdetailscontroller/view_details_controller.dart';
import 'package:doctor_module/model/approvedtestdetailsmodel.dart';
import 'package:doctor_module/view/view_Details/pending_test_details.dart';
import 'package:doctor_module/widget/namecardWidget.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ViewdetailsApprovedScreen extends StatefulWidget {
  const ViewdetailsApprovedScreen({super.key});

  @override
  State<ViewdetailsApprovedScreen> createState() =>
      _ViewdetailsApprovedScreenState();
}

class _ViewdetailsApprovedScreenState extends State<ViewdetailsApprovedScreen> {
  ServicefilterController servicefilterController =
      Get.put(ServicefilterController());

  GetResultListcolntoller getReaultListController =
      Get.put(GetResultListcolntoller());
  TextEditingController comment = TextEditingController();
  String commentString = "";
  List<ApprovedTestDetailsmodel> data = <ApprovedTestDetailsmodel>[];
  Future<void> _showMyDialog() async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Add a Comment : '),
          content: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(15.0.sp)),
              color: Colors.white,
            ),
            height: 12.0.hp,
            child: TextFormField(
              controller: comment,
              decoration: InputDecoration(
                focusColor: Colors.white,
                fillColor: Colors.white,
                hintText: 'Write a comment...',
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(15.0.sp))),
              ),
              maxLines: 3,
            ),
          ),
          actionsAlignment: MainAxisAlignment.spaceEvenly,
          actions: <Widget>[
            InkWell(
              child: Container(
                  height: 4.0.hp,
                  width: 20.0.wp,
                  decoration: BoxDecoration(
                      color: const Color.fromARGB(255, 170, 169, 169),
                      borderRadius: BorderRadius.all(Radius.circular(15.0.sp))),
                  alignment: Alignment.center,
                  child: Text(
                    'Cancel',
                    style: GoogleFonts.jost(color: Colors.white),
                  )),
              onTap: () {
                Navigator.of(context).pop();
              },
            ),
            SizedBox(
              width: 5.0.wp,
            ),
            InkWell(
              child: Container(
                  height: 4.0.hp,
                  width: 20.0.wp,
                  decoration: BoxDecoration(
                      color: appcolor,
                      borderRadius: BorderRadius.all(Radius.circular(15.0.sp))),
                  alignment: Alignment.center,
                  child: Text(
                    'Save',
                    style: GoogleFonts.jost(color: Colors.white),
                  )),
              onTap: () {
                setState(() {
                  commentString = comment.text;
                });
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  GetapprovedResultController getapprovedResultController =
      Get.put(GetapprovedResultController());
  ViewdetailsController viewdetailsController =
      Get.put(ViewdetailsController());
  GetapprovedRecallbtnController getapprovedRecallbtnController =
      Get.put(GetapprovedRecallbtnController());
  @override
  void initState() {
    fetchData();
    commentString = "";

    super.initState();
  }

  fetchData() {
    Future.delayed(Duration.zero, () async {
      await getapprovedResultController.getapprovedResultController(
          patientVisitNo: viewdetailsController.patientVisitNo.value);
    });
    log("messageapproved");
    log(viewdetailsController.patientVisitNo.value.toString());
  }

  bool selectAll = false;

  @override
  Widget build(BuildContext context) {
    // double mobileWidth = MediaQuery.of(context).size.width;
    // double mobileHeight = MediaQuery.of(context).size.height;
    return SafeArea(
      child: Scaffold(
          backgroundColor: Colors.white,
          appBar: PreferredSize(
            preferredSize: Size(0, 5.0.hp),
            child: AppBar(
              backgroundColor: Colors.white,
              surfaceTintColor: Colors.white,
              centerTitle: true,
              title: Text(
                "Approved Test Details",
                style: GoogleFonts.jost(
                    fontSize: 12.0.sp, fontWeight: FontWeight.bold),
              ),
              elevation: 2,
              shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(
                Radius.circular(30),
              )),
              actions: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: GestureDetector(
                    onTap: () {
                      // convertImage();
                      showDialog(
                        context: context,
                        builder: (context) {
                          return Center(
                            child: Material(
                              color: data.first.gender.toString() == "M"
                                  ? appcolor
                                  : Colors.pink,
                              borderRadius: BorderRadius.circular(25),
                              child: SizedBox(
                                  height: 50.0.hp,
                                  width:
                                      MediaQuery.of(context).size.width / 1.5,
                                  child: Row(
                                    children: [
                                      SizedBox(
                                        width: 5.0.wp,
                                      ),
                                      Expanded(
                                        child: SizedBox(
                                            child: ApprovedNameCardWidget(
                                          data: data,
                                        )),
                                      ),
                                    ],
                                  )),
                            ),
                          );
                        },
                      );
                    },
                    child: Container(
                      height: 10.0.hp,
                      width: 10.0.wp,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.black),
                          shape: BoxShape.circle),
                      child: Icon(
                        Icons.perm_identity_outlined,
                        size: 20.0.sp,
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
          body: SafeArea(
            child: Obx(() {
              if (getapprovedResultController.isLoading.value == false) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              } else if (getapprovedResultController.getapprovedData.isEmpty) {
                return const Center(
                  child: Text("No Data Found"),
                );
              } else {
                data = getapprovedResultController.getapprovedData;
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(
                        Radius.circular(25.0.sp),
                      )),
                      child: Card(
                        elevation: 3,
                        color: Colors.white,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          // mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SizedBox(
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  SizedBox(
                                    width:
                                        MediaQuery.of(context).size.width / 2,
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      children: [
                                        SizedBox(
                                            // width: 20.0.wp,
                                            child: GestureDetector(
                                                onTap: () => _showMyDialog(),
                                                child: Icon(
                                                    size: 16.0.sp,
                                                    Icons.edit_square))),
                                        multiOptionButtons(
                                            color: appColor1,
                                            onTap: () async {
                                              List tempBool = [];
                                              tempBool.clear();
                                              SharedPreferences pref =
                                                  await SharedPreferences
                                                      .getInstance();
                                              getapprovedResultController
                                                      .getapprovedData
                                                      .first
                                                      .venuebranchno =
                                                  int.parse(
                                                      servicefilterController
                                                          .tempSelectedBranchId
                                                          .value);
                                              getapprovedResultController
                                                      .getapprovedData
                                                      .first
                                                      .venueno =
                                                  int.parse(pref
                                                      .getString("venueNo")
                                                      .toString());
                                              getapprovedResultController
                                                      .getapprovedData
                                                      .first
                                                      .userno =
                                                  int.parse(pref
                                                      .getString("userNo")
                                                      .toString());
                                              for (var element
                                                  in getapprovedResultController
                                                      .getapprovedData
                                                      .first
                                                      .lstRecallServicves) {
                                                element.comments =
                                                    commentString;
                                              }
                                              var json = jsonEncode(
                                                  getapprovedResultController
                                                      .getapprovedData.first);

                                              setState(() {
                                                for (var element
                                                    in getapprovedResultController
                                                        .getapprovedData
                                                        .first
                                                        .lstRecallServicves) {
                                                  tempBool
                                                      .add(element.isChecked);
                                                }
                                              });
                                              if (tempBool.every((element) =>
                                                  element == false)) {
                                                Fluttertoast.showToast(
                                                    msg:
                                                        "Select Atleast One Service");
                                              } else if (commentString == "") {
                                                Fluttertoast.showToast(
                                                    msg: "Enter Comment");
                                              } else {
                                                Future.delayed(Duration.zero,
                                                    () async {
                                                  await getapprovedRecallbtnController
                                                      .getapprovedrecallbuttonController(
                                                          params: json);
                                                }).then((value) {
                                                  Future.delayed(Duration.zero,
                                                      () async {
                                                    await viewdetailsController.viewlistController(
                                                        venuBranchNo:
                                                            servicefilterController
                                                                .selectedBranchId
                                                                .value,
                                                        customerNo: 0,
                                                        visitId: "",
                                                        serviceId: 0,
                                                        serviceType: " ",
                                                        fromDate:
                                                            viewdetailsController
                                                                .selectFromDate
                                                                .value,
                                                        toDate:
                                                            viewdetailsController
                                                                .selectToDate
                                                                .value);
                                                  });
                                                }).then((value) => Get.back());
                                              }
                                            },
                                            title: "RE-CALL"),
                                      ],
                                    ),
                                  ),
                                  const Expanded(child: SizedBox()),
                                  SizedBox(
                                    child: Row(
                                      children: [
                                        Text(
                                          "Select All",
                                          style: GoogleFonts.jost(
                                            fontSize: 10.0.sp,
                                            color: Colors.black,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                        Checkbox(
                                          value: selectAll,
                                          onChanged: (v) => setState(() {
                                            selectAll = !selectAll;
                                            selectAll == true
                                                ? getapprovedResultController
                                                    .getapprovedData
                                                    .first
                                                    .lstRecallServicves
                                                    .forEach((element) {
                                                    element.isChecked = true;
                                                    log(element.isChecked
                                                        .toString());
                                                  })
                                                : getapprovedResultController
                                                    .getapprovedData
                                                    .first
                                                    .lstRecallServicves
                                                    .forEach((element) {
                                                    element.isChecked = false;
                                                    log(element.isChecked
                                                        .toString());
                                                  });
                                          }),
                                        )
                                      ],
                                    ),
                                  ),
                                  SizedBox(
                                    width: 2.0.wp,
                                  )
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Expanded(
                        child: SizedBox(
                            width: MediaQuery.of(context).size.width / 1.9,
                            child: ListView.builder(
                              itemCount: data.first.lstRecallServicves.length,
                              itemBuilder: (BuildContext context, int index) =>
                                  Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Card(
                                  // color: const Color.fromARGB(255, 255, 255, 255),
                                  elevation: 10,
                                  child: Column(children: [
                                    Padding(
                                      padding: EdgeInsets.all(3.0.sp),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceEvenly,
                                        children: [
                                          Container(
                                            decoration: BoxDecoration(
                                                color: appcolor,
                                                borderRadius: BorderRadius.only(
                                                    topLeft:
                                                        Radius.circular(25),
                                                    topRight:
                                                        Radius.circular(25))
                                                //     BorderRadius.circular(25)
                                                ),
                                            child: SizedBox(
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  Padding(
                                                    padding: EdgeInsets.only(
                                                        left: 8.0.sp),
                                                    child: SizedBox(
                                                      // height: 3.0.hp,
                                                      width:
                                                          MediaQuery.of(context)
                                                                  .size
                                                                  .width *
                                                              0.6,
                                                      child: Text(
                                                        maxLines: 1,
                                                        overflow: TextOverflow
                                                            .ellipsis,
                                                        data
                                                            .first
                                                            .lstRecallServicves[
                                                                index]
                                                            .serviceName
                                                            .toString(),
                                                        style:
                                                            textStyle3.copyWith(
                                                                color: Colors
                                                                    .white),
                                                      ),
                                                    ),
                                                  ),
                                                  Checkbox(
                                                    fillColor:
                                                        WidgetStateProperty
                                                            .resolveWith<
                                                                Color>((Set<
                                                                    WidgetState>
                                                                states) {
                                                      if (data
                                                              .first
                                                              .lstRecallServicves[
                                                                  index]
                                                              .isChecked ==
                                                          true) {
                                                        return appcolor;
                                                      }
                                                      // if (states.contains(WidgetState.disabled)) {
                                                      //   return Colors.white.withOpacity(.32);
                                                      // }
                                                      return Colors.white;
                                                    }),
                                                    value: data
                                                        .first
                                                        .lstRecallServicves[
                                                            index]
                                                        .isChecked,
                                                    onChanged: (value) =>
                                                        setState(() {
                                                      data
                                                              .first
                                                              .lstRecallServicves[
                                                                  index]
                                                              .isChecked =
                                                          !data
                                                              .first
                                                              .lstRecallServicves[
                                                                  index]
                                                              .isChecked;

                                                      for (var map in data.first
                                                          .lstRecallServicves) {
                                                        if (map.isChecked ==
                                                            false) {
                                                          selectAll = false;
                                                          break;
                                                        } else {
                                                          selectAll = true;
                                                        }
                                                      }
                                                    }),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                          SizedBox(
                                            height: 1.0.hp,
                                          ),
                                          Container(
                                            decoration: BoxDecoration(
                                                color: Colors.white,
                                                borderRadius: BorderRadius.only(
                                                    bottomRight:
                                                        Radius.circular(25),
                                                    bottomLeft:
                                                        Radius.circular(25))
                                                // BorderRadius.circular(25)
                                                ),
                                            child: Padding(
                                              padding:
                                                  const EdgeInsets.all(8.0),
                                              child: Column(
                                                children: [
                                                  Row(
                                                    children: [
                                                      SizedBox(
                                                        width: 2.0.wp,
                                                      ),
                                                      Text(
                                                        overflow: TextOverflow
                                                            .ellipsis,
                                                        maxLines: 1,
                                                        "Barcode No  : ",
                                                        style: textStyle3,
                                                      ),
                                                      Text(
                                                        data
                                                                .first
                                                                .lstRecallServicves[
                                                                    index]
                                                                .barcodeNo
                                                                .toString() ??
                                                            "No BarCode",
                                                        style: textStyle3,
                                                        maxLines: 1,
                                                        overflow: TextOverflow
                                                            .ellipsis,
                                                      ),
                                                    ],
                                                  ),
                                                  SizedBox(
                                                    height: .05.hp,
                                                  ),
                                                  Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment.start,
                                                    children: [
                                                      SizedBox(
                                                        width: 2.0.wp,
                                                      ),
                                                      Container(
                                                        alignment:
                                                            Alignment.center,
                                                        // height: 3.0.hp,
                                                        child: Text(
                                                          "Test Status  :  ",
                                                          style: textStyle3,
                                                        ),
                                                      ),
                                                      Container(
                                                        alignment:
                                                            Alignment.center,
                                                        height: 3.0.hp,
                                                        width: 34.0.wp,
                                                        decoration: BoxDecoration(
                                                            borderRadius:
                                                                BorderRadius.all(
                                                                    Radius.circular(
                                                                        15.0.sp))),
                                                        child: Row(
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .center,
                                                          children: [
                                                            Text(
                                                              data
                                                                  .first
                                                                  .lstRecallServicves[
                                                                      index]
                                                                  .orderListStatusText
                                                                  .toString(),
                                                              style: GoogleFonts.jost(
                                                                  color: Colors
                                                                      .green,
                                                                  fontSize:
                                                                      9.0.sp),
                                                            ),
                                                            SizedBox(
                                                              width: 1.0.wp,
                                                            ),
                                                            const Icon(
                                                              Icons
                                                                  .check_circle,
                                                              color:
                                                                  Colors.green,
                                                            )
                                                          ],
                                                        ),
                                                      )
                                                    ],
                                                  ),
                                                ],
                                              ),
                                            ),
                                          )
                                        ],
                                      ),
                                    )
                                  ]),
                                ),
                              ),
                            ))),
                  ],
                );
              }
            }),
          )),
    );
  }

  final checklist = [
    CheckboxlistClass(),
  ];
  final groupCheckBox = CheckboxlistClass();
  Widget patientTestDetails(CheckboxlistClass checkboxval) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Card(
          elevation: 3,
          child: Container(
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.all(Radius.circular(15.0.sp)),
                boxShadow: const [
                  BoxShadow(
                      color: Colors.black,
                      blurRadius: 2.0,
                      blurStyle: BlurStyle.outer,
                      spreadRadius: 2.0)
                ]),
            height: 19.5.hp,
            width: MediaQuery.of(context).size.width,
            child: Padding(
              padding: EdgeInsets.only(
                  bottom: 10.0.sp, left: 10.0.sp, right: 10.0.sp),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Sugar Fasting Test",
                        style: textStyle3,
                      ),
                      Container(
                        height: 3.5.hp,
                        alignment: Alignment.center,
                        constraints: BoxConstraints(
                            minWidth: 25.0.wp, maxHeight: 35.0.wp),
                        decoration: BoxDecoration(
                            color: const Color.fromARGB(255, 236, 225, 133),
                            borderRadius: BorderRadius.all(
                              Radius.circular(8.0.sp),
                            )),
                        child: Text(
                          "Critical - High",
                          style: textStyle3.copyWith(
                              fontSize: 9.0.sp, color: Colors.white),
                        ),
                      ),
                      Checkbox(
                        value: checkboxval.value,
                        onChanged: (value) => setState(() {
                          checkboxval.value = value!;
                          groupCheckBox.value =
                              checklist.every((element) => element.value);
                        }),
                      ),
                    ],
                  ),
                  Card(
                    elevation: 3,
                    child: Container(
                      decoration: BoxDecoration(
                          borderRadius:
                              BorderRadius.all(Radius.circular(10.0.sp)),
                          color: Colors.white),
                      padding: EdgeInsets.all(5.0.sp),
                      height: 11.0.hp,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Text(
                            "Result : ",
                            style: textStyle3,
                          ),
                          Text(
                            "Ref.Range : ",
                            style: textStyle3,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "Method : ",
                                style: textStyle3,
                              ),
                              const SizedBox(),
                              Text(
                                "Unit : ",
                                style: textStyle3,
                              ),
                              const SizedBox()
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          )),
    );
  }

  Widget buildGroupCheckBox(CheckboxlistClass checkboxobj) {
    return Row(
      children: [
        Text(
          "Select All",
          style: GoogleFonts.jost(
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
        Checkbox(value: checkboxobj.value, onChanged: toggleGroupCheckBox)
      ],
    );
  }

  void toggleGroupCheckBox(bool? value) {
    if (value == null) return;
    setState(() {
      groupCheckBox.value = value;
      for (var element in checklist) {
        element.value = value;
      }
    });
  }
}

class CheckboxlistClass {
  bool value;
  CheckboxlistClass({this.value = false});
}

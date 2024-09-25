import 'dart:developer';

import 'package:doctor_module/const/colors.dart';
import 'package:doctor_module/const/responsive.dart';
import 'package:doctor_module/const/styleText.dart';
import 'package:doctor_module/controller/viewdetailscontroller/pdfviewController.dart';
import 'package:doctor_module/model/test_details_model.dart';
import 'package:doctor_module/view/editTestDetails/editTestDetails.dart';
import 'package:doctor_module/view/flipCard.dart';
import 'package:doctor_module/widget/circle_widget.dart';
import 'package:doctor_module/widget/flagstatus.dart';
import 'package:doctor_module/widget/pdfviewerWidget.dart';
import 'package:flutter/material.dart';
// import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
// import 'package:google_fonts/google_fonts.dart';
// import 'package:syncfusion_flutter_charts/charts.dart';

// ignore: must_be_immutable
class ServiceTypeWidget extends StatefulWidget {
  int servicetypeNo;
  int index;
  List<TestDetailsmodel>? data = <TestDetailsmodel>[];
  // int? index;

  ServiceTypeWidget({
    super.key,
    required this.servicetypeNo,
    required this.data,
    required this.index,
  });

  @override
  State<ServiceTypeWidget> createState() => _ServiceTypeWidgetState();
}

class _ServiceTypeWidgetState extends State<ServiceTypeWidget> {
  final PageController _pageController = PageController();

  PdfviewController pdfviewController = Get.put(PdfviewController());
  int _currentPage = 0;

  List reportStatus = [
    "Select",
    "Preliminary",
    "Interim I",
    "Interim II",
    "Final",
  ];

  String statusText = "";
  Color statusColor = Colors.transparent;
  checkFever({required Lstorderdetail data}) {
    // if (result < 50 && result > 40) {
    //   print("L"); // Result is less than 50 but greater than 40
    // } else if (result < 50) {
    //   print("CL"); // Result is less than 50
    // } else if (result > 60 && result < 70) {
    //   print("H"); // Result is greater than 60 but less than 70
    // } else if (result > 60) {
    //   print("CH"); // Result is greater than 60
    // } else {
    //   print("Invalid input or in a different range.");
    // }

    double numberDouble =
        double.parse(data.result.isNum == false ? "0" : data.result);

    // Convert the double to an integer (this truncates the decimal part)
    int result = numberDouble.toInt();
    var masterllcolumn = double.parse(data.masterllcolumn == ""
        ? "0"
        : data.masterllcolumn.isNum == false
            ? "0"
            : data.masterllcolumn);
    var masterllcolumnroundedValue = masterllcolumn.round();

    var masterllcolumn1 = double.parse(data.masterllcolumn.isNum == false
            ? "0"
            : data.masterllcolumn == ""
                ? "0"
                : data.masterllcolumn) -
        15;
    var masterllcolumn1roundedValue = masterllcolumn1.round();

    var masterhlcolumn = double.parse(data.masterhlcolumn == ""
        ? "0"
        : data.masterhlcolumn.isNum == false
            ? "0"
            : data.masterhlcolumn);

    var masterhlcolumnroundedValue = masterhlcolumn.round();
    var masterhlcolumn1 = double.parse(data.masterhlcolumn.isNum == false
            ? "0"
            : data.masterhlcolumn == ""
                ? "0"
                : data.masterhlcolumn) +
        15;
    var masterhlcolumn1roundedValue = masterhlcolumn1.round();

    log(masterhlcolumnroundedValue.toString());
    if (result < masterllcolumnroundedValue &&
        result > masterllcolumn1roundedValue) {
      statusText = "L";
      statusColor = Colors.yellow;
    } else if (result < masterllcolumnroundedValue) {
      statusText = "CL";
      statusColor = Colors.red;
    } else if (result > masterhlcolumnroundedValue &&
        result < masterhlcolumn1roundedValue) {
      statusText = "H";
      statusColor = Colors.yellow;
    } else if (result > masterhlcolumnroundedValue) {
      statusText = "CH";
      statusColor = Colors.red;
    } else {
      statusColor = Colors.transparent;
      statusText = "";
    }
  }

  @override
  void initState() {
    super.initState();
    checkConvertToTrue();
  }

  Future checkConvertToTrue() async {
    for (var i = 0;
        i < widget.data!.first.lstvisit.first.lstorderlist.length;
        i++) {
      setState(() {
        widget.data!.first.lstvisit.first.lstorderlist[i].ischecked = true;
        widget.data!.first.lstvisit.first.lstorderlist[i].ischecked == true
            ? pdfviewController.selectAll.value = true
            : pdfviewController.selectAll.value = false;
        print(pdfviewController.selectAll.value);
        Get.forceAppUpdate();
        print(pdfviewController.selectAll.value);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return getWidgetBasedOnCondition(widget.servicetypeNo, context);
  }

  Widget getWidgetBasedOnCondition(condition, context) {
    switch (condition) {
      case 1:
        return SizedBox(
            // height: 0.0.hp,
            width: MediaQuery.of(context).size.width,
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                boxShadow: const [
                  BoxShadow(
                      color: appColor1,
                      blurRadius: 1,
                      blurStyle: BlurStyle.outer,
                      spreadRadius: 2),
                ],
                borderRadius: BorderRadius.circular(25),
              ),
              child: Column(children: [
                // SizedBox(
                //   height: 1.0.hp,
                // ),
                Container(
                  // height: 4.5.hp,
                  // width: MediaQuery.of(context).size.width - 8.0.wp,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(25),
                      topRight: Radius.circular(25),
                    ),
                    color: appcolor,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      SizedBox(
                        child: Padding(
                          padding: const EdgeInsets.only(left: 10.0),
                          child: Text(
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            widget.data!.first.lstvisit.first
                                .lstorderlist[widget.index].departmentname
                                .toString(),
                            style: textStyle3.copyWith(
                                fontSize: 10.0.sp, color: Colors.white),
                          ),
                        ),
                      ),
                      const Expanded(
                        child: SizedBox(),
                      ),
                      Checkbox(
                        fillColor: WidgetStateProperty.resolveWith<Color>(
                            (Set<WidgetState> states) {
                          if (widget.data!.first.lstvisit.first
                                  .lstorderlist[widget.index].ischecked ==
                              true) {
                            return appcolor;
                          }
                          // if (states.contains(WidgetState.disabled)) {
                          //   return Colors.white.withOpacity(.32);
                          // }
                          return Colors.white;
                        }),
                        checkColor: Colors.white,
                        value: widget.data!.first.lstvisit.first
                            .lstorderlist[widget.index].ischecked,
                        onChanged: (value) => setState(() {
                          if (widget.data!.first.lstvisit.first
                                  .lstorderlist[widget.index].ischecked ==
                              true) {
                            widget.data!.first.lstvisit.first
                                .lstorderlist[widget.index].ischecked = false;
                          } else {
                            widget.data!.first.lstvisit.first
                                .lstorderlist[widget.index].ischecked = true;
                          }

                          for (var map in widget
                              .data!.first.lstvisit.first.lstorderlist) {
                            if (map.ischecked == false) {
                              pdfviewController.selectAll.value = false;
                              break;
                            } else {
                              pdfviewController.selectAll.value = true;
                            }
                          }
                        }),
                      ),
                      SizedBox(
                        width: 1.0.wp,
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 1.0.hp,
                ),
                Container(
                  color: Colors.transparent,
                  height: 42.0.hp,
                  child: PageView.builder(
                      controller: _pageController,
                      scrollDirection: Axis.horizontal,
                      onPageChanged: (value) {
                        setState(() {
                          _currentPage = value;
                        });
                      },
                      itemCount: widget.data!.first.lstvisit.first
                          .lstorderlist[widget.index].lstorderdetail.length,
                      itemBuilder: (context, innerindex) {
                        checkFever(
                            data: widget
                                .data!
                                .first
                                .lstvisit
                                .first
                                .lstorderlist[widget.index]
                                .lstorderdetail[innerindex]);

                        return Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            FlagWidget().patientStatus(
                              widget.index,
                              widget.data!.first,
                              innerindex,
                              context,
                            ),
                            // GestureDetector(
                            //   onTap: () {},
                            //   child: Container(
                            //       height: 5.0.hp,
                            //       width: 5.0.wp,
                            //       child: Icon(
                            //         Icons.comment,
                            //         size: 10.0.sp,
                            //       )),
                            // ),
                            Container(
                              height: 32.0.hp,
                              width: MediaQuery.of(context).size.width,
                              color: Colors.transparent,
                              child: Container(
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.all(
                                        Radius.circular(10.0.sp)),
                                    color: Colors.transparent),
                                height: 23.0.hp,
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Card(
                                    elevation: 2,
                                    color: Colors.white,
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          SingleChildScrollView(
                                            scrollDirection: Axis.horizontal,
                                            child: SizedBox(
                                              child: Row(
                                                children: [
                                                  Row(
                                                    children: [
                                                      Text(
                                                          overflow: TextOverflow
                                                              .ellipsis,
                                                          maxLines: 1,
                                                          "Test Name  : ",
                                                          style: testBoxKey),
                                                      SizedBox(
                                                        width: 2.0.wp,
                                                      ),
                                                      Column(
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .start,
                                                        children: [
                                                          Text(
                                                            widget
                                                                .data!
                                                                .first
                                                                .lstvisit
                                                                .first
                                                                .lstorderlist[
                                                                    widget
                                                                        .index]
                                                                .lstorderdetail[
                                                                    innerindex]
                                                                .testname
                                                                .toString(),
                                                            style: testBoxValue,
                                                            maxLines: 1,
                                                            overflow:
                                                                TextOverflow
                                                                    .ellipsis,
                                                          ),
                                                          widget
                                                                      .data!
                                                                      .first
                                                                      .lstvisit
                                                                      .first
                                                                      .lstorderlist[
                                                                          widget
                                                                              .index]
                                                                      .lstorderdetail[
                                                                          innerindex]
                                                                      .subtestname ==
                                                                  ""
                                                              ? const SizedBox()
                                                              : Text(
                                                                  widget
                                                                      .data!
                                                                      .first
                                                                      .lstvisit
                                                                      .first
                                                                      .lstorderlist[
                                                                          widget
                                                                              .index]
                                                                      .lstorderdetail[
                                                                          innerindex]
                                                                      .subtestname
                                                                      .toString(),
                                                                  style: testBoxValue
                                                                    ..copyWith(
                                                                        fontSize:
                                                                            10.0
                                                                                .sp,
                                                                        color: Colors
                                                                            .grey),
                                                                  maxLines: 1,
                                                                  overflow:
                                                                      TextOverflow
                                                                          .ellipsis,
                                                                )
                                                        ],
                                                      ),
                                                    ],
                                                  ),
                                                  SizedBox(
                                                    width: 1.0.wp,
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                          SingleChildScrollView(
                                            scrollDirection: Axis.horizontal,
                                            child: SizedBox(
                                              height: 5.0.hp,
                                              child: Row(
                                                children: [
                                                  Text("Result  : ",
                                                      style: testBoxKey),
                                                  // Visibility(
                                                  //   visible: widget
                                                  //                   .data
                                                  //                   ?.first
                                                  //                   .lstvisit
                                                  //                   .first
                                                  //                   .lstorderlist[
                                                  //                       widget
                                                  //                           .index!]
                                                  //                   .lstorderdetail[
                                                  //                       innerindex]
                                                  //                   .result
                                                  //                   .isNum ==
                                                  //               false ||
                                                  //           widget
                                                  //                       .data
                                                  //                       ?.first
                                                  //                       .lstvisit
                                                  //                       .first
                                                  //                       .lstorderlist[widget
                                                  //                           .index!]
                                                  //                       .lstorderdetail[
                                                  //                           innerindex]
                                                  //                       .masterhlcolumn ==
                                                  //                   "" &&
                                                  //               widget
                                                  //                       .data
                                                  //                       ?.first
                                                  //                       .lstvisit
                                                  //                       .first
                                                  //                       .lstorderlist[widget
                                                  //                           .index!]
                                                  //                       .lstorderdetail[
                                                  //                           innerindex]
                                                  //                       .masterllcolumn ==
                                                  //                   ""
                                                  //       ? false
                                                  //       : true,
                                                  //   child: Container(
                                                  //       margin:
                                                  //           EdgeInsets.only(
                                                  //               left: 5.0.sp),
                                                  //       width: 10.0.wp,
                                                  //       color: statusColor,
                                                  //       alignment:
                                                  //           Alignment.center,
                                                  //       child: Text(
                                                  //         statusText,
                                                  //         style: TextStyle(
                                                  //             color: Colors
                                                  //                 .black),
                                                  //       )),
                                                  // ),
                                                  Card(
                                                    child: Container(
                                                      constraints:
                                                          BoxConstraints(
                                                        minHeight: 5.0.hp,
                                                        minWidth: 15.0.wp,
                                                        maxHeight: 6.0.hp,
                                                        maxWidth: 30.0.wp,
                                                      ),
                                                      // width: 15.0.wp,
                                                      // height: 6.0.hp,
                                                      alignment:
                                                          Alignment.center,
                                                      // decoration:
                                                      //     BoxDecoration(),
                                                      child: Text(
                                                          " ${widget.data!.first.lstvisit.first.lstorderlist[widget.index].lstorderdetail[innerindex].result.toString()}",
                                                          style: testBoxValue),
                                                    ),
                                                  ),
                                                  Visibility(
                                                    visible: widget
                                                                    .data
                                                                    ?.first
                                                                    .lstvisit
                                                                    .first
                                                                    .lstorderlist[
                                                                        widget
                                                                            .index]
                                                                    .lstorderdetail[
                                                                        innerindex]
                                                                    .result
                                                                    .isNum ==
                                                                false ||
                                                            widget
                                                                        .data
                                                                        ?.first
                                                                        .lstvisit
                                                                        .first
                                                                        .lstorderlist[widget
                                                                            .index]
                                                                        .lstorderdetail[
                                                                            innerindex]
                                                                        .masterhlcolumn ==
                                                                    "" &&
                                                                widget
                                                                        .data
                                                                        ?.first
                                                                        .lstvisit
                                                                        .first
                                                                        .lstorderlist[widget
                                                                            .index]
                                                                        .lstorderdetail[
                                                                            innerindex]
                                                                        .masterllcolumn ==
                                                                    ""
                                                        ? false
                                                        : true,
                                                    child: Container(
                                                        margin: EdgeInsets.only(
                                                            left: 5.0.sp),
                                                        width: 10.0.wp,
                                                        color: statusColor,
                                                        alignment:
                                                            Alignment.center,
                                                        child: Text(
                                                          statusText,
                                                          style: TextStyle(
                                                              color:
                                                                  Colors.black),
                                                        )),
                                                  )
                                                ],
                                              ),
                                            ),
                                          ),
                                          Row(
                                            children: [
                                              Text("Ref.Range  :  ",
                                                  style: testBoxKey),
                                              Text(
                                                  widget
                                                      .data!
                                                      .first
                                                      .lstvisit
                                                      .first
                                                      .lstorderlist[
                                                          widget.index]
                                                      .lstorderdetail[
                                                          innerindex]
                                                      .displayrr
                                                      .toString(),
                                                  style: testBoxValue)
                                            ],
                                          ),
                                          Row(
                                            children: [
                                              Text("Method  :  ",
                                                  style: testBoxKey),
                                              SizedBox(
                                                width: 40.0.wp,
                                                child: Text(
                                                    widget
                                                        .data!
                                                        .first
                                                        .lstvisit
                                                        .first
                                                        .lstorderlist[
                                                            widget.index]
                                                        .lstorderdetail[
                                                            innerindex]
                                                        .methodname
                                                        .toString(),
                                                    maxLines: 3,
                                                    style: testBoxValue),
                                              )
                                            ],
                                          ),
                                          Row(
                                            children: [
                                              Text("Unit  :  ",
                                                  style: testBoxKey),
                                              Text(
                                                  "${widget.data!.first.lstvisit.first.lstorderlist[widget.index].lstorderdetail[innerindex].unitno.toString()} ${widget.data!.first.lstvisit.first.lstorderlist[widget.index].lstorderdetail[innerindex].unitname.toString()}",
                                                  style: testBoxValue)
                                            ],
                                          ),
                                          Visibility(
                                            visible: widget
                                                        .data!
                                                        .first
                                                        .lstvisit
                                                        .first
                                                        .lstorderlist[
                                                            widget.index]
                                                        .lstorderdetail
                                                        .length >
                                                    1
                                                ? true
                                                : false,
                                            child: SingleChildScrollView(
                                              scrollDirection: Axis.horizontal,
                                              child: SizedBox(
                                                child: Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  children: List.generate(
                                                      widget
                                                          .data!
                                                          .first
                                                          .lstvisit
                                                          .first
                                                          .lstorderlist[
                                                              widget.index]
                                                          .lstorderdetail
                                                          .length, (index) {
                                                    return AnimatedContainer(
                                                      duration: const Duration(
                                                          milliseconds: 300),
                                                      margin: const EdgeInsets
                                                          .symmetric(
                                                          horizontal: 5.0),
                                                      height: 10.0,
                                                      width:
                                                          _currentPage == index
                                                              ? 12.0
                                                              : 10.0,
                                                      decoration: BoxDecoration(
                                                        shape: BoxShape.circle,
                                                        color: _currentPage ==
                                                                index
                                                            ? Colors.blue
                                                            : Colors.grey,
                                                      ),
                                                    );
                                                  }),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                // SizedBox(
                                //   width: 2.0.wp,
                                // ),
                                CommandSection(
                                  index: widget.index,
                                  data: widget.data,
                                  innerIndex: innerindex,
                                ),
                                // SizedBox(
                                //   width: 2.0.wp,
                                // ),
                                GraphSection(
                                  index: widget.index,
                                  data: widget.data!,
                                  innerIndex: innerindex,
                                ),
                                // SizedBox(
                                //   width: 2.0.wp,
                                // ),
                                Material(
                                  color: appColor1,
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(25)),
                                  child: IconButton(
                                    icon: Icon(Icons.edit), // Comment icon
                                    color: Colors.white, // Icon color
                                    onPressed: () {
                                      var selectedIndex = widget.index;

                                      log(selectedIndex.toString());
                                      log(widget
                                          .data!
                                          .first
                                          .lstvisit
                                          .first
                                          .lstorderlist[selectedIndex]
                                          .resulttypeno
                                          .toString());
                                      editResultTestWidget(
                                        selectedIndex,
                                        widget.data!.first.lstvisit.first
                                            .lstorderlist,
                                        widget
                                            .data!
                                            .first
                                            .lstvisit
                                            .first
                                            .lstorderlist[selectedIndex]
                                            .lstorderdetail,
                                        context,
                                      );
                                    },
                                  ),
                                )
                              ],
                            )
                          ],
                        );
                      }),
                )
              ]),
            ));

      default:
        return Container(
          decoration: BoxDecoration(
            color: Colors.white,
            boxShadow: const [
              BoxShadow(
                  color: appcolor,
                  blurRadius: 1,
                  // offset: Offset(0.0, 2.0),
                  blurStyle: BlurStyle.outer,
                  spreadRadius: 2),
            ],
            borderRadius: BorderRadius.all(
                //  Radius.circular(20.0.sp),
                Radius.circular(20.0.sp)),
          ),
          // alignment: Alignment.center,
          child: Column(children: [
            Container(
              decoration: const BoxDecoration(
                color: appcolor,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(25),
                    topRight: Radius.circular(25)),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  SizedBox(
                    width: 2.0.wp,
                  ),
                  Expanded(
                    child: SizedBox(
                      child: Text(
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        widget.data!.first.lstvisit.first
                            .lstorderlist[widget.index].servicename
                            .toString(),
                        style: testBoxKey.copyWith(color: Colors.white),
                      ),
                    ),
                  ),
                  Checkbox(
                    fillColor: WidgetStateProperty.resolveWith<Color>(
                        (Set<WidgetState> states) {
                      if (widget.data!.first.lstvisit.first
                              .lstorderlist[widget.index].ischecked ==
                          true) {
                        return appcolor.withOpacity(0.5);
                      }
                      // if (states.contains(WidgetState.disabled)) {
                      //   return Colors.white.withOpacity(.32);
                      // }
                      return Colors.white;
                    }),
                    checkColor: Colors.white,
                    value: widget.data!.first.lstvisit.first
                        .lstorderlist[widget.index].ischecked,
                    onChanged: (value) => setState(() {
                      if (widget.data!.first.lstvisit.first
                              .lstorderlist[widget.index].ischecked ==
                          true) {
                        widget.data!.first.lstvisit.first
                            .lstorderlist[widget.index].ischecked = false;
                      } else {
                        widget.data!.first.lstvisit.first
                            .lstorderlist[widget.index].ischecked = true;
                      }

                      for (var map
                          in widget.data!.first.lstvisit.first.lstorderlist) {
                        if (map.ischecked == false) {
                          pdfviewController.selectAll.value = false;
                          break;
                        } else {
                          pdfviewController.selectAll.value = true;
                        }
                      }
                    }),

                    // setState(() {
                    //   widget.data!.first.lstvisit.first
                    //           .lstorderlist[widget.index!].ischecked =
                    //       widget.data!.first.lstvisit.first
                    //           .lstorderlist[widget.index!].ischecked;

                    //   for (var map
                    //       in widget.data!.first.lstvisit.first.lstorderlist) {
                    //     if (map.ischecked == false) {
                    //       pdfviewController.selectAll.value = false;
                    //       break;
                    //     } else {
                    //       pdfviewController.selectAll.value = true;
                    //     }
                    //   }
                    // }),
                  ),
                  SizedBox(
                    width: 1.0.wp,
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 1.0.hp,
            ),
            FlagWidget().patientStatus(
              widget.index,
              widget.data!.first,
              0,
              context,
            ),
            Padding(
              padding: const EdgeInsets.all(5.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                    color: Colors.white,
                    height: 3.0.hp,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        SizedBox(
                          child: Row(
                            children: [
                              SizedBox(
                                width: 14.0.wp,
                                child: Text(
                                  "Critical ",
                                  style: testBoxKey,
                                ),
                              ),
                              SizedBox(
                                width: 5.0.wp,
                                child: Checkbox(
                                    fillColor:
                                        WidgetStateProperty.resolveWith<Color>(
                                            (Set<WidgetState> states) {
                                      if (widget
                                              .data!
                                              .first
                                              .lstvisit
                                              .first
                                              .lstorderlist[widget.index]
                                              .iscritical ==
                                          true) {
                                        return appColor1;
                                      }
                                      // if (states.contains(WidgetState.disabled)) {
                                      //   return Colors.white.withOpacity(.32);
                                      // }
                                      return Colors.white;
                                    }),
                                    value: widget.data!.first.lstvisit.first
                                        .lstorderlist[widget.index].iscritical,
                                    onChanged: (e) {
                                      errorToast(
                                          "Click Edit button For Customization");
                                    }),
                              ),
                            ],
                          ),
                        ),
                        // Expanded(child: SizedBox()),
                        SizedBox(
                          child: Row(
                            children: [
                              SizedBox(
                                width: 20.0.wp,
                                child: Text(
                                  "Abnormal",
                                  style: testBoxKey,
                                ),
                              ),
                              SizedBox(
                                width: 5.0.wp,
                                child: Checkbox(
                                    fillColor:
                                        WidgetStateProperty.resolveWith<Color>(
                                            (Set<WidgetState> states) {
                                      if (widget
                                              .data!
                                              .first
                                              .lstvisit
                                              .first
                                              .lstorderlist[widget.index]
                                              .isabnormal ==
                                          true) {
                                        return appColor1;
                                      }
                                      // if (states.contains(WidgetState.disabled)) {
                                      //   return Colors.white.withOpacity(.32);
                                      // }
                                      return Colors.white;
                                    }),
                                    value: widget.data!.first.lstvisit.first
                                        .lstorderlist[widget.index].isabnormal,
                                    onChanged: (e) {
                                      errorToast(
                                          "Click Edit button For Customization");
                                    }),
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                  Obx(() {
                    return Card(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: SizedBox(
                          height: 13.0.hp,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Visibility(
                                visible: condition == 2 ? true : false,
                                child: Row(
                                  children: [
                                    Text(
                                      "Sample : ",
                                      style: testBoxKey,
                                    ),
                                    Text(
                                      widget
                                          .data!
                                          .first
                                          .lstvisit
                                          .first
                                          .lstorderlist[widget.index]
                                          .samplename,
                                      style: testBoxValue,
                                    )
                                  ],
                                ),
                              ),
                              Visibility(
                                visible: condition == 2 ? false : true,
                                child: Row(
                                  children: [
                                    Text(
                                      "ICMR PatientID : ",
                                      style: testBoxKey,
                                    ),
                                    Text(
                                      "${widget.data!.first.lstvisit.first.lstorderlist[widget.index].icmrPatientId ?? ""} ",
                                      style: testBoxValue,
                                    )
                                  ],
                                ),
                              ),
                              Visibility(
                                visible: condition == 2 ? false : true,
                                child: Row(
                                  children: [
                                    Text(
                                      "SRF Number : ",
                                      style: testBoxKey,
                                    ),
                                    Text(
                                      "${widget.data!.first.lstvisit.first.lstorderlist[widget.index].srfNumber ?? ""}",
                                      style: testBoxValue,
                                    )
                                  ],
                                ),
                              ),
                              GestureDetector(
                                onTap: () {},
                                child: Container(
                                  color: Colors.transparent,
                                  child: Row(
                                    children: [
                                      Text(
                                        "Report Status : ",
                                        style: testBoxKey,
                                      ),
                                      Text(
                                        "${reportStatus[widget.data!.first.lstvisit.first.lstorderlist[widget.index].reportstatus]}",
                                        style: testBoxValue,
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              Visibility(
                                  visible: widget
                                              .data!
                                              .first
                                              .lstvisit
                                              .first
                                              .lstorderlist[widget.index]
                                              .reportstatus ==
                                          0
                                      ? true
                                      : false,
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      SizedBox(
                                        width: 3.0.wp,
                                      ),
                                      Text(
                                        "Kindly Re-Check This Test",
                                        style: textstyle3.copyWith(
                                            fontSize: 10.0.sp),
                                      ),
                                      FlagWidget().warningAmber(),
                                    ],
                                  ))
                            ],
                          ),
                        ),
                      ),
                    );
                  })
                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Material(
                    color: appColor1, // Background color of the button
                    shape: CircleBorder(),
                    child: IconButton(
                      icon: Icon(
                        Icons.preview,
                        color: Colors.white,
                      ),
                      onPressed: () {
                        pdfviewController
                            .pdfPreviewController(
                                context: context,
                                resultType: widget.data!.first.lstvisit.first
                                    .lstorderlist[widget.index].resulttypeno,
                                orderlistno: widget.data!.first.lstvisit.first
                                    .lstorderlist[widget.index].orderlistno,
                                patientNo: widget.data!.first.lstvisit.first
                                    .lstorderlist[widget.index].patientvisitno)
                            .then((value) {
                          Get.to(() => PdfViewerPage(
                                pdfUrl: pdfviewController.getviewlistdata.first
                                    .first.patientExportFile,
                              ));
                        });
                      },
                    )),
                Material(
                    color: appColor1,
                    borderRadius: BorderRadius.all(Radius.circular(25)),
                    child: IconButton(
                        icon: Icon(
                          Icons.edit,
                          size: 14.0.sp,
                          color: Colors.white,
                        ),
                        onPressed: () {
                          var selectedIndex = widget.index;
                          log(selectedIndex.toString());

                          log(widget.data!.first.lstvisit.first
                              .lstorderlist[selectedIndex].resulttypeno
                              .toString());
                          editReportStatusTestWidget(
                              orderListData: widget.data!.first.lstvisit,
                              widgetIndex: widget.index,
                              context: context,
                              selectedIndex: selectedIndex,
                              reportStatus: reportStatus);
                        }))
              ],
            ),
          ]),
        );
    }
  }
}

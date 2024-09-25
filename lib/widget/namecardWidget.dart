// ignore_for_file: must_be_immutable

import 'dart:convert'; // For decoding the base64 string
// import 'dart:math';
import 'dart:developer';
import 'dart:typed_data';

import 'package:doctor_module/const/colors.dart';
import 'package:doctor_module/const/responsive.dart';
import 'package:doctor_module/const/styleText.dart';
import 'package:doctor_module/controller/converterimageBase.dart';
import 'package:doctor_module/controller/viewdetailscontroller/getresult/get_result_listColntoller.dart';
import 'package:doctor_module/model/approvedtestdetailsmodel.dart';
import 'package:doctor_module/model/test_details_model.dart';
import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
import 'package:get/get.dart';
// import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';

String menprofile = "images/menprofile.jpeg";
String womenprofile = "images/girlimage2.jpeg";

class PendingNameCardWidget extends StatefulWidget {
  List<TestDetailsmodel> data;
  // Uint8List? decodedBytes;
  PendingNameCardWidget({
    super.key,
    required this.data,
  });

  @override
  State<PendingNameCardWidget> createState() => _PendingNameCardWidgetState();
}

class _PendingNameCardWidgetState extends State<PendingNameCardWidget> {
  GetResultListcolntoller getreaultlistcontroller = Get.find();
  ConverBaseSixtyFour converBaseSixtyFour = Get.put(ConverBaseSixtyFour());
  // Uint8List? decodedBytes;
  // String base64String = '';
  // convertImage() {
  //   log('yuyu');
  //   // String base64String = "";
  //   if (converBaseSixtyFour.getConvertImageData.isEmpty) {
  //     log("y");
  //     showDialog(
  //         context: context,
  //         builder: (context) {
  //           return Container(
  //               height: 30.0.hp,
  //               width: 30.0.wp,
  //               alignment: Alignment.center,
  //               child: Text('No Image'));
  //         });
  //   } else {
  //     log("x");
  //     if (converBaseSixtyFour.getConvertImageData.first.isNotEmpty) {
  //       setState(() {
  //         base64String = converBaseSixtyFour
  //             .getConvertImageData.first.first.actualBinaryData;
  //         log("base" + base64String);
  //         // Decode the base64 string into Uint8List
  //         decodedBytes = base64Decode(base64String);
  //       });
  //       showDialog(
  //           context: context,
  //           builder: (context) {
  //             return Container(
  //                 height: 30.0.hp,
  //                 width: 30.0.wp,
  //                 alignment: Alignment.center,
  //                 child: Image.memory(decodedBytes!));
  //           });
  //     } else {
  //       showDialog(
  //         context: context,
  //         builder: (context) {
  //           return Material(
  //             color: Colors.transparent,
  //             child: Center(
  //               child: CircleAvatar(
  //                 radius: 50.0.sp, // Using 'r' for radius to scale properly
  //                 child: Icon(
  //                   Icons.person,
  //                   size: 24.0.sp, // 'sp' is suitable for Icon size
  //                 ),
  //               ),
  //             ),
  //           );
  //         },
  //       );
  //     }
  //     // Sample base64 string (replace with your own)

  //     // return decodedBytes;
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.white,
      borderRadius: BorderRadius.circular(25),
      child: SizedBox(
        height: 50.0.hp,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Obx(() {
              return Container(
                  decoration: const BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(25)),
                      color: Colors.white),
                  height: 40.0.hp,
                  width: 58.0.wp,
                  child: expandedContainerCustomized());
            }),
          ],
        ),
      ),
    );
  }

  Widget collapseContainer() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Row(
                  children: [
                    Text("Name : ".toString(), style: testBoxKey),
                    Text(
                      widget.data.first.lstvisit.first.fullname.toString(),
                      style: testBoxValue,
                    )
                  ],
                ),
                Row(
                  children: [
                    Text(
                        "(${widget.data.first.lstvisit.first.agetype.toString()}/",
                        style: testBoxValue),
                    Text(
                        "${widget.data.first.lstvisit.first.gender.toString()})",
                        style: testBoxValue),
                  ],
                ),
              ],
            ),
            Row(
              children: [
                Text(
                  "Patient ID : ",
                  style: testBoxKey,
                ),
                Text(widget.data.first.lstvisit.first.patientid.toString(),
                    style: testBoxValue),
              ],
            ),
          ],
        ),
        IconButton(
            onPressed: () {
              if (getreaultlistcontroller.isExpanded.value == true) {
                getreaultlistcontroller.isExpanded.value = false;
              } else {
                getreaultlistcontroller.isExpanded.value = true;
              }
            },
            icon: Icon(Icons.keyboard_double_arrow_down_sharp))
      ],
    );
  }

  Widget expandedContainerCustomized() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        // Text("Uploaded File’s"),
        CircleAvatar(
          radius: 50.0.sp,
          // child: widget.decodedBytes != null
          //     ? Image.memory(widget.decodedBytes!)
          //     : const SizedBox(),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              children: [
                // Text("Name : ".toString(), style: testBoxKey),
                SizedBox(
                  width: 30.0.wp,
                  child: Align(
                    child: Text(
                      "${widget.data.first.lstvisit.first.fullname} "
                      "(${widget.data.first.lstvisit.first.agetype}/${widget.data.first.lstvisit.first.gender})",
                      textAlign: TextAlign.center,
                      maxLines: 2,
                      style: testBoxValue.copyWith(fontWeight: FontWeight.w700),
                    ),
                  ),
                )
              ],
            ),
            // Row(
            //   mainAxisAlignment: MainAxisAlignment.center,
            //   children: [
            //     SizedBox(
            //       width: 10.0.wp,
            //       child: Text(
            //           ,
            //           maxLines: 2,
            //           style: testBoxValue),
            //     ),
            //   ],
            // ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Patient ID : ",
              style: testBoxKey,
            ),
            Text(widget.data.first.lstvisit.first.patientid.toString(),
                style: testBoxValue.copyWith(color: Colors.grey)),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              children: [
                Text("Visit ID : ", style: testBoxKey),
                Text(widget.data.first.lstvisit.first.visitid.toString(),
                    style: testBoxValue.copyWith(color: Colors.grey)),
              ],
            ),
            // SizedBox(
            //   width: 4.0.wp,
            // ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.calendar_today_outlined,
              color: Colors.black,
              size: 14.0.sp,
            ),
            // SizedBox(
            //   width: 2.0.wp,
            // ),
            Text(widget.data.first.lstvisit.first.visitdttm.toString(),
                style: testBoxValue.copyWith(color: Colors.grey))
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Branch : ", style: testBoxKey),
            SizedBox(
              // width: 45.0.wp,
              child: Text(
                  widget.data.first.lstvisit.first.venueBranchName.toString(),
                  maxLines: 2,
                  style: testBoxValue.copyWith(color: Colors.grey)),
            ),
          ],
        ),
        // Expanded(child: SizedBox()),
      ],
    );
  }
}

class ApprovedNameCardWidget extends StatefulWidget {
  List<ApprovedTestDetailsmodel> data;
  ApprovedNameCardWidget({super.key, required this.data});

  @override
  State<ApprovedNameCardWidget> createState() => _ApprovedNameCardWidgetState();
}

class _ApprovedNameCardWidgetState extends State<ApprovedNameCardWidget> {
  @override
  Widget build(BuildContext context) {
    return Center(
        child: Material(
      color: Colors.white,
      borderRadius: BorderRadius.circular(25),
      child: SizedBox(
          height: 50.0.hp,
          // width: MediaQuery.of(context).size.width / 1.6,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              // Text("Uploaded File’s"),
              CircleAvatar(
                radius: 50.0.sp,
                // child: widget.decodedBytes != null
                //     ? Image.memory(widget.decodedBytes!)
                //     : const SizedBox(),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Row(
                    children: [
                      // Text("Name : ".toString(), style: testBoxKey),
                      SizedBox(
                        width: 30.0.wp,
                        child: Align(
                          child: Text(
                            "${widget.data.first.fullName} "
                            "(${widget.data.first.ageType}/${widget.data.first.gender})",
                            textAlign: TextAlign.center,
                            maxLines: 2,
                            style: testBoxValue.copyWith(
                                fontWeight: FontWeight.w700),
                          ),
                        ),
                      )
                    ],
                  ),
                  // Row(
                  //   mainAxisAlignment: MainAxisAlignment.center,
                  //   children: [
                  //     SizedBox(
                  //       width: 10.0.wp,
                  //       child: Text(
                  //           ,
                  //           maxLines: 2,
                  //           style: testBoxValue),
                  //     ),
                  //   ],
                  // ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Patient ID : ",
                    style: testBoxKey,
                  ),
                  Text(widget.data.first.patientId.toString(),
                      style: testBoxValue.copyWith(color: Colors.grey)),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Row(
                    children: [
                      Text("Visit ID : ", style: testBoxKey),
                      Text(widget.data.first.visitId.toString(),
                          style: testBoxValue.copyWith(color: Colors.grey)),
                    ],
                  ),
                  // SizedBox(
                  //   width: 4.0.wp,
                  // ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.calendar_today_outlined,
                    color: Colors.black,
                    size: 14.0.sp,
                  ),
                  // SizedBox(
                  //   width: 2.0.wp,
                  // ),
                  Text(widget.data.first.visitDttm.toString(),
                      style: testBoxValue.copyWith(color: Colors.grey))
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Branch : ", style: testBoxKey),
                  SizedBox(
                    // width: 45.0.wp,
                    child: Text(widget.data.first.venueBranchName.toString(),
                        maxLines: 2,
                        style: testBoxValue.copyWith(color: Colors.grey)),
                  ),
                ],
              ),
              // Expanded(child: SizedBox()),
            ],
          )
          //  Row(
          //   children: [
          //     // SizedBox(
          //     //   width: 5.0.wp,
          //     // ),
          //     Expanded(
          //       child: Container(
          //         decoration: const BoxDecoration(
          //           borderRadius: BorderRadius.all(Radius.circular(25)),
          //         ),
          //         child: Row(
          //           mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          //           children: [
          //             Flexible(
          //               flex: 3,
          //               child: Padding(
          //                 padding: const EdgeInsets.only(left: 10.0),
          //                 child: Column(
          //                   crossAxisAlignment: CrossAxisAlignment.start,
          //                   // mainAxisAlignment: MainAxisAlignment.center,
          //                   children: [
          //                     Row(
          //                       children: [
          //                         Text("Name : ".toString(),
          //                             style: testBoxKey),
          //                         Text(
          //                           widget.data.first.fullName.toString(),
          //                           style: testBoxValue,
          //                         ),
          //                         Text(
          //                             "(${widget.data.first.ageType.toString()}/",
          //                             style: testBoxValue),
          //                         Text(
          //                             "${widget.data.first.gender.toString()})",
          //                             style: testBoxValue),
          //                       ],
          //                     ),
          //                     Row(
          //                       children: [
          //                         Text(
          //                           "Patient ID : ",
          //                           style: testBoxKey,
          //                         ),
          //                         Text(widget.data.first.patientId.toString(),
          //                             style: testBoxValue),
          //                       ],
          //                     ),
          //                     Row(
          //                       children: [
          //                         Text("Visit ID : ", style: testBoxKey),
          //                         Text(widget.data.first.visitId.toString(),
          //                             style: testBoxValue.copyWith(
          //                                 color: Colors.grey)),
          //                         Icon(
          //                           Icons.calendar_today_outlined,
          //                           color: Colors.black,
          //                           size: 14.0.sp,
          //                         ),
          //                         Text(widget.data.first.visitDttm.toString(),
          //                             style: testBoxValue.copyWith(
          //                                 color: Colors.grey))
          //                       ],
          //                     ),
          //                     Row(
          //                       children: [
          //                         Text("Branch: ", style: testBoxKey),
          //                         Text(
          //                             widget.data.first.venueBranchName
          //                                 .toString(),
          //                             style: testBoxValue.copyWith(
          //                                 color: Colors.grey)),
          //                       ],
          //                     ),
          //                   ],
          //                 ),
          //               ),
          //             ),
          //             SizedBox(
          //               width: 5.0.wp,
          //             ),
          //             Flexible(
          //               flex: 1,
          //               child: Padding(
          //                   padding: const EdgeInsets.all(8.0),
          //                   child: container(widget.data.first.gender)),
          //             )
          //           ],
          //         ),
          //       ),
          //     ),
          //   ],
          // )),

          ),
    ));
  }
}

Widget container(gender) {
  return CircleAvatar(
      radius: 30.0.sp,
      backgroundColor: Colors.white,
      child: Container(
        // height: 70.0.hp,
        // width: 70.0.wp,
        alignment: Alignment.center,
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage(gender == "M" ? menprofile : womenprofile)),
            border: Border.all(
              color: Colors.black,
            ),
            shape: BoxShape.circle),
      ));
}

import 'dart:convert';
import 'dart:developer';
import 'dart:typed_data';

import 'package:doctor_module/const/colors.dart';
import 'package:doctor_module/const/responsive.dart';
import 'package:doctor_module/controller/approvedandrecallbuttoncontroller/apre_3_4controller.dart';
import 'package:doctor_module/controller/converterimageBase.dart';
import 'package:doctor_module/controller/sort/servicefiltercontroller.dart';
import 'package:doctor_module/controller/viewdetailscontroller/getresult/get_result_listColntoller.dart';
import 'package:doctor_module/controller/viewdetailscontroller/pdfviewController.dart';
import 'package:doctor_module/controller/viewdetailscontroller/view_details_controller.dart';
import 'package:doctor_module/model/test_details_model.dart';
import 'package:doctor_module/view/view_Details/servicetypes.dart';
// import 'package:doctor_module/widget/flag%20speeddial.dart';
import 'package:doctor_module/widget/namecardWidget.dart';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ViewPatientDetails extends StatefulWidget {
  const ViewPatientDetails({super.key});

  @override
  State<ViewPatientDetails> createState() => _ViewPatientDetailsState();
}

class _ViewPatientDetailsState extends State<ViewPatientDetails> {
  GetResultListcolntoller getreaultlistcontroller =
      Get.put(GetResultListcolntoller());
  ViewdetailsController viewdetailsController =
      Get.put(ViewdetailsController());

  ServicefilterController servicefilterController =
      Get.put(ServicefilterController());

  PdfviewController pdfviewController = Get.put(PdfviewController());

  AppRe_type_3_4Controller appRe_type_3_4Controller =
      Get.put(AppRe_type_3_4Controller());

  List<TestDetailsmodel> data = <TestDetailsmodel>[];
  Uint8List? decodedBytes;
  String base64String = '';
  ConverBaseSixtyFour converBaseSixtyFour = Get.put(ConverBaseSixtyFour());

  @override
  void initState() {
    fetchData();
    // checkConvertToTrue();
    super.initState();
  }

  // checkConvertToTrue() {
  //   // for (var i = 0;
  //   //     i < widget.data!.first.lstvisit.first.lstorderlist.length;
  //   //     i++) {
  //   //   setState(() {
  //   //     widget.data!.first.lstvisit.first.lstorderlist[i].ischecked = true;
  //   //     widget.data!.first.lstvisit.first.lstorderlist[i].ischecked == true
  //   //         ? pdfviewController.selectAll.value = true
  //   //         : pdfviewController.selectAll.value = false;
  //   //   });
  //   // }
  //   getreaultlistcontroller.getData.first.lstvisit.first.lstorderlist
  //       .forEach((element) {
  //     setState(() {
  //       element.ischecked = true;
  //       element.ischecked == true
  //           ? pdfviewController.selectAll.value = true
  //           : pdfviewController.selectAll.value = false;
  //     });
  //   });
  // }

  fetchData() {
    Future.delayed(Duration.zero, () async {
      await getreaultlistcontroller.getResultController(
          venuBranchId: servicefilterController.selectedBranchId.value,
          patientVisitNo: viewdetailsController.patientVisitNo.value);
    });
  }

  doubleBack() {
    Get.back();
    Get.back();
  }

  Future<void> _showMyDialog({title}) async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return WillPopScope(
            onWillPop: () async {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text(
                      'Pop Screen Disabled. You cannot go to previous screen.'),
                  backgroundColor: Colors.red,
                ),
              );
              return false;
            },
            child: AlertDialog(
              content: Container(
                decoration: const BoxDecoration(
                    image: DecorationImage(
                        image: ExactAssetImage("images/success.png")),
                    color: Colors.transparent),
                height: 20.0.hp,
                width: 60.0.wp,
              ),
              actions: <Widget>[
                TextButton(
                  child: Text(title.toString()),
                  onPressed: () {
                    Future.delayed(Duration.zero, () {
                      fetchData();
                    }).then((value) async {
                      await viewdetailsController.viewlistController(
                          venuBranchNo:
                              servicefilterController.selectedBranchId.value,
                          customerNo:
                              servicefilterController.selectedCustomerid.value,
                          visitId: viewdetailsController.visitIdSearch.text,
                          serviceId:
                              servicefilterController.selectedServiceid.value,
                          serviceType:
                              servicefilterController.selectedServiceType.value,
                          fromDate: viewdetailsController.selectFromDate.value,
                          toDate: viewdetailsController.selectToDate.value);
                    }).then(
                      (value) {
                        pdfviewController.selectAll.value = false;
                        getreaultlistcontroller.getData.first.lstvisit.isEmpty
                            ? doubleBack()
                            : Get.back();
                        Get.forceAppUpdate();
                      },
                    );
                  },
                ),
              ],
            ));
      },
    );
  }

  Future checkConvertToTrue() async {
    for (var i = 0; i < data.first.lstvisit.first.lstorderlist.length; i++) {
      setState(() {
        data.first.lstvisit.first.lstorderlist[i].ischecked = true;
        data.first.lstvisit.first.lstorderlist[i].ischecked == true
            ? pdfviewController.selectAll.value = true
            : pdfviewController.selectAll.value = false;
        print(pdfviewController.selectAll.value);
        Get.forceAppUpdate();
        print(pdfviewController.selectAll.value);
      });
    }
  }

  convertImage() {
    if (converBaseSixtyFour.getConvertImageData.isEmpty) {
      log("y");
    } else {
      log("x");
      if (converBaseSixtyFour.getConvertImageData.first.isNotEmpty) {
        setState(() {
          base64String = converBaseSixtyFour
              .getConvertImageData.first.first.actualBinaryData;
          log("base" + base64String);

          decodedBytes = base64Decode(base64String);
        });
      } else {}
    }
  }

  @override
  Widget build(BuildContext context) {
    // checkConvertToTrue();
    return Scaffold(
        // floatingActionButton: FlagSpeedDial(),
        backgroundColor: Colors.white,
        appBar: PreferredSize(
          preferredSize: Size(0, 5.0.hp),
          child: AppBar(
            backgroundColor: Colors.white,
            centerTitle: true,
            surfaceTintColor: Colors.white,
            title: Text(
              "Pending Test Details",
              style: GoogleFonts.poppins(
                  fontSize: 12.0.sp, fontWeight: FontWeight.bold),
            ),
            elevation: 2,
            shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(
              Radius.circular(30),
            )),
            actions: [
              IconButton(
                  onPressed: () {
                    Fluttertoast.showToast(msg: "History Screen Comming Soon");
                  },
                  icon: Icon(
                    Icons.history,
                    color: Colors.black,
                  )),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: GestureDetector(
                  onTap: () {
                    convertImage();
                    showDialog(
                      context: context,
                      builder: (context) {
                        return Center(
                          child: Material(
                            color:
                                data.first.lstvisit.first.gender.toString() ==
                                        "M"
                                    ? appcolor
                                    : Colors.pink,
                            borderRadius: BorderRadius.circular(25),
                            child: SizedBox(
                                height: 50.0.hp,
                                width: MediaQuery.of(context).size.width / 1.5,
                                child: Row(
                                  children: [
                                    SizedBox(
                                      width: 5.0.wp,
                                    ),
                                    Expanded(
                                      child: SizedBox(
                                        child: PendingNameCardWidget(
                                          // decodedBytes: decodedBytes,
                                          data: data,
                                        ),
                                      ),
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
                        border: Border.all(color: appcolor),
                        shape: BoxShape.circle),
                    child: Icon(
                      Icons.perm_identity_outlined,
                      color: appcolor,
                      size: 20.0.sp,
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
        body: Obx(() {
          if (getreaultlistcontroller.isLoading.isFalse) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (getreaultlistcontroller.getData.first.lstvisit.isEmpty) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  child: Image.asset(
                    "images/noappointment.png",
                    fit: BoxFit.cover,
                  ),
                ),
                const Text(
                  "You don't have any Test history at the moment, but we'll schedule Test  appointments for you soon.",
                  textAlign: TextAlign.center,
                )
              ],
            );
          } else {
            data = getreaultlistcontroller.getData;

            return SafeArea(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
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
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              multiOptionButtons(
                                  onTap: () async {
                                    List tempBool = [];
                                    for (var element in getreaultlistcontroller
                                        .getData.first.lstvisit) {
                                      for (var elements
                                          in element.lstorderlist) {
                                        tempBool.add(elements.ischecked);
                                      }
                                    }
                                    if (tempBool
                                        .every((element) => element == false)) {
                                      Fluttertoast.showToast(
                                          msg: "Select Atleast one Service");
                                    } else {
                                      SharedPreferences pref =
                                          await SharedPreferences.getInstance();
                                      setState(() {
                                        getreaultlistcontroller
                                                .getData.first.venuebranchno =
                                            int.parse(pref
                                                .getString("venueBranchNo")
                                                .toString());
                                        getreaultlistcontroller
                                                .getData.first.venueno =
                                            int.parse(pref
                                                .getString("venueNo")
                                                .toString());
                                        getreaultlistcontroller
                                                .getData.first.userno =
                                            int.parse(pref
                                                .getString("userNo")
                                                .toString());

                                        for (var element
                                            in getreaultlistcontroller
                                                .getData.first.lstvisit) {
                                          for (var elements
                                              in element.lstorderlist) {
                                            if (elements.ischecked == true) {
                                              elements.ischecked = false;
                                              elements.risrecheck = true;
                                            }
                                          }
                                        }
                                        getreaultlistcontroller
                                            .reCheck()
                                            .then((value) {
                                          _showMyDialog(title: "RE-CHECK");
                                        });
                                      });
                                    }
                                  },
                                  color: appColor1,
                                  title: "RE-CHECK"),
                              multiOptionButtons(
                                  color: appColor1,
                                  onTap: () async {
                                    List tempBool = [];
                                    tempBool.clear();

                                    setState(() {
                                      for (var element
                                          in getreaultlistcontroller
                                              .getData.first.lstvisit) {
                                        for (var elements
                                            in element.lstorderlist) {
                                          tempBool.add(elements.ischecked);
                                          if (elements.ischecked == true) {
                                            elements.risrecheck = false;
                                          }
                                        }
                                      }
                                      if (tempBool.every(
                                          (element) => element == false)) {
                                        Fluttertoast.showToast(
                                            msg: "Select Atleast one Service");
                                      } else {
                                        getreaultlistcontroller
                                            .action(action: "SV")
                                            .then((value) {
                                          _showMyDialog(title: "Approve");
                                        });
                                      }
                                    });
                                  },
                                  title: "APPROVE"),
                              Row(
                                children: [
                                  Text(
                                    "Select All",
                                    style: GoogleFonts.poppins(
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  Checkbox(
                                      fillColor:
                                          WidgetStateProperty.resolveWith<
                                              Color>((Set<WidgetState> states) {
                                        if (pdfviewController.selectAll.value ==
                                            true) {
                                          return appcolor;
                                        }
                                        // if (states.contains(WidgetState.disabled)) {
                                        //   return Colors.white.withOpacity(.32);
                                        // }
                                        return Colors.white;
                                      }),
                                      value: pdfviewController.selectAll.value,
                                      onChanged: (e) {
                                        setState(() {
                                          pdfviewController.selectAll.value =
                                              !pdfviewController
                                                  .selectAll.value;
                                          pdfviewController.selectAll.value ==
                                                  true
                                              ? getreaultlistcontroller
                                                  .getData.first.lstvisit
                                                  .forEach((element) {
                                                  for (var elements
                                                      in element.lstorderlist) {
                                                    elements.ischecked = true;
                                                  }
                                                })
                                              : getreaultlistcontroller
                                                  .getData.first.lstvisit
                                                  .forEach((element) {
                                                  for (var elements
                                                      in element.lstorderlist) {
                                                    elements.ischecked = false;
                                                  }
                                                });
                                        });
                                      }),
                                ],
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                      child: SizedBox(
                          child: ListView.builder(
                              padding: EdgeInsets.only(
                                  left: 15.0.sp,
                                  right: 15.0.sp,
                                  top: 8.0.sp,
                                  bottom: 8.0.sp),
                              itemCount:
                                  data.first.lstvisit.first.lstorderlist.length,
                              itemBuilder: (context, index) {
                                return ServiceTypeWidget(
                                  data: data,
                                  servicetypeNo: data.first.lstvisit.first
                                      .lstorderlist[index].resulttypeno,
                                  index: index,
                                );
                              }))),
                  SizedBox(
                    height: 1.0.hp,
                  )
                ],
              ),
            );
          }
        }));
  }
}

multiOptionButtons({title, required void Function() onTap, required color}) {
  return GestureDetector(
    onTap: onTap,
    child: Container(
      decoration: BoxDecoration(
          color: color, borderRadius: BorderRadius.all(Radius.circular(10))),
      height: 4.3.hp,
      width: 20.0.wp,
      alignment: Alignment.center,
      child: Text(
        title.toString(),
        style: GoogleFonts.poppins(
            fontSize: 10.0.sp,
            color: Colors.white,
            fontWeight: FontWeight.bold),
      ),
    ),
  );
}

import 'package:doctor_module/const/colors.dart';
import 'package:doctor_module/const/responsive.dart';
import 'package:doctor_module/const/styleText.dart';
import 'package:doctor_module/controller/dashboardcontroller/dashboardcontroller.dart';
import 'package:doctor_module/controller/refresh.dart/refreshcontroller.dart';
import 'package:doctor_module/controller/viewdetailscontroller/getresult/get_result_listColntoller.dart';
import 'package:doctor_module/controller/viewdetailscontroller/view_details_controller.dart';
import 'package:doctor_module/widget/circle_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class ApprovalListDetailsView extends StatefulWidget {
  const ApprovalListDetailsView({
    super.key,
  });

  @override
  State<ApprovalListDetailsView> createState() =>
      _ApprovalListDetailsViewState();
}

class _ApprovalListDetailsViewState extends State<ApprovalListDetailsView> {
  DashboardScreenController dashboardScreenController = Get.find();

  ViewdetailsController viewdetailsController =
      Get.put(ViewdetailsController());
  GetResultListcolntoller getReaultListController =
      Get.put(GetResultListcolntoller());
  @override
  void initState() {
    super.initState();
  }

  CustomRefreshController customRefreshController =
      Get.put(CustomRefreshController());
  @override
  Widget build(BuildContext context) {
    return Obx(() {
      if (viewdetailsController.isloginLoad.isFalse) {
        return const Center(
          child: CircularProgressIndicator(),
        );
      } else if (viewdetailsController
          .getviewlistdata.first.getDashboardApprovedDetails.isEmpty) {
        return Column(
          children: [
            Expanded(
              child: SizedBox(
                child: Image.asset(
                  "images/noappointment.png",
                  fit: BoxFit.cover,
                ),
              ),
            ),
            const Text(
              "You don't have any appointment history at the moment, but we'll schedule appointments for you soon.",
              textAlign: TextAlign.center,
            ),
            ElevatedButton(
                onPressed: customRefreshController.approveonRefresh,
                child: const Text("refresh"))
          ],
        );
      } else {
        var data = viewdetailsController
            .getviewlistdata.first.getDashboardApprovedDetails;
        return SmartRefresher(
            controller: customRefreshController.refreshControllerapprove,
            onRefresh: customRefreshController.approveonRefresh,
            header: const MaterialClassicHeader(),
            child: ListView.separated(
              separatorBuilder: (context, index) {
                return SizedBox(height: 2.0.hp);
              },
              itemCount: viewdetailsController
                  .getviewlistdata.first.getDashboardApprovedDetails.length,
              shrinkWrap: true,
              itemBuilder: (context, index) {
                return SizedBox(
                  child: Stack(
                    children: [
                      Card(
                        elevation: 2,
                        color: Colors.white,
                        shadowColor:
                            data[index].gender == "M" ? appcolor : Colors.pink,
                        borderOnForeground: true,
                        surfaceTintColor:
                            const Color.fromARGB(255, 225, 225, 225),
                        child: Container(
                          // height: 17.0.hp,
                          decoration: BoxDecoration(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(7.2.sp)),
                              boxShadow: [
                                BoxShadow(
                                    color: data[index].gender == "M"
                                        ? appcolor
                                        : Colors.pink,
                                    blurRadius: 2,
                                    blurStyle: BlurStyle.outer),
                                BoxShadow(
                                    color: data[index].gender == "M"
                                        ? appcolor
                                        : Colors.pink,
                                    blurRadius: 2,
                                    blurStyle: BlurStyle.outer)
                              ]),
                          width: MediaQuery.of(context).size.width,
                          child: Padding(
                            padding: EdgeInsets.all(15.0.sp),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Container(
                                  color: Colors.transparent,
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Expanded(
                                        child: SizedBox(
                                          // width: 25.0.wp,
                                          child: Text(
                                            data[index].fullName,
                                            maxLines: 2,
                                            style: textstyle3.copyWith(
                                                fontSize: 12.0.sp),
                                          ),
                                        ),
                                      ),
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.end,
                                        children: [
                                          Row(
                                            children: [
                                              Text(
                                                "${data[index].ageType} Old",
                                                style: GoogleFonts.jost(
                                                    fontWeight: FontWeight.bold,
                                                    color: const Color.fromARGB(
                                                        255, 77, 77, 76),
                                                    fontSize: 10.0.sp),
                                              ),
                                            ],
                                          ),
                                          Container(
                                            height: 3.0.hp,
                                            width: 21.0.wp,
                                            alignment: Alignment.centerRight,
                                            child: Text(
                                              data[index].taskDttm ==
                                                      DateFormat('MM/dd/yyyy')
                                                          .format(
                                                              DateTime.now())
                                                  ? "Today"
                                                  : data[index].taskDttm,
                                              style: GoogleFonts.jost(
                                                  color: Colors.black,
                                                  fontSize: 10.0.sp),
                                            ),
                                          ),
                                        ],
                                      )
                                    ],
                                  ),
                                ),
                                SizedBox(
                                  height: 1.5.hp,
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Row(
                                          children: [
                                            Text("Total Records : ",
                                                style: GoogleFonts.jost(
                                                    color: Colors.black,
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 10.0.sp)),
                                            CircleAvatar(
                                                radius: 8.0.sp,
                                                backgroundColor:
                                                    data[index].gender == "M"
                                                        ? appcolor
                                                        : const Color.fromARGB(
                                                            255, 222, 95, 137),
                                                child: Text(
                                                  data[index]
                                                      .totalRecords
                                                      .toString(),
                                                  style: GoogleFonts.jost(
                                                      color: Colors.white,
                                                      fontWeight:
                                                          FontWeight.w800,
                                                      fontSize: 10.0.sp),
                                                )),
                                          ],
                                        ),
                                      ],
                                    ),
                                    multiButton(
                                        onTap: () {
                                          getReaultListController
                                                  .taskDttm.value =
                                              data[index].taskDttm.toString();
                                          viewdetailsController
                                                  .patientVisitNo.value =
                                              data[index].patientVisitNo;
                                          Get.toNamed("/recallpage");
                                        },
                                        bgcolor: appColor1,
                                        borderRadius: 5.0.sp,
                                        height: 3.8.hp,
                                        multiwidget: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Text(
                                              "VIEW DETAILS",
                                              style: GoogleFonts.jost(
                                                  fontWeight: FontWeight.w700,
                                                  color: Colors.white,
                                                  fontSize: 8.5.sp),
                                            ),
                                            SizedBox(
                                              width: 2.0.wp,
                                            ),
                                            const Icon(
                                              Icons.keyboard_double_arrow_right,
                                              color: Colors.white,
                                            )
                                          ],
                                        ),
                                        width: 30.0.wp),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                        top: -2,
                        child: SizedBox(
                          child: Icon(
                            Icons.bookmark,
                            color: data[index].vIsStat == true
                                ? Colors.red
                                : data[index].vIsCritical == true
                                    ? Colors.orange
                                    : data[index].vIsAbnormal == true
                                        ? Colors.yellow
                                        : Colors.black,
                            size: 25.0.sp,
                          ),
                        ),
                      ),
                    ],
                  ),
                );
              },
            ));
      }
    });
  }
}

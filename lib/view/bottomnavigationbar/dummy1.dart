// ignore_for_file: must_be_immutable

import 'dart:developer';

import 'package:doctor_module/const/colors.dart';
import 'package:doctor_module/const/responsive.dart';
import 'package:doctor_module/const/styleText.dart';
import 'package:doctor_module/controller/dashboardcontroller/dashboardcontroller.dart';
import 'package:doctor_module/controller/logincontroller/loginscreen_controller.dart';
import 'package:doctor_module/controller/sort/routdetailcontroller.dart';
import 'package:doctor_module/controller/sort/servicefiltercontroller.dart';
import 'package:doctor_module/controller/viewdetailscontroller/view_details_controller.dart';
import 'package:doctor_module/view/dashboard/approvallist.dart';
import 'package:doctor_module/view/dashboard/filterlistdropdown.dart';
import 'package:doctor_module/view/dashboard/nonapprovallist.dart';
import 'package:doctor_module/view/dashboard/selectTypetosearch.dart';
import 'package:doctor_module/widget/circle_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';

import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class Dummy1 extends StatefulWidget {
  const Dummy1({super.key});

  @override
  State<Dummy1> createState() => _Dummy1State();
}

class _Dummy1State extends State<Dummy1> with TickerProviderStateMixin {
  TabController? tabController;
  TabController? sorttabController;

  DateTime? currentBackPressTime;
  onWillPop() {
    DateTime now = DateTime.now();
    if (currentBackPressTime == null ||
        now.difference(currentBackPressTime!) > const Duration(seconds: 2)) {
      currentBackPressTime = now;
      Fluttertoast.showToast(msg: "Double Tap to Exit");
    } else {
      SystemChannels.platform.invokeMethod('SystemNavigator.pop');
    }
  }

  DashboardScreenController dashboardScreenController =
      Get.put(DashboardScreenController());
  LoginscreenController loginscreenController =
      Get.put(LoginscreenController());
  ViewdetailsController viewdetailsController =
      Get.put(ViewdetailsController());
  RoutelistController routelistController = Get.put(RoutelistController());
  ServicefilterController servicefilterController =
      Get.put(ServicefilterController());
  @override
  void initState() {
    tabController = TabController(length: 2, vsync: this);
    sorttabController = TabController(length: 3, vsync: this);

    viewdetailsController.searchType.value = "0";
    viewdetailsController.visitIdSearch.text = "";
    viewdetailsController.searchName.value = "All";
    defaultSettings();
    fetchData();
    super.initState();
  }

  defaultSettings() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    servicefilterController.selectedBranchName.value = "";
    servicefilterController.selectedBranchId.value =
        pref.getString("venueBranchNo").toString();

    servicefilterController.selectedServiceType.value = " ";
    servicefilterController.selectedServicename.value = "";
    servicefilterController.selectedServiceid.value = "0";

    servicefilterController.selectedCustomername.value = "";
    servicefilterController.selectedCustomerid.value = "0";

    viewdetailsController.searchType.value = "0";
    viewdetailsController.searchName.value = "All";

    viewdetailsController.visitIdSearch.clear();

    viewdetailsController.isIconVisible.value = false;
  }

  fetchData() {
    viewdetailsController.selectFromDate.value =
        DateFormat("yyyy-MM-dd").format(viewdetailsController.selectedFromDate);
    viewdetailsController.selectToDate.value =
        DateFormat("yyyy-MM-dd").format(viewdetailsController.selectedToDate);

    Future.delayed(Duration.zero, () async {
      await viewdetailsController.viewlistController(
          venuBranchNo: servicefilterController.selectedBranchId.value,
          customerNo: servicefilterController.selectedCustomerid.value,
          visitId: viewdetailsController.visitIdSearch.text,
          serviceId: servicefilterController.selectedServiceid.value,
          serviceType: servicefilterController.selectedServiceType.value,
          fromDate: viewdetailsController.selectFromDate.value,
          toDate: viewdetailsController.selectToDate.value);
    });

    Future.delayed(Duration.zero, () async {
      await routelistController.routelistController();
    });

    Future.delayed(Duration.zero, () async {
      await servicefilterController.servicefilterController();
    });
    Future.delayed(Duration.zero, () async {
      await servicefilterController.branchfilterController();
    });

    doctoName();
  }

  doctoName() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    viewdetailsController.docName.value =
        sharedPreferences.getString("_doctorName").toString();
    log('tokeen');
    log(viewdetailsController.docName.value.toString());
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () {
        return onWillPop();
      },
      child: Container(
        color: Colors.white,
        child: DefaultTabController(
          initialIndex: 1,
          length: 2,
          child: SafeArea(
            child: Padding(
                padding: const EdgeInsets.fromLTRB(25, 25, 25, 0),
                child: SizedBox(
                  child: Column(
                    children: [
                      SizedBox(
                        height: 1.5.hp,
                      ),
                      Obx(() {
                        return Visibility(
                          visible: viewdetailsController.searchType.value == "0"
                              ? false
                              : true,
                          child: const Tagsdetails(),
                        );
                      }),
                      SizedBox(
                        height: 1.5.hp,
                      ),
                      TopicfilterDetails(
                        sorttabcontroller: sorttabController,
                      ),
                      SizedBox(
                        height: 1.5.hp,
                      ),
                      SizedBox(
                        child: TabBar(
                          dividerColor: Colors.transparent,
                          indicatorColor: Colors.transparent,
                          controller: tabController,
                          splashBorderRadius: BorderRadius.circular(20),
                          unselectedLabelColor: Colors.grey,
                          tabAlignment: TabAlignment.fill,
                          tabs: [
                            Obx(() {
                              if (viewdetailsController.isloginLoad.isFalse) {
                                return const Center(
                                  child: CircularProgressIndicator(),
                                );
                              } else if (viewdetailsController
                                  .getviewlistdata
                                  .first
                                  .getDashboardNonApprovedDetails
                                  .isEmpty) {
                                return const Tab(
                                  text: 'Result Approval (0)',
                                );
                              } else {
                                return Tab(
                                  text:
                                      'Result Approval (${viewdetailsController.getviewlistdata.first.getDashboardNonApprovedDetails.length})',
                                );
                              }
                            }),
                            Obx(() {
                              if (viewdetailsController.isloginLoad.isFalse) {
                                return const Center(
                                  child: CircularProgressIndicator(),
                                );
                              } else if (viewdetailsController.getviewlistdata
                                  .first.getDashboardApprovedDetails.isEmpty) {
                                return const Tab(
                                  text: ' Result Recall (0)',
                                );
                              } else {
                                return Tab(
                                  text:
                                      '  Result Recall (${viewdetailsController.getviewlistdata.first.getDashboardApprovedDetails.length})',
                                );
                              }
                            }),
                          ],
                          onTap: (value) {
                            dashboardScreenController.tabs_count.value =
                                value.toString();
                            print(dashboardScreenController.tabs_count.value);
                          },
                          isScrollable: false,
                          labelColor: Colors.black,
                        ),
                      ),
                      Expanded(
                        child: SizedBox(
                          child: TabBarView(
                              controller: tabController,
                              children: const [
                                ListDetailsView(),
                                ApprovalListDetailsView(),
                              ]),
                        ),
                      ),
                    ],
                  ),
                )),
          ),
        ),
      ),
    );
  }
}

class Userdetails extends StatefulWidget {
  const Userdetails({
    super.key,
  });

  @override
  State<Userdetails> createState() => _UserdetailsState();
}

class _UserdetailsState extends State<Userdetails> {
  ViewdetailsController viewdetailsController = Get.find();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Obx(() {
            return Text(
              viewdetailsController.docName.value.toString(),
              style: textstyle3,
            );
          }),
          CircleAvatar(
            radius: 18.0.sp,
            backgroundImage:
                const ExactAssetImage("images/docto_sample_logo1.jpg"),
          )
        ],
      ),
    );
  }
}

class Tagsdetails extends StatefulWidget {
  const Tagsdetails({super.key});

  @override
  State<Tagsdetails> createState() => _TagsdetailsState();
}

class _TagsdetailsState extends State<Tagsdetails> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 3.0.hp,
      color: Colors.transparent,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Container(
              // width: 50.0.wp,
              color: Colors.transparent,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  newWidget(
                      tagscolor: Transform.flip(
                        flipX: true,
                        // angle: 80,
                        child: FaIcon(
                          FontAwesomeIcons
                              .ambulance, // FontAwesome ambulance icon
                          size: 8.0.sp, // Set the size of the icon
                          color: Colors.red, // Set the color of the icon
                        ),
                      ),
                      title: "Stat"),
                  newWidget(
                      tagscolor: Icon(
                        Icons.flag, // FontAwesome ambulance icon
                        size: 10.0.sp, // Set the size of the icon
                        color: Colors.yellow, // Set the color of the icon
                      ),
                      title: "Critical"),
                  newWidget(
                      tagscolor: Icon(
                        Icons.flag, // FontAwesome ambulance icon
                        size: 10.0.sp, // Set the size of the icon
                        color: Colors.red, // Set the color of the icon
                      ),
                      title: "Abnormal"),
                ],
              ))
        ],
      ),
    );
  }
}

Widget newWidget({Widget? tagscolor, title}) {
  return Container(
    color: Colors.transparent,
    // width: 14.5.wp,
    child: Row(
      // mainAxisAlignment: MainAxisAlignment.space,
      children: [
        Container(
            // height: .5.hp,
            // width: 3.5.wp,
            alignment: Alignment.center,
            color: Colors.transparent,
            child: tagscolor
            // decoration: BoxDecoration(color: tagscolor, shape: BoxShape.circle)
            ),
        SizedBox(
          width: 1.0.wp,
        ),
        Container(
          color: Colors.transparent,
          child: Text(
            title,
            style: textstyle3.copyWith(fontSize: 8.0.sp),
          ),
        ),
      ],
    ),
  );
}

class TopicfilterDetails extends StatefulWidget {
  var sorttabcontroller;
  TopicfilterDetails({super.key, required this.sorttabcontroller});

  @override
  State<TopicfilterDetails> createState() => _TopicfilterDetailsState();
}

class _TopicfilterDetailsState extends State<TopicfilterDetails> {
  String selectedDate = '';
  ViewdetailsController viewdetailsController = Get.find();
  RoutelistController routelistController = Get.find();
  ServicefilterController servicefilterController = Get.find();
  final DateTime now = DateTime.now();
  final DateFormat formatter = DateFormat('yyyy-MM-dd');
  List tempDate = [];

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 6.0.hp,
      color: Colors.transparent,
      alignment: Alignment.center,
      child: Row(
        // mainAxisAlignment: viewdetailsController.searchType.value == "0"
        //     ? MainAxisAlignment.spaceEvenly
        //     : MainAxisAlignment.spaceEvenly,
        children: [
          Obx(() {
            return viewdetailsController.searchType.value == "0"
                ? Container(
                    width: MediaQuery.of(context).size.width / 2.5,
                    color: Colors.transparent,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        newWidget(
                            tagscolor: Transform.flip(
                              flipX: true,
                              // angle: 80,
                              child: FaIcon(
                                FontAwesomeIcons
                                    .ambulance, // FontAwesome ambulance icon
                                size: 8.0.sp, // Set the size of the icon
                                color: Colors.red, // Set the color of the icon
                              ),
                            ),
                            title: "Stat"),
                        newWidget(
                            tagscolor: Icon(
                              Icons.flag, // FontAwesome ambulance icon
                              size: 10.0.sp, // Set the size of the icon
                              color: Colors.yellow, // Set the color of the icon
                            ),
                            title: "Critical"),
                        newWidget(
                            tagscolor: Icon(
                              Icons.flag, // FontAwesome ambulance icon
                              size: 10.0.sp, // Set the size of the icon
                              color: Colors.red, // Set the color of the icon
                            ),
                            title: "Abnormal"),
                      ],
                    ))
                : Expanded(
                    child: Card(
                      color: Colors.white,
                      elevation: 2,
                      child: TextFormField(
                        readOnly: viewdetailsController.searchType.value == "0"
                            ? true
                            : false,
                        onTap: () {
                          viewdetailsController.searchType.value == "0"
                              ? Fluttertoast.showToast(
                                  msg: "Select Search Type")
                              : null;
                        },
                        controller: viewdetailsController.visitIdSearch,
                        onFieldSubmitted: (value) async {
                          await viewdetailsController.viewlistController(
                              venuBranchNo: servicefilterController
                                  .selectedBranchId.value,
                              customerNo: servicefilterController
                                  .selectedCustomerid.value,
                              fromDate:
                                  viewdetailsController.selectFromDate.value,
                              visitId: value,
                              serviceId: servicefilterController
                                  .selectedServiceid.value,
                              serviceType: servicefilterController
                                  .selectedServiceType.value,
                              toDate: viewdetailsController.selectToDate.value);
                        },
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          focusedBorder: InputBorder.none,
                          enabledBorder: InputBorder.none,
                          errorBorder: InputBorder.none,
                          disabledBorder: InputBorder.none,
                          iconColor: Colors.transparent,
                          suffixIcon: viewdetailsController.isIconVisible.value
                              ? IconButton(
                                  onPressed: () {
                                    searchSuffixbutton();
                                  },
                                  icon: const CircleAvatar(
                                    backgroundColor: Colors.white,
                                    child: Icon(
                                      Icons.close_outlined,
                                      size: 16,
                                      applyTextScaling: true,
                                      weight: 20.0,
                                    ),
                                  ),
                                )
                              : null,
                          icon: const Icon(
                            Icons.search,
                            size: 4,
                          ),
                          hintText: viewdetailsController.searchType.value ==
                                  "1"
                              ? "Enter Patient Id..."
                              : viewdetailsController.searchType.value == "2"
                                  ? 'Enter Patient Name...'
                                  : "",
                          hintStyle: textStyle2,
                        ),
                        cursorColor: appcolor,
                        onChanged: (value) {
                          setState(() => value.isNotEmpty
                              ? viewdetailsController.isIconVisible.value = true
                              : viewdetailsController.isIconVisible.value =
                                  false);
                        },
                      ),
                    ),
                  );
          }),
          // Expanded(child: SizedBox()),
          SizedBox(child: const DropdownButtonExample()),
          Container(
            height: 5.0.hp,
            color: Colors.transparent,
            child: Row(
              children: [
                IconButton(
                    onPressed: () {
                      viewdetailsController.tempselectFromDate.value = "";
                      viewdetailsController.tempselectToDate.value = "";
                      viewdetailsController.searchType.value != "0"
                          ? Fluttertoast.showToast(
                              msg:
                                  "You cannot filter date while selecting search")
                          : showDialog(
                              barrierDismissible: false,
                              context: context,
                              builder: (_) => Center(
                                    child: Container(
                                      height: 50.0.hp,
                                      width: 90.0.wp,
                                      alignment: Alignment.center,
                                      color: Colors.white,
                                      child: SfDateRangePicker(
                                        confirmText: "Ok",
                                        showActionButtons: true,
                                        onSubmit: (p0) {
                                          calenderOnsubmit();
                                        },
                                        selectionTextStyle: const TextStyle(
                                            color: Colors.white),
                                        startRangeSelectionColor: Colors.green,
                                        endRangeSelectionColor: Colors.green,
                                        rangeSelectionColor: Colors.green,
                                        todayHighlightColor: Colors.green,
                                        selectionShape:
                                            DateRangePickerSelectionShape
                                                .rectangle,
                                        headerStyle:
                                            const DateRangePickerHeaderStyle(
                                                textAlign: TextAlign.center,
                                                textStyle: TextStyle(
                                                    color: Colors.white,
                                                    fontWeight:
                                                        FontWeight.w500),
                                                backgroundColor: appcolor),
                                        monthCellStyle:
                                            const DateRangePickerMonthCellStyle(
                                          todayTextStyle: TextStyle(
                                              color: Colors.green,
                                              fontSize: 20.0),
                                          weekendTextStyle:
                                              TextStyle(color: Colors.yellow),
                                        ),
                                        yearCellStyle:
                                            const DateRangePickerYearCellStyle(
                                          todayTextStyle:
                                              TextStyle(color: Colors.blue),
                                        ),
                                        onCancel: () {
                                          Get.back();
                                        },
                                        onSelectionChanged:
                                            (dateRangePickerSelectionChangedArgs) =>
                                                _onSelectionChanged(
                                                    args:
                                                        dateRangePickerSelectionChangedArgs),
                                        selectionMode:
                                            DateRangePickerSelectionMode.range,
                                        enablePastDates: true,
                                      ),
                                    ),
                                  ));
                    },
                    icon: const Icon(Icons.calendar_month_outlined))
              ],
            ),
          ),
          SizedBox(
              height: 5.0.hp,
              // width: 10.0.wp,
              child: IconButton(
                  onPressed: () {
                    temptoparentsortFilter();

                    showModalBottomSheet(
                      context: context,
                      isDismissible: false,
                      builder: (BuildContext context) {
                        return DefaultTabController(
                            initialIndex: 1,
                            length: 3,
                            child: Container(
                              decoration: const BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(25),
                                      topRight: Radius.circular(25))),
                              child: Column(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(12.0),
                                    child: SizedBox(
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            "Sort by",
                                            style: GoogleFonts.jost(
                                                fontWeight: FontWeight.w700,
                                                color: Colors.black),
                                          ),
                                          GestureDetector(
                                            onTap: () {
                                              Navigator.of(context).pop();
                                            },
                                            child: const CircleAvatar(
                                              radius: 15,
                                              backgroundColor: Colors.red,
                                              child: Icon(
                                                Icons.close_rounded,
                                                color: Colors.white,
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  // SizedBox(
                                  //   child: ServiceFilterDropdown(
                                  //     datas: servicefilterController
                                  //         .getviewlistdata
                                  //         .first
                                  //         . getServiceDetails,
                                  //   ),
                                  // ),
                                  const Divider(),
                                  SizedBox(
                                    child: CustomerFilterDropdown(
                                      datas: routelistController.getviewlistdata
                                          .first.getCustomerDetails,
                                    ),
                                  ),
                                  const Divider(),
                                  SizedBox(
                                    child: BranchFilterDropdown(
                                      datas: servicefilterController
                                          .getviewlistbranchdata,
                                    ),
                                  ),
                                  const Divider(),
                                  const Expanded(child: SizedBox()),
                                  multiButton(
                                      onTap: () {
                                        sortapplybutton();
                                      },
                                      bgcolor: appcolor,
                                      borderRadius: 0.0.sp,
                                      height: 5.5.hp,
                                      multiwidget: Text(
                                        "APPLY",
                                        style: GoogleFonts.jost(
                                            fontWeight: FontWeight.w700,
                                            color: Colors.white),
                                      ),
                                      width: MediaQuery.of(context).size.width /
                                          2),
                                  SizedBox(
                                    height: 2.0.hp,
                                  )
                                ],
                              ),
                            ));
                      },
                    );
                  },
                  icon: const Icon(
                    Icons.swap_vert,
                    color: Colors.black,
                  )))
        ],
      ),
    );
  }

  Future<void> calenderOnsubmit() async {
    // Assign temporary selected dates to the final selected dates
    viewdetailsController.selectFromDate.value =
        viewdetailsController.tempselectFromDate.value;
    viewdetailsController.selectToDate.value =
        viewdetailsController.tempselectToDate.value;

    // Check if either of the dates is empty
    if (viewdetailsController.selectFromDate.value.isEmpty) {
      Fluttertoast.showToast(msg: "Please Select From Date");
    } else if (viewdetailsController.selectToDate.value.isEmpty) {
      Fluttertoast.showToast(msg: "Please Select To Date");
    } else {
      // If dates are selected, proceed with the viewlistController function
      await viewdetailsController
          .viewlistController(
        venuBranchNo: servicefilterController.selectedBranchId.value,
        customerNo: servicefilterController.selectedCustomerid.value.isEmpty
            ? "0"
            : servicefilterController.selectedCustomerid.value,
        visitId: viewdetailsController.visitIdSearch.text,
        serviceId: servicefilterController.selectedServiceid.value.isEmpty
            ? "0"
            : servicefilterController.selectedServiceid.value.toString(),
        serviceType: servicefilterController.selectedServiceType.value.isEmpty
            ? " "
            : servicefilterController.selectedServiceType.value.toString(),
        fromDate: viewdetailsController.selectFromDate.value,
        toDate: viewdetailsController.selectToDate.value,
      )
          .then((value) {
        Get.back(); // Navigate back if the function succeeds
      });
    }
  }

  searchSuffixbutton() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    viewdetailsController.isIconVisible.value = false;
    viewdetailsController.visitIdSearch.clear();

    servicefilterController.selectedServiceType.value = " ";
    servicefilterController.selectedServicename.value = "";
    servicefilterController.selectedServiceid.value = "0";
    servicefilterController.selectedBranchId.value =
        pref.getString("venueBranchNo").toString();
    servicefilterController.selectedBranchName.value = "";

    servicefilterController.selectedCustomername.value = "";
    servicefilterController.selectedCustomerid.value = "0";

    viewdetailsController.searchType.value = "0";
    viewdetailsController.searchName.value = "All";

    await viewdetailsController.viewlistController(
      venuBranchNo: servicefilterController.selectedBranchId.value,
      customerNo: servicefilterController.selectedCustomerid.value,
      // fromDate: formatter
      //     .format(DateTime(DateTime.now().year, DateTime.now().month, 1)),
      visitId: viewdetailsController.visitIdSearch.text,
      serviceId: servicefilterController.selectedServiceid.value,
      serviceType: servicefilterController.selectedServiceType.value,
      // toDate: formatter.format(DateTime.now()).toString(),
      fromDate: viewdetailsController.selectFromDate.value,
      toDate: viewdetailsController.selectToDate.value,
    );
    log(
      formatter.format(DateTime.now()).toString(),
    );
    log(viewdetailsController.selectToDate.value);
  }

  sortapplybutton() async {
    servicefilterController.selectedCustomerid.value =
        servicefilterController.tempSelectedCustomerid.value;
    servicefilterController.selectedCustomername.value =
        servicefilterController.tempSelectedCustomername.value;
    servicefilterController.selectedServicename.value =
        servicefilterController.tempSelectedServicename.value;
    servicefilterController.selectedServiceid.value =
        servicefilterController.tempSelectedServiceid.value;
    servicefilterController.selectedServiceType.value =
        servicefilterController.tempSelectedServiceType.value;

    servicefilterController.selectedBranchName.value =
        servicefilterController.tempSelectedBranchName.value;

    servicefilterController.selectedBranchId.value =
        servicefilterController.tempSelectedBranchId.value;

    await viewdetailsController.viewlistController(
        venuBranchNo: servicefilterController.tempSelectedBranchId.value,
        customerNo: servicefilterController.selectedCustomerid.value == ""
            ? "0"
            : servicefilterController.selectedCustomerid.value,
        visitId: viewdetailsController.visitIdSearch.text,
        serviceId: servicefilterController.selectedServiceid.value == ""
            ? "0"
            : servicefilterController.selectedServiceid.value.toString(),
        serviceType: servicefilterController.selectedServiceType.value == ""
            ? " "
            : servicefilterController.selectedServiceType.value.toString(),
        fromDate: viewdetailsController.selectFromDate.value,
        toDate: viewdetailsController.selectToDate.value);

    Get.back();
  }

  // void _onSelectionChanged({DateRangePickerSelectionChangedArgs? args}) async {
  //   var selectedDate = args!.value;
  //
  //   viewdetailsController.tempselectFromDate.value =
  //       formatter.format(selectedDate.startDate);
  //   viewdetailsController.tempselectToDate.value =
  //       formatter.format(selectedDate.endDate);
  //   print(viewdetailsController.tempselectFromDate.value);
  //   print(viewdetailsController.tempselectToDate.value);
  // }
  void _onSelectionChanged({DateRangePickerSelectionChangedArgs? args}) async {
    // Ensure args and its value are not null
    if (args == null || args.value == null) return;

    var selectedDate = args.value;

    // Check if startDate and endDate are not null
    if (selectedDate.startDate != null && selectedDate.endDate != null) {
      viewdetailsController.tempselectFromDate.value =
          formatter.format(selectedDate.startDate!);
      viewdetailsController.tempselectToDate.value =
          formatter.format(selectedDate.endDate!);

      print(viewdetailsController.tempselectFromDate.value);
      print(viewdetailsController.tempselectToDate.value);
    } else {
      // viewdetailsController.tempselectToDate.value=  formatter.format(selectedDate.endDate!);
      // Handle the case where startDate or endDate is null
      print('Selected date range contains null values');
    }
  }

  temptoparentsortFilter() {
    Future.delayed(Duration.zero, () async {
      servicefilterController.tempSelectedCustomername.value =
          servicefilterController.selectedCustomername.value.toString();
      servicefilterController.tempSelectedCustomerid.value =
          servicefilterController.selectedCustomerid.value.toString();
      servicefilterController.tempSelectedServiceType.value =
          servicefilterController.selectedServiceType.value.toString();
      servicefilterController.tempSelectedServiceid.value =
          servicefilterController.selectedServiceid.value.toString();
      servicefilterController.tempSelectedServicename.value =
          servicefilterController.selectedServicename.value.toString();
      servicefilterController.tempSelectedBranchName.value =
          servicefilterController.selectedBranchName.value.toString();
      servicefilterController.tempSelectedBranchId.value =
          servicefilterController.selectedBranchId.value.toString();
    });
  }
}

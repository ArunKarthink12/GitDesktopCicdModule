import 'dart:developer';

import 'package:doctor_module/const/responsive.dart';
import 'package:doctor_module/const/styleText.dart';
import 'package:doctor_module/controller/viewdetailscontroller/view_details_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
// import 'package:webviewx/webviewx.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
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

  ViewdetailsController viewdetailsController =
      Get.put(ViewdetailsController());
  @override
  void initState() {
    fetchData();
    super.initState();
  }

  fetchData() {
    doctoName();
  }

  doctoName() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    viewdetailsController.docName.value =
        sharedPreferences.getString("_doctorName").toString();
    log('tokeen');
    log(viewdetailsController.docName.value.toString());
  }

  // late WebViewXController webViewController;

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () {
        return onWillPop();
      },
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: DefaultTabController(
          initialIndex: 1,
          length: 2,
          child: SafeArea(
            child: Padding(
                padding: EdgeInsets.all(20.0.sp),
                child: SizedBox(
                  child: Column(
                    children: [
                      const Userdetails(),
                      SizedBox(
                        height: 1.5.hp,
                      ),
                      // Expanded(
                      //   child: WebViewX(
                      //     initialContent:
                      //         '<iframe title="PowerBITest - Page 1" width="100%" height="${MediaQuery.of(context).size.height - 100}" src="https://app.powerbi.com/reportEmbed?reportId=22168d3a-f9b7-4fee-843c-81cd38df3e1b&autoAuth=true&ctid=6b61b229-6177-49c2-9e92-caa8fd2f4f7f&config=eyJjbHVzdGVyVXJsIjoiaHR0cHM6Ly93YWJpLXdlc3QtZXVyb3BlLWQtcHJpbWFyeS1yZWRpcmVjdC5hbmFseXNpcy53aW5kb3dzLm5ldC8ifQ%3D%3D" frameborder="0" allowFullScreen="true"></iframe>',
                      //     initialSourceType: SourceType.HTML,
                      //     onWebViewCreated: (controller) =>
                      //         webViewController = controller,
                      //     width: MediaQuery.of(context).size.width,
                      //     height: 20.0.hp,
                      //   ),
                      // ),
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
  ViewdetailsController viewdetailsController =
      Get.put(ViewdetailsController());

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

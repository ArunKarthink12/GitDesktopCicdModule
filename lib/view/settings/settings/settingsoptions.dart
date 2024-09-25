import 'package:doctor_module/const/responsive.dart';
import 'package:doctor_module/const/styleText.dart';
import 'package:doctor_module/controller/logincontroller/loginscreen_controller.dart';
import 'package:doctor_module/controller/personaldetailscontroller/personaldetailscontroller.dart';
import 'package:doctor_module/controller/viewdetailscontroller/view_details_controller.dart';
import 'package:doctor_module/view/bottomnavigationbar/bottomnavibar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Profilesettings extends StatefulWidget {
  const Profilesettings({super.key});

  @override
  State<Profilesettings> createState() => _ProfilesettingsState();
}

class _ProfilesettingsState extends State<Profilesettings> {
  Personaldetailscontroller personaldetailscontroller =
      Get.put(Personaldetailscontroller());
  @override
  void initState() {
    Future.delayed(Duration.zero, () async {
      SharedPreferences pref = await SharedPreferences.getInstance();

      personaldetailscontroller.role.value =
          pref.getString("_roleDetails").toString();
      personaldetailscontroller.qualification.value =
          pref.getString("_qualification").toString();

      personaldetailscontroller.mobile_num.value =
          pref.getString("_contactNumber").toString();
    });

    super.initState();
  }

  ViewdetailsController viewdetailsController =
      Get.put(ViewdetailsController());
  back() {
    setState(() {
      selectedIndex = 1;
    });
    Get.toNamed("/bottomnavibar");
    Get.forceAppUpdate();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () {
        return back();
      },
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          centerTitle: true,
          automaticallyImplyLeading: false,
          title: Text(
            'PROFILE',
            style: header,
          ),
        ),
        body: SingleChildScrollView(
            child: Padding(
                padding: const EdgeInsets.only(
                  left: 10.0,
                  right: 10.0,
                ),
                child: Obx(() {
                  return Column(
                    children: [
                      ListTile(
                        onTap: () {
                          Get.toNamed("/personaldetails");
                        },
                        contentPadding: const EdgeInsets.symmetric(
                            horizontal: 0, vertical: 0),
                        leading: CircleAvatar(
                          radius: 15.0.sp,
                        ),
                        title: Obx(() {
                          return Text(
                            viewdetailsController.docName.value.toString(),
                            style: textstyle3,
                          );
                        }),
                        subtitle: Text(personaldetailscontroller.role.value,
                            style: qualificationstyle),
                      ),
                      Card(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10)),
                        child: const OptionList(),
                      ),
                    ],
                  );
                }))),
      ),
    );
  }
}

class OptionList extends StatefulWidget {
  const OptionList({Key? key}) : super(key: key);

  @override
  State<OptionList> createState() => _OptionListState();
}

class _OptionListState extends State<OptionList> {
  var menuoptions = [
    'Professional Details',
    'Support',
    'Terms & Condition',
    'Change Password',
    'LogOut',
  ];
  var images = [
    'images/professional.png',
    'images/support.png',
    'images/termsanCondition.png',
    'images/changepassword.png',
    'images/logout.png',
  ];
  var menuscreens = [
    "professionaldetails",
    "supportscreen",
    "termsandcondition",
    "changepassword",
  ];
  LoginscreenController loginscreenController =
      Get.put(LoginscreenController());
  exitApp(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(
            'Do you want to exit this application?',
            style: TextStyle(fontSize: 14.0.sp),
          ),
          content: const Text('We hate to see you leave...'),
          actions: <Widget>[
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).pop(false);
              },
              child: const Text('No'),
            ),
            ElevatedButton(
              onPressed: () {
                logout();
              },
              child: const Text('Yes'),
            ),
          ],
        );
      },
    );
  }

  Future logout() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();

    try {
      sharedPreferences.setString("isLogin", "false");
      sharedPreferences.clear().then((value) {
        loginscreenController.emailId.clear();
        loginscreenController.password.clear();
      });

      Get.offNamed('/login');
    } catch (e) {
      rethrow;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      ListView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: menuoptions.length,
          itemBuilder: (context, index) {
            return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  InkWell(
                    onTap: () {
                      index >= menuscreens.length
                          ? exitApp(context)
                          : Get.toNamed("/${menuscreens[index].toString()}");
                    },
                    child: Padding(
                      padding: const EdgeInsets.only(
                          left: 10.0, right: 10.0, top: 0),
                      child: Container(
                        height: 8.0.hp,
                        width: 85.00.wp,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                        ),
                        padding: const EdgeInsets.only(
                            left: 10, bottom: 5, right: 10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(children: [
                              SizedBox(
                                height: 7.0.hp,
                                width: 6.0.wp,
                                child: Image.asset(
                                  images[index],
                                ),
                              ),
                              SizedBox(
                                width: 5.0.wp,
                              ),
                              Container(
                                color: Colors.transparent,
                                width: 60.0.wp,
                                child: Text(
                                  menuoptions[index],
                                  style: fourhundredtweleve,
                                ),
                              ),
                            ])
                          ],
                        ),
                      ),
                    ),
                  ),
                  index == 4
                      ? const SizedBox()
                      : Center(
                          child: Padding(
                            padding:
                                const EdgeInsets.only(left: 20.0, right: 20.0),
                            child: Divider(
                              height: 1.0.hp,
                            ),
                          ),
                        )
                ]);
          }),
    ]);
  }
}

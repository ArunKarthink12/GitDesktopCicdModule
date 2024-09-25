import 'package:doctor_module/const/colors.dart';
import 'package:doctor_module/const/responsive.dart';
import 'package:doctor_module/const/styleText.dart';
import 'package:doctor_module/controller/logincontroller/loginscreen_controller.dart';
import 'package:doctor_module/view/login/login_inputs.dart';
import 'package:doctor_module/widget/circle_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  LoginscreenController loginscreenController =
      Get.put(LoginscreenController());
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
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

  String asset = "images/Public_health.gif";
  AssetImage? image;

  @override
  void initState() {
    super.initState();
    image = AssetImage(asset);
    print('$asset initState');
  }

  @override
  void dispose() {
    print('$asset dispose');
    image!.evict();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: WillPopScope(
          onWillPop: () {
            return onWillPop();
          },
          child: SingleChildScrollView(
            child: SizedBox(
              height: MediaQuery.of(context).size.height,
              child: SafeArea(
                child: Column(
                  children: [
                    const SizedBox(),
                    SizedBox(
                      height: 35.0.hp,
                      child: SizedBox(
                        child: Image.asset("images/Public_health.gif"),
                      ),
                    ),
                    Text(
                      "WELCOME",
                      style: textstyle3,
                    ),
                    SizedBox(
                      height: 1.0.hp,
                    ),
                    Text(
                      "Please put your information below to  Login to your account",
                      textAlign: TextAlign.center,
                      style: textstyle3.copyWith(
                        fontWeight: FontWeight.w100,
                        fontSize: 10.0.sp,
                        color: Colors.grey,
                      ),
                    ),
                    SizedBox(
                      height: 5.0.hp,
                    ),
                    const LoginInputFields(),
                    const Expanded(child: SizedBox()),
                    multiButton(
                        height: 5.0.hp,
                        borderRadius: 7.0.sp,
                        multiwidget: Text("Login",
                            style: TextStyle(
                                fontSize: 12.0.sp,
                                color: Colors.white,
                                fontWeight: FontWeight.w700)),
                        width: MediaQuery.of(context).size.width - 30.0.wp,
                        bgcolor: appcolor,
                        onTap: () {
                          loginscreenController.loginController(
                              context: context);
                        }),
                    const Expanded(
                      child: SizedBox(),
                    )
                  ],
                ),
              ),
            ),
          )),
    );
  }
}

// ignore_for_file: prefer_const_constructors

import 'package:doctor_module/const/colors.dart';
import 'package:doctor_module/const/responsive.dart';
import 'package:doctor_module/controller/logincontroller/loginscreen_controller.dart';
import 'package:doctor_module/widget/circle_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ForgotPassword extends StatefulWidget {
  const ForgotPassword({super.key});

  @override
  State<ForgotPassword> createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {
  LoginscreenController loginscreenController =
      Get.put(LoginscreenController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        child: Center(
          child: Column(
            children: [
              circleContainer(color: appcolor),
              Text(
                "FORGOT PASSWORD",
                style: TextStyle(fontWeight: FontWeight.w700),
              ),
              Text("Enter the email address associated"),
              Text(" with your account"),
              SizedBox(
                height: 2.0.hp,
              ),
              Container(
                color: Colors.white,
                height: 7.0.hp,
                width: 90.0.wp,
                child: TextFormField(
                  controller: loginscreenController.emailId,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5.0),
                        borderSide: const BorderSide(color: appcolor, width: 1),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5.0),
                        borderSide: BorderSide(
                            color: const Color(0xffC6C6C6).withOpacity(0.5),
                            width: 1),
                      ),
                      fillColor: const Color(0xffC6C6C6),
                      hintText: 'Email id',
                      contentPadding: const EdgeInsets.only(left: 10),
                      border: const OutlineInputBorder(
                        gapPadding: 4,
                      )),
                ),
              ),
              Expanded(child: SizedBox()),
              multiButton(
                  height: 5.0.hp,
                  borderRadius: 7.0.sp,
                  multiwidget: Text("SEND OTP",
                      style: TextStyle(
                          fontSize: 12.0.sp,
                          color: Colors.white,
                          fontWeight: FontWeight.w700)),
                  width: MediaQuery.of(context).size.width - 30.0.wp,
                  bgcolor: appcolor,
                  onTap: () {
                    Get.toNamed("/forgototp");
                  }),
              SizedBox(
                height: 7.0.hp,
              )
            ],
          ),
        ),
      ),
    );
  }
}

// ignore_for_file: must_be_immutable

import 'package:doctor_module/const/colors.dart';
import 'package:doctor_module/const/responsive.dart';
import 'package:doctor_module/widget/circle_widget.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ForgotOTPScreen extends StatefulWidget {
  ForgotOTPScreen({Key? key, this.mobileNumber}) : super(key: key);
  String? mobileNumber;

  @override
  State<ForgotOTPScreen> createState() => _ForgotOTPScreenState();
}

class _ForgotOTPScreenState extends State<ForgotOTPScreen> {
  AssetImage? images;

  @override
  void initState() {
    super.initState();
    images = const AssetImage(
      "assets/img/enterOTP.gif",
    );
  }

  @override
  void dispose() {
    images!.evict();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
            child: SingleChildScrollView(
                child: Container(
                    decoration: const BoxDecoration(),
                    child: Center(
                      child: Column(children: [
                        circleContainer(color: appcolor),
                        SizedBox(
                          height: 6.0.hp,
                        ),
                        Text(
                          'Enter Verification Code'.toUpperCase(),
                        ),
                        SizedBox(height: 2.00.hp),
                        SizedBox(
                          width: MediaQuery.of(context).size.width * 0.8,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Flexible(
                                child: Text(
                                  '''Enter the verification code we just sent you on your email address''',
                                  textAlign: TextAlign.center,
                                  style: GoogleFonts.jost(
                                      textStyle: TextStyle(
                                          wordSpacing: 2,
                                          letterSpacing: 0.2,
                                          fontSize: 9.00.sp,
                                          fontWeight: FontWeight.w500)),
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height: 4.00.hp),
                        SizedBox(height: 2.00.hp),
                        GestureDetector(
                          onTap: () {},
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                'Don’t have an account?',
                                style: GoogleFonts.jost(
                                    textStyle: TextStyle(
                                        fontSize: 12.00.sp,
                                        color: const Color(0xff6F6F6F),
                                        fontWeight: FontWeight.w500)),
                              ),
                              Text(
                                'Register',
                                style: GoogleFonts.jost(
                                    textStyle: TextStyle(
                                        fontSize: 12.00.sp,
                                        color: appcolor,
                                        fontWeight: FontWeight.w600)),
                              )
                            ],
                          ),
                        ),
                        SizedBox(height: 1.00.hp),
                      ]),
                    )))));
  }
}

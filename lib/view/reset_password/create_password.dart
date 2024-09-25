import 'package:doctor_module/const/colors.dart';
import 'package:doctor_module/const/responsive.dart';
import 'package:doctor_module/view/login/login_screen.dart';
import 'package:doctor_module/view/reset_password/dummydetails.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import 'createpassword_inputfiels.dart';

class CreatenewPassword extends StatefulWidget {
  const CreatenewPassword({Key? key, this.email}) : super(key: key);
  final String? email;

  @override
  State<CreatenewPassword> createState() => _CreatenewPasswordState();
}

class _CreatenewPasswordState extends State<CreatenewPassword> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
            child: SingleChildScrollView(
      child: Column(
        children: [
          const DummyDetails(),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.03,
          ),
          CreateNewPasswordInputFields(email: widget.email.toString()),
          GestureDetector(
            onTap: () {
              Get.to(const LoginScreen());
            },
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
          SizedBox(height: 2.00.hp),
        ],
      ),
    )));
  }
}

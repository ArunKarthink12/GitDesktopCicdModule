// ignore_for_file: must_be_immutable

import 'package:doctor_module/const/colors.dart';
import 'package:doctor_module/const/responsive.dart';
import 'package:doctor_module/view/login/login_screen.dart';
import 'package:doctor_module/widget/circle_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CreateNewPasswordInputFields extends StatefulWidget {
  CreateNewPasswordInputFields({Key? key, this.email}) : super(key: key);
  String? email;
  @override
  State<CreateNewPasswordInputFields> createState() =>
      _CreateNewPasswordInputFieldsState();
}

class _CreateNewPasswordInputFieldsState
    extends State<CreateNewPasswordInputFields> {
  void _togglecnewPinView() {
    setState(() {
      _isPinnewHidden = !_isPinnewHidden;
    });
  }

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  bool _isPinnewHidden = true;

  var passwordcontroller = TextEditingController();
  bool _isPinconfirmHidden = true;

  var confirmpasswordcontroller = TextEditingController();

  void _toggleconfirmPinView() {
    setState(() {
      _isPinconfirmHidden = !_isPinconfirmHidden;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.only(
              left: 23,
              right: 25,
            ),
            child: TextFormField(
              obscureText: _isPinnewHidden,
              decoration: InputDecoration(
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5.0),
                    borderSide:
                        const BorderSide(color: Color(0xFFDDDCDC), width: 0.5),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5.0),
                    borderSide:
                        const BorderSide(color: Color(0xFFDDDCDC), width: 1),
                  ),
                  hintText: 'New Password',
                  contentPadding: const EdgeInsets.all(0),
                  suffixIcon: InkWell(
                    onTap: _togglecnewPinView,
                    child: Icon(
                      _isPinnewHidden
                          ? Icons.visibility_outlined
                          : Icons.visibility_off_outlined,
                      size: MediaQuery.of(context).size.height * 0.03,
                      color: const Color(0xff292D32),
                    ),
                  ),
                  border: const OutlineInputBorder(
                    gapPadding: 4,
                  )),
            ),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.03,
          ),
          Container(
            padding: const EdgeInsets.only(
              left: 23,
              right: 25,
            ),
            child: TextFormField(
              obscureText: _isPinconfirmHidden,
              decoration: InputDecoration(
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5.0),
                    borderSide:
                        const BorderSide(color: Color(0xFFDDDCDC), width: 0.5),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5.0),
                    borderSide:
                        const BorderSide(color: Color(0xFFDDDCDC), width: 1),
                  ),
                  hintText: 'Confirm New Password',
                  contentPadding: const EdgeInsets.all(0),
                  suffixIcon: InkWell(
                    onTap: _toggleconfirmPinView,
                    child: Icon(
                      _isPinconfirmHidden
                          ? Icons.visibility_outlined
                          : Icons.visibility_off_outlined,
                      size: MediaQuery.of(context).size.height * 0.03,
                      color: const Color(0xff292D32),
                    ),
                  ),
                  border: const OutlineInputBorder(
                    gapPadding: 4,
                  )),
            ),
          ),
          SizedBox(
            height: 22.0.hp,
          ),
          multiButton(
              height: 5.0.hp,
              borderRadius: 7.0.sp,
              multiwidget: Text("VERIFY",
                  style: TextStyle(
                      fontSize: 12.0.sp,
                      color: Colors.white,
                      fontWeight: FontWeight.w700)),
              width: MediaQuery.of(context).size.width - 30.0.wp,
              bgcolor: appcolor,
              onTap: () {
                Get.to(const LoginScreen());
              }),
          SizedBox(
            height: 2.0.hp,
          )
        ],
      ),
    );
  }
}

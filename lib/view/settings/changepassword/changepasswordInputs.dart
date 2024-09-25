import 'package:doctor_module/const/colors.dart';
import 'package:doctor_module/const/responsive.dart';
import 'package:doctor_module/const/styleText.dart';
import 'package:doctor_module/widget/circle_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class ChangePasswordInputFields extends StatefulWidget {
  const ChangePasswordInputFields({Key? key}) : super(key: key);

  @override
  State<ChangePasswordInputFields> createState() =>
      _ChangePasswordInputFieldsState();
}

class _ChangePasswordInputFieldsState extends State<ChangePasswordInputFields> {
  @override
  void initState() {
    super.initState();
  }

  void _togglecnewPinView() {
    setState(() {
      _isPinnewHidden = !_isPinnewHidden;
    });
  }

  bool _isPinnewHidden = true;

  var passwordcontroller = TextEditingController();
  bool _isPinconfirmHidden = true;

  void _toggleconfirmPinView() {
    setState(() {
      _isPinconfirmHidden = !_isPinconfirmHidden;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Center(
          child: Container(
            height: 6.0.hp,
            width: 90.0.wp,
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(5)),
            child: TextFormField(
              obscureText: _isPinconfirmHidden,
              controller: passwordcontroller,
              decoration: InputDecoration(
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5.0),
                    borderSide: const BorderSide(width: 0.5),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5.0),
                    borderSide: const BorderSide(width: 1),
                  ),
                  hintText: 'Old Password',
                  hintStyle: hintstyle,
                  contentPadding: const EdgeInsets.all(0),
                  suffixIcon: InkWell(
                    onTap: _toggleconfirmPinView,
                    child: Icon(
                      _isPinconfirmHidden
                          ? Icons.visibility_outlined
                          : Icons.visibility_off_outlined,
                      size: MediaQuery.of(context).size.height * 0.03,
                      color: Colors.black,
                    ),
                  ),
                  prefixIcon: const Icon(Icons.lock_outline),
                  border: const OutlineInputBorder(
                    gapPadding: 4,
                  )),
            ),
          ),
        ),
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.03,
        ),
        Center(
          child: Container(
            height: 6.0.hp,
            width: 90.0.wp,
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(5)),
            child: TextFormField(
              obscureText: _isPinconfirmHidden,
              decoration: InputDecoration(
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5.0),
                    borderSide: const BorderSide(width: 0.5),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5.0),
                    borderSide: const BorderSide(width: 1),
                  ),
                  hintText: 'New Password',
                  contentPadding: const EdgeInsets.all(0),
                  hintStyle: hintstyle,
                  suffixIcon: InkWell(
                    onTap: _toggleconfirmPinView,
                    child: Icon(
                      _isPinconfirmHidden
                          ? Icons.visibility_outlined
                          : Icons.visibility_off_outlined,
                      size: MediaQuery.of(context).size.height * 0.03,
                      color: Colors.black,
                    ),
                  ),
                  prefixIcon: const Icon(Icons.lock_outline),
                  border: const OutlineInputBorder(
                    gapPadding: 4,
                  )),
            ),
          ),
        ),
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.03,
        ),
        Center(
          child: Container(
            height: 6.0.hp,
            width: 90.0.wp,
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(5)),
            child: TextFormField(
              obscureText: _isPinconfirmHidden,
              decoration: InputDecoration(
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5.0),
                    borderSide: const BorderSide(width: 0.5),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5.0),
                    borderSide: const BorderSide(width: 1),
                  ),
                  hintText: 'New Confirm Password',
                  contentPadding: const EdgeInsets.all(0),
                  hintStyle: hintstyle,
                  suffixIcon: InkWell(
                    onTap: _toggleconfirmPinView,
                    child: Icon(
                      _isPinconfirmHidden
                          ? Icons.visibility_outlined
                          : Icons.visibility_off_outlined,
                      size: MediaQuery.of(context).size.height * 0.03,
                      color: Colors.black,
                    ),
                  ),
                  prefixIcon: const Icon(Icons.lock_outline),
                  border: const OutlineInputBorder(
                    gapPadding: 4,
                  )),
            ),
          ),
        ),
        SizedBox(
          height: 40.00.hp,
        ),
        multiButton(
            onTap: () {
              Get.back();
            },
            bgcolor: appcolor,
            borderRadius: 10.0.sp,
            height: 5.5.hp,
            width: MediaQuery.of(context).size.width - 15.0.wp,
            multiwidget: Text(
              "SAVE CHANGES",
              style: GoogleFonts.jost(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 12.0.sp),
            ))
      ],
    );
  }
}

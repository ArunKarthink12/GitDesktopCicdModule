import 'package:doctor_module/const/colors.dart';
import 'package:doctor_module/const/responsive.dart';
import 'package:doctor_module/const/styleText.dart';
import 'package:doctor_module/widget/circle_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class PrescriptionScreen extends StatefulWidget {
  const PrescriptionScreen({super.key});

  @override
  State<PrescriptionScreen> createState() => _PrescriptionScreenState();
}

class _PrescriptionScreenState extends State<PrescriptionScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          elevation: 0,
          backgroundColor: Colors.white,
          leading: InkWell(
            onTap: () {
              Get.back();
            },
            child: const Icon(
              Icons.arrow_back,
            ),
          ),
          title: Text(
            'ADD DETAILS',
            style: header,
          ),
        ),
        body: SingleChildScrollView(
          child: Container(
            decoration: const BoxDecoration(),
            child: Padding(
              padding: const EdgeInsets.only(
                left: 20.0,
                right: 20,
                top: 10,
              ),
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 10.0.hp,
                      width: 100.0.wp,
                      child: ListTile(
                        minLeadingWidth: 12.0.wp,
                        leading: const CircleAvatar(
                          radius: 25,
                        ),
                        title: Text(
                          'John Clinic',
                          style: textstyle3,
                        ),
                        subtitle: Padding(
                          padding: const EdgeInsets.only(top: 8.0),
                          child: Text(
                            '456 Pradhan Thiru, No. 789, Perunagar, Tamil Nadu 600028',
                            style: textstyle3.copyWith(
                                fontSize: 8.0.sp,
                                fontWeight: FontWeight.normal,
                                color: Colors.grey),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 3.0.hp,
                    ),
                    const Text(
                      'Add Prescription',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: 2.0.hp,
                    ),
                    Container(
                      color: Colors.white,
                      height: 25.00.hp,
                      width: 100.00.wp,
                      child: TextFormField(
                        maxLines: 20,
                        decoration: InputDecoration(
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(5.0),
                              borderSide: const BorderSide(
                                  color: Colors.green, width: 0.5),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(5.0),
                              borderSide: const BorderSide(
                                  color: Colors.grey, width: 1),
                            ),
                            hintText: 'Type Here',
                            contentPadding:
                                const EdgeInsets.only(left: 10, top: 20),
                            border: const OutlineInputBorder(
                              gapPadding: 4,
                            )),
                      ),
                    ),
                    SizedBox(
                      height: 3.0.hp,
                    ),
                    const Text(
                      'Notes (If Any)',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: 2.0.hp,
                    ),
                    Container(
                      color: Colors.white,
                      height: 20.00.hp,
                      width: 100.00.wp,
                      child: TextFormField(
                        maxLines: 10,
                        decoration: InputDecoration(
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(5.0),
                              borderSide: const BorderSide(
                                  color: Colors.grey, width: 0.5),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(5.0),
                              borderSide: const BorderSide(
                                  color: Colors.grey, width: 1),
                            ),
                            hintText: 'Type Here',
                            contentPadding:
                                const EdgeInsets.only(left: 10, top: 20),
                            border: const OutlineInputBorder(
                              gapPadding: 4,
                            )),
                      ),
                    ),
                    SizedBox(
                      height: 5.0.hp,
                    ),
                    Image.asset(
                      'assets/images/sign.png',
                      height: 7.0.hp,
                    ),
                    SizedBox(
                      height: 3.0.hp,
                    ),
                    const Text(
                      'Signature',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: 5.0.hp,
                    ),
                    Center(
                      child: multiButton(
                          onTap: () {
                            Get.back();
                          },
                          bgcolor: appcolor,
                          borderRadius: 10.0.sp,
                          height: 4.5.hp,
                          width: MediaQuery.of(context).size.width - 20.0.wp,
                          multiwidget: Text(
                            "DONE",
                            style: GoogleFonts.jost(
                                color: Colors.white,
                                fontWeight: FontWeight.w700,
                                fontSize: 14.0.sp),
                          )),
                    ),
                    SizedBox(
                      height: 3.0.hp,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ));
  }
}

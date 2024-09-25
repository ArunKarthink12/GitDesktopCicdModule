import 'package:doctor_module/const/colors.dart';
import 'package:doctor_module/const/responsive.dart';
import 'package:doctor_module/const/styleText.dart';
import 'package:doctor_module/controller/personaldetailscontroller/personaldetailscontroller.dart';
import 'package:doctor_module/widget/circle_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class PersonalDetails extends StatefulWidget {
  const PersonalDetails({super.key});

  @override
  State<PersonalDetails> createState() => _PersonalDetailsState();
}

class _PersonalDetailsState extends State<PersonalDetails> {
  Personaldetailscontroller personalDetailsController =
      Get.put(Personaldetailscontroller());
  var genderlist = ['Male', 'Female', 'I don\'t know'];

  var selectedindex = 0;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          elevation: 0,
          centerTitle: true,
          leading: InkWell(
            onTap: () {
              Get.back();
            },
            child: const Icon(
              Icons.arrow_back,
              color: Colors.black,
            ),
          ),
          title: Text(
            'PERSONAL DETAILS',
            style: header,
          ),
        ),
        body: Obx(() {
          return Padding(
              padding: const EdgeInsets.only(left: 20.0, right: 20.0, top: 20),
              child: SingleChildScrollView(
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const CircleAvatar(
                            radius: 30,
                          ),
                          SizedBox(width: 2.0.wp),
                          Container(
                            height: 7.0.hp,
                            width: 70.0.wp,
                            decoration: BoxDecoration(
                                color: screenbackground,
                                borderRadius: BorderRadius.circular(5)),
                            child: ListTile(
                              leading: const Icon(Icons.camera_alt_outlined),
                              title: Text(
                                'Change Profile Picture',
                                style: GoogleFonts.jost(
                                    textStyle: const TextStyle(
                                        letterSpacing: 0.2,
                                        fontSize: 14.00,
                                        color: Color(0xff18273B),
                                        fontWeight: FontWeight.w500)),
                              ),
                            ),
                          )
                        ],
                      ),
                      SizedBox(
                        height: 4.0.hp,
                      ),
                      Center(
                        child: Container(
                          height: 8.00.hp,
                          width: 90.00.wp,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            color: screenbackground,
                          ),
                          child: Wrap(
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(
                                  left: 10.0,
                                ),
                                child: Text(
                                  'Qualification',
                                  style: forminputstyle,
                                ),
                              ),
                              SizedBox(
                                height: 8.0.hp,
                                width: 70.0.wp,
                                child: TextFormField(
                                  textInputAction: TextInputAction.next,
                                  keyboardType: TextInputType.emailAddress,
                                  decoration: InputDecoration(
                                    focusedBorder: OutlineInputBorder(
                                      borderSide: BorderSide.none,
                                      borderRadius: BorderRadius.circular(5.0),
                                    ),
                                    enabledBorder: OutlineInputBorder(
                                      borderSide: BorderSide.none,
                                      borderRadius: BorderRadius.circular(5.0),
                                    ),
                                    hintText: personalDetailsController
                                        .qualification.value
                                        .toString(),
                                    hintStyle: fourhundredtweleve,
                                    contentPadding: const EdgeInsets.only(
                                      left: 10,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 4.0.hp,
                      ),
                      Text(
                        'Gender',
                        style: sixhundredtweleve,
                      ),
                      SizedBox(
                        height: 7.0.hp,
                        width: 100.0.wp,
                        child: ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemCount: 3,
                            itemBuilder: (context, index) {
                              return Stack(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(
                                      left: 0.0,
                                    ),
                                    child: Row(
                                      children: [
                                        InkWell(
                                          onTap: () {
                                            setState(() {
                                              selectedindex = index;
                                            });
                                          },
                                          child: Container(
                                            height: 5.0.hp,
                                            width: 5.0.wp,
                                            decoration: BoxDecoration(
                                                shape: BoxShape.circle,
                                                border: Border.all(
                                                    color: appcolor)),
                                          ),
                                        ),
                                        SizedBox(
                                          width: 1.0.wp,
                                        ),
                                        Text(
                                          genderlist[index],
                                          style: fourhundredtweleve,
                                        ),
                                        SizedBox(
                                          width: 3.0.wp,
                                        ),
                                      ],
                                    ),
                                  ),
                                  selectedindex == index
                                      ? Positioned(
                                          top: 1.5.hp,
                                          left: 1.0.wp,
                                          child: Container(
                                            height: 2.0.hp,
                                            width: 3.0.wp,
                                            decoration: const BoxDecoration(
                                              shape: BoxShape.circle,
                                              gradient: LinearGradient(
                                                begin: Alignment.topRight,
                                                end: Alignment.bottomLeft,
                                                colors: [
                                                  Color(0xff0F52BA),
                                                  Color(0xff003586)
                                                ],
                                              ),
                                            ),
                                          ),
                                        )
                                      : Container()
                                ],
                              );
                            }),
                      ),
                      SizedBox(
                        height: 4.0.hp,
                      ),
                      Center(
                        child: Container(
                          height: 8.00.hp,
                          width: 90.0.wp,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            color: screenbackground,
                          ),
                          child: TextFormField(
                            textInputAction: TextInputAction.next,
                            keyboardType: TextInputType.emailAddress,
                            decoration: InputDecoration(
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide.none,
                                borderRadius: BorderRadius.circular(5.0),
                              ),
                              prefixIcon: const Icon(Icons.call),
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide.none,
                                borderRadius: BorderRadius.circular(5.0),
                              ),
                              hintText:
                                  '+ 91 ${personalDetailsController.mobile_num.value.toString()}',
                              hintStyle: hintstyle,
                              contentPadding: const EdgeInsets.only(
                                left: 10,
                              ),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 15.0.hp,
                      ),
                      multiButton(
                        onTap: () {},
                        bgcolor: appcolor,
                        borderRadius: 8.0.sp,
                        height: 5.0.hp,
                        multiwidget: Text("SAVE CHANGES",
                            style: GoogleFonts.jost(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 10.0.sp,
                            )),
                      )
                    ]),
              ));
        }));
  }
}

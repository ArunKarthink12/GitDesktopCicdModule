import 'package:doctor_module/const/colors.dart';
import 'package:doctor_module/const/responsive.dart';
import 'package:doctor_module/model/test_details_model.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class FlagWidget {
  Widget warningAmber() {
    return GestureDetector(
      onTap: () {
        Fluttertoast.showToast(msg: "Report Status is empty Please Re-Check");
      },
      child: CircleAvatar(
          backgroundColor: Colors.transparent,
          radius: 10.0.sp,
          child: Center(
            child: Icon(
              Icons.info_outlined,
              color: Colors.yellow,
              size: 22.0.sp,
            ),
          )),
    );
  }

  Widget patientStatus(index, TestDetailsmodel data, innerIndex, context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      color: Colors.white,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Container(
              width: MediaQuery.of(context).size.width / 2.5,
              color: Colors.white,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Icon(
                    Icons.flag,
                    color: recallFlagcolor.withOpacity(
                        data.lstvisit.first.lstorderlist[index].isrecall == true
                            ? 1
                            : 0.1),
                  ),
                  Icon(
                    Icons.flag,
                    color: recheckFlagcolor.withOpacity(
                        data.lstvisit.first.lstorderlist[index].isrecheck ==
                                true
                            ? 1
                            : 0.1),
                  ),
                  Icon(
                    Icons.flag,
                    color: rerunFlagcolor.withOpacity(
                        data.lstvisit.first.lstorderlist[index].isrerun == true
                            ? 1
                            : 0.1),
                  ),
                  Icon(
                    Icons.flag,
                    color: Colors.yellow.withOpacity(
                        data.lstvisit.first.lstorderlist[index].isrecollect ==
                                true
                            ? 1
                            : 0.1),
                  )
                ],
              )),
          Container(
            width: MediaQuery.of(context).size.width / 2.5,
            color: Colors.white,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                // Column(
                //   children: data
                //       .lstvisit.first.lstorderlist[index].lstorderdetail
                //       .map<Widget>((element) {

                // return
                Transform.rotate(
                  angle: 45,
                  child: Icon(
                    Icons.power,
                    size: 20.0.sp,
                    color: data.lstvisit.first.lstorderlist[index]
                                .lstorderdetail[innerIndex].diresult ==
                            ""
                        ? interfaceFlagcolor.withOpacity(0.2)
                        : interfaceFlagcolor.withOpacity(1.0),
                  ),
                ),
                //   }).toList(),
                // ),
                Icon(
                  Icons.hourglass_bottom_outlined, // Using hourglass_full icon
                  size: 16.0.sp,
                  color: Colors.red.withOpacity(
                      data.lstvisit.first.lstorderlist[index].istat == true
                          ? 1
                          : 0.1),
                ),
                Icon(
                  Icons
                      .group_rounded, // Using group icon to replicate fa fa-users
                  size: 16.0.sp,
                  color: outsource.withOpacity(
                      data.lstvisit.first.lstorderlist[index].isoutsource ==
                              true
                          ? 1
                          : 0.1),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}

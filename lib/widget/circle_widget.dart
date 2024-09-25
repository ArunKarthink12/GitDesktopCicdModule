import 'package:doctor_module/const/colors.dart';
import 'package:doctor_module/const/responsive.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';

Widget circleContainer({color}) {
  return Container(
    height: 30.0.hp,
    width: 30.0.wp,
    decoration: BoxDecoration(
      shape: BoxShape.circle,
      color: color,
    ),
  );
}

Widget multiButton({
  Widget? multiwidget,
  height,
  width,
  borderRadius,
  bgcolor,
  required void Function() onTap,
}) {
  return GestureDetector(
    onTap: onTap,
    child: Container(
      height: height,
      width: width,
      decoration: BoxDecoration(
        color: bgcolor,
        borderRadius: BorderRadius.all(Radius.circular(borderRadius)),
      ),
      alignment: Alignment.center,
      child: multiwidget,
    ),
  );
}

islogin() async {
  Get.toNamed("/bottomnavibar");
}

errorToast(title) {
  Fluttertoast.showToast(msg: title, backgroundColor: appcolor);
}

Object? loginToasterAlert({context, title, color, icon}) {
  return title == "Success"
      ? islogin()
      : ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          backgroundColor: color,
          content: Row(
            children: [
              Icon(icon, color: Colors.white),
              const SizedBox(width: 10),
              Text(title.toString(),
                  style: const TextStyle(color: Colors.white)),
            ],
          ),
        ));
}
